using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using Object = UnityEngine.Object;

namespace Reallusion.Import
{
    public class AnimRetargetGUI
    {
        // GUI variables
        static Texture2D handImage;
        static Texture2D closedMouthImage;
        static Texture2D openMouthImage;
        static Texture2D blendshapeImage;
        static Texture2D saveImage;
        static Texture2D resetImage;

        static float baseControlWidth = 173f;
        static float sliderWidth = 303f;
        static float textWidth = 66f;
        static float textHeight = 18f;
        static float largeIconDim = 60f;
        static float smallIconDim = 30f;

        static float shRange = 45f; // Angular Ranges in degrees
        static float aRange = 45f;
        static float lRange = 45f;
        static float hRange = 45f;

        static float yRange = 0.5f; //Raw y input range

        // GUI Control variables (Reset to this state)
        
        static int handPose = 0;
        static bool closeMouth = false;
        static float shoulderOffset = 0f;
        static float armOffset = 0f;
        static float backgroundArmOffset = 0f;
        static float legOffset = 0f;
        static float heelOffset = 0f;
        static float heightOffset = 0f;

        static AnimationClip originalClip;
        static AnimationClip workingClip;
        static Animator animator;

        static Vector3 animatorPosition;
        static Quaternion animatorRotation;


        // Function variables
        static string emptyGuid = "00000000000000000000000000000000";

        static Dictionary<string, EditorCurveBinding> shoulderBindings;
        static Dictionary<string, EditorCurveBinding> armBindings;
        static Dictionary<string, EditorCurveBinding> legBindings;
        static Dictionary<string, EditorCurveBinding> heelBindings;
        static Dictionary<string, EditorCurveBinding> heightBindings;

        public static void CreateRetargeter(AnimationClip clip, GameObject model)//(PreviewScene ps, GameObject fbx)
        {            
            originalClip = clip;
            animator = model.GetComponent<Animator>();
            //if (ps.IsValid)
            //{
            //SetCharacter(ps, fbx);
            //}

#if SCENEVIEW_OVERLAY_COMPATIBLE
            //2021.2.0a17+  When GUI.Window is called from a static SceneView delegate, it is broken in 2021.2.0f1 - 2021.2.1f1
            //so we switch to overlays starting from an earlier version
            if (AnimRetargetOverlay.exists)
                AnimRetargetOverlay.createdOverlay.Show();
#else
            //2020 LTS            
            AnimRetargetWindow.ShowPlayer();
#endif            

            //Common
            Init();

            SceneView.RepaintAll();
        }

        public static void DestroyRetargeter()
        {
            //EditorApplication.update -= UpdateDelegate;

            //if (AnimationMode.InAnimationMode())
            //    AnimationMode.StopAnimationMode();

#if SCENEVIEW_OVERLAY_COMPATIBLE
            //2021.2.0a17+          
            if (AnimRetargetOverlay.exists)
                AnimRetargetOverlay.createdOverlay.Hide();
#else
            //2020 LTS            
            AnimRetargetWindow.HidePlayer();            
#endif            

            //Common
            CleanUp();

            SceneView.RepaintAll();
        }

        public static bool IsPlayerShown()
        {
#if SCENEVIEW_OVERLAY_COMPATIBLE
            //2021.2.0a17+
            return AnimRetargetOverlay.createdOverlay.visible;
#else
            //2020 LTS            
            return AnimRetargetWindow.isShown;
#endif
        }

        static void Init()
        {
            string[] folders = new string[] { "Assets", "Packages" };
            closedMouthImage = Reallusion.Import.Util.FindTexture(folders, "RLIcon_Mask_Closed");
            openMouthImage = Reallusion.Import.Util.FindTexture(folders, "RLIcon_Mask_Open");
            handImage = Reallusion.Import.Util.FindTexture(folders, "RLIcon_Hand");
            blendshapeImage = Reallusion.Import.Util.FindTexture(folders, "RLIcon_Masks");
            saveImage = Reallusion.Import.Util.FindTexture(folders, "RLIcon_Save");
            resetImage = Reallusion.Import.Util.FindTexture(folders, "RLIcon_Refresh");

            Reselect();
            Reset();
        }

        public static void Reselect()
        {
            originalClip = WindowManager.GetSelectedAnimation();
            workingClip = WindowManager.GetWorkingAnimation();
            animator = WindowManager.GetSceneAnimator();

            Debug.Log("RESELECTING: " + originalClip.name + " " + workingClip.name + " " + animator.name);

            Reset();
        }

        static void CleanUp()
        {

        }

        // Return all values to start - re-create working clip - rebuild all bindings dicts
        static void Reset()
        {
            handPose = 0;
            closeMouth = false;
            shoulderOffset = 0f;
            armOffset = 0f;
            backgroundArmOffset = 0f;
            legOffset = 0f;
            heelOffset = 0f;
            heightOffset = 0f;

            //var clone = Object.Instantiate(originalClip);            
            //workingClip = clone as AnimationClip;

            if (CanClipLoop(workingClip))
            {
                AnimationClipSettings clipSettings = AnimationUtility.GetAnimationClipSettings(workingClip);
                if (!clipSettings.loopTime)
                {
                    clipSettings.loopTime = true;
                    AnimationUtility.SetAnimationClipSettings(workingClip, clipSettings);
                }
            }
            EditorCurveBinding[] curveBindings = AnimationUtility.GetCurveBindings(originalClip);
            
            shoulderBindings = new Dictionary<string, EditorCurveBinding>();
            
            for (int i = 0; i < curveBindings.Length; i++)
            {
                if (shoulderCurveNames.Contains(curveBindings[i].propertyName))
                {
                    shoulderBindings.Add(curveBindings[i].propertyName, curveBindings[i]);
                }
            }
                        
            armBindings = new Dictionary<string, EditorCurveBinding>();
            
            for (int i = 0; i < curveBindings.Length; i++)
            {
                if (armCurveNames.Contains(curveBindings[i].propertyName))
                {
                    armBindings.Add(curveBindings[i].propertyName, curveBindings[i]);
                }
            }
                        
            legBindings = new Dictionary<string, EditorCurveBinding>();
            
            for (int i = 0; i < curveBindings.Length; i++)
            {
                if (legCurveNames.Contains(curveBindings[i].propertyName))
                {
                    legBindings.Add(curveBindings[i].propertyName, curveBindings[i]);
                }
            }
                        
            heelBindings = new Dictionary<string, EditorCurveBinding>();
            
            for (int i = 0; i < curveBindings.Length; i++)
            {
                if (heelCurveNames.Contains(curveBindings[i].propertyName))
                {
                    heelBindings.Add(curveBindings[i].propertyName, curveBindings[i]);
                }
            }
                        
            heightBindings = new Dictionary<string, EditorCurveBinding>();
            
            for (int i = 0; i < curveBindings.Length; i++)
            {
                if (heightCurveNames.Contains(curveBindings[i].propertyName))
                {
                    heightBindings.Add(curveBindings[i].propertyName, curveBindings[i]);
                }
            }
        }

        public static void DrawRetargeter()
        {
            // All retarget controls
            GUILayout.BeginVertical();
            // Horizontal Group of 3 controls `Hand` `Jaw` and `Blendshapes`
            //EditorGUI.BeginDisabledGroup(!AnimationMode.InAnimationMode());
            GUILayout.BeginHorizontal();
            GUILayout.BeginVertical("box", GUILayout.Width(baseControlWidth));  // Hand control box - Width used to impose layout footprint for overlay
            GUILayout.BeginHorizontal();
            if (GUILayout.Button(new GUIContent(handImage, "Switch between hand modes - Original animation info - Static open hand pose - Static closed hand pose. (This only affects pose of the fingers)."), GUILayout.Width(largeIconDim), GUILayout.Height(largeIconDim)))
            {
                handPose++;
                if (handPose > 2) handPose = 0;
                ApplyPose(handPose);
                AnimPlayerGUI.SampleOnce();
            }
            GUILayout.BeginVertical();

            GUIStyle radioSelectionStyle = new GUIStyle(EditorStyles.radioButton);
            radioSelectionStyle.padding = new RectOffset(24, 0, 0, 0);
            GUIContent[] contents = new GUIContent[]
            {
            new GUIContent("Original", "Use the hand pose/animation from the original animation clip."),
            new GUIContent("Open", "Use a static neutral open hand pose for the full animation clip."),
            new GUIContent("Closed", "Use a static neutral closed hand pose for the full animation clip.")
            };
            EditorGUI.BeginChangeCheck();
            handPose = GUILayout.SelectionGrid(handPose, contents, 1, radioSelectionStyle);
            if (EditorGUI.EndChangeCheck())
            {
                ApplyPose(handPose);
                AnimPlayerGUI.SampleOnce();
            }
            GUILayout.EndVertical();
            GUILayout.EndHorizontal();
            GUILayout.EndVertical(); // End of Hand control


            GUILayout.BeginVertical("box"); // Jaw control box       
            if (GUILayout.Button(new GUIContent(closeMouth ? closedMouthImage : openMouthImage, string.Format("STATUS: " + (closeMouth ? "ON" : "OFF") + ":  Toggle to CLOSE THE JAW of any animation imported without proper jaw information.  Toggling this ON will overwrite any jaw animation.  Toggling OFF will use the jaw animation from the selected animation clip.")), GUILayout.Width(largeIconDim), GUILayout.Height(largeIconDim)))
            {
                closeMouth = !closeMouth;
                CloseMouthToggle(closeMouth);
                AnimPlayerGUI.SampleOnce();
            }
            GUILayout.EndVertical(); // End of Jaw control

            GUILayout.BeginVertical("box"); // Blendshapes control box
            if (GUILayout.Button(new GUIContent(blendshapeImage, "Copy all BlendShape animations from the selected animation clip to all of the relevant objects (e.g. facial hair) in the selected Scene Model."), GUILayout.Width(largeIconDim), GUILayout.Height(largeIconDim)))
            {
                RetargetBlendShapes();
                AnimPlayerGUI.SampleOnce();
            }
            GUILayout.EndVertical();
            GUILayout.EndHorizontal(); // End of Blendshapes control

            // Control box for animation curve adjustment sliders
            GUILayout.BeginVertical("box");

            EditorGUI.BeginChangeCheck();
            GUILayout.BeginHorizontal(GUILayout.Width(sliderWidth));
            GUILayout.Label(new GUIContent("Shoulder", "Adjust the Up-Down displacement of the Shoulders across the whole animation."), GUILayout.Width(textWidth), GUILayout.Height(textHeight));
            shoulderOffset = EditorGUILayout.Slider(shoulderOffset, -shRange, shRange);
            GUILayout.EndHorizontal();
            if (EditorGUI.EndChangeCheck())
            {
                OffsetShoulders();
                animator.gameObject.transform.position = animatorPosition;
                animator.gameObject.transform.rotation = animatorRotation;
                AnimPlayerGUI.SampleOnce();
            }

            EditorGUI.BeginChangeCheck();
            GUILayout.BeginHorizontal(GUILayout.Width(sliderWidth));
            GUILayout.Label(new GUIContent("Arm", "Adjust the Upper Arm Up-Down rotation. Controls the 'lift' of the arms."), GUILayout.Width(textWidth), GUILayout.Height(textHeight));
            armOffset = EditorGUILayout.Slider(armOffset, -aRange, aRange);
            GUILayout.EndHorizontal();
            if (EditorGUI.EndChangeCheck())
            {
                OffsetArms();
                animator.gameObject.transform.position = animatorPosition;
                animator.gameObject.transform.rotation = animatorRotation;
                AnimPlayerGUI.SampleOnce();
            }

            EditorGUI.BeginChangeCheck();
            GUILayout.BeginHorizontal(GUILayout.Width(sliderWidth));
            GUILayout.Label(new GUIContent("Leg", "Adjust the Upper Leg In-Out rotation. Controls the width of the character's stance."), GUILayout.Width(textWidth), GUILayout.Height(textHeight));
            legOffset = EditorGUILayout.Slider(legOffset, -lRange, lRange);
            GUILayout.EndHorizontal();
            if (EditorGUI.EndChangeCheck())
            {
                OffsetLegs();
                animator.gameObject.transform.position = animatorPosition;
                animator.gameObject.transform.rotation = animatorRotation;
                AnimPlayerGUI.SampleOnce();
            }

            EditorGUI.BeginChangeCheck();
            GUILayout.BeginHorizontal(GUILayout.Width(sliderWidth));
            GUILayout.Label(new GUIContent("Heel", "Ajdust the angle of the Foot Up-Down rotation. Controls the angle of the heel."), GUILayout.Width(textWidth), GUILayout.Height(textHeight));
            heelOffset = EditorGUILayout.Slider(heelOffset, -hRange, hRange);
            GUILayout.EndHorizontal();
            if (EditorGUI.EndChangeCheck())
            {
                OffsetHeel();
                animator.gameObject.transform.position = animatorPosition;
                animator.gameObject.transform.rotation = animatorRotation;
                AnimPlayerGUI.SampleOnce();
            }

            EditorGUI.BeginChangeCheck();
            GUILayout.BeginHorizontal(GUILayout.Width(sliderWidth));
            GUILayout.Label(new GUIContent("Height", "Adjust the vertical 'y' displacement of the character."), GUILayout.Width(textWidth), GUILayout.Height(textHeight));
            heightOffset = EditorGUILayout.Slider(heightOffset, -yRange, yRange);
            GUILayout.EndHorizontal();
            if (EditorGUI.EndChangeCheck())
            {
                OffsetHeight();
                //ApplyOffset();
                animator.gameObject.transform.position = animatorPosition;
                animator.gameObject.transform.rotation = animatorRotation;
                AnimPlayerGUI.SampleOnce();
            }
            GUILayout.EndVertical(); // End of animation curve adjustment sliders

            // Lower close, reset and save controls
            GUILayout.BeginHorizontal();
            GUILayout.BeginVertical("box");  // close button
            if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("d_winbtn_win_close_a@2x").image, "Close this window."), GUILayout.Width(smallIconDim), GUILayout.Height(smallIconDim)))
            {
                DestroyRetargeter();
            }
            GUILayout.EndVertical();
            GUILayout.FlexibleSpace();
            GUILayout.BeginVertical("box");  // reset button
            if (GUILayout.Button(new GUIContent(resetImage, "Reset all slider settings and applied modifications."), GUILayout.Width(smallIconDim), GUILayout.Height(smallIconDim)))
            {                
                Reselect();
                // Not works
                animator.gameObject.transform.position = animatorPosition;
                animator.gameObject.transform.rotation = animatorRotation;
                AnimPlayerGUI.SampleOnce();
            }
            GUILayout.EndVertical();
            GUILayout.BeginVertical("box"); // save button
            if (GUILayout.Button(new GUIContent(saveImage, "Save the modified animation to the 'Project Assets'.  This will create a new animation in the 'Home Directory' of the selected model named <Model Name>_<Animation Name>.anim"), GUILayout.Width(smallIconDim), GUILayout.Height(smallIconDim)))
            {
                WriteAnimationToAssetDatabase();
            }
            GUILayout.EndVertical();
            GUILayout.EndHorizontal(); // End of reset and save controls

            GUILayout.EndVertical();
            // End of retarget controls
        }

        static bool CanClipLoop(AnimationClip clip)
        {
            bool canLoop = true;
            EditorCurveBinding[] curveBindings = AnimationUtility.GetCurveBindings(clip);
            foreach (EditorCurveBinding binding in curveBindings)
            {
                Keyframe[] testKeys = AnimationUtility.GetEditorCurve(clip, binding).keys;
                //Debug.Log(Math.Round(testKeys[0].value, 3) + " -- " + Math.Round(testKeys[testKeys.Length - 1].value, 3) + " --- " + (Math.Round(testKeys[0].value, 3) != Math.Round(testKeys[testKeys.Length - 1].value, 3)));
                if (Math.Round(testKeys[0].value, 2) != Math.Round(testKeys[testKeys.Length - 1].value, 2))
                {
                    canLoop = false;
                    //Debug.Log(binding.propertyName + " 0: " + testKeys[0].value + " last: " + testKeys[testKeys.Length - 1].value);
                }
            }
            //Debug.Log("Animation Clip " + clip.name + (canLoop ? " can loop" : " can NOT loop"));
            return canLoop;
        }

        static void CloseMouthToggle(bool close)
        {
            bool found = false;
            EditorCurveBinding[] curveBindings = AnimationUtility.GetCurveBindings(originalClip);
            EditorCurveBinding targetBinding = new EditorCurveBinding();
            AnimationCurve jawCurve = new AnimationCurve();
            Keyframe[] jawKeys;

            foreach (EditorCurveBinding binding in curveBindings)
            {
                if (binding.propertyName.Equals(jawClose))
                {
                    targetBinding = binding;
                    found = true;
                }
            }

            if (found)
            {
                jawCurve = AnimationUtility.GetEditorCurve(originalClip, targetBinding);
            }
            else
            {
                targetBinding = new EditorCurveBinding() { propertyName = jawClose, type = typeof(Animator) };
                jawKeys = new Keyframe[] {
                    new Keyframe( 0f, 0f ),
                    new Keyframe( originalClip.length, 0f )
                };
                jawCurve.keys = jawKeys;
            }

            if (close)
            {
                jawKeys = jawCurve.keys;
                for (int i = 0; i < jawKeys.Length; i++)
                {
                    jawKeys[i].value = 1;
                }
                jawCurve.keys = jawKeys;
            }

            AnimationUtility.SetEditorCurve(workingClip, targetBinding, jawCurve);
        }


        static void ApplyPose(int mode)
        {
            switch (mode)
            {
                case 0:
                    {
                        ResetPose();
                        break;
                    }
                case 1:
                    {
                        SetPose(openHandPose);
                        break;
                    }
                case 2:
                    {
                        SetPose(closedHandPose);
                        break;
                    }

            }
        }

        static void SetPose(Dictionary<string, float> pose)
        {
            EditorCurveBinding[] curveBindings = AnimationUtility.GetCurveBindings(originalClip);
            foreach (EditorCurveBinding binding in curveBindings)
            {
                foreach (KeyValuePair<string, float> p in pose)
                {
                    if (binding.propertyName.Equals(p.Key))
                    {
                        AnimationCurve curve = AnimationUtility.GetEditorCurve(originalClip, binding);
                        Keyframe[] keys = curve.keys;
                        for (int i = 0; i < keys.Length; i++)
                        {
                            keys[i].value = p.Value;
                        }
                        curve.keys = keys;
                        AnimationUtility.SetEditorCurve(workingClip, binding, curve);
                    }
                }
            }
        }

        static void ResetPose()
        {
            EditorCurveBinding[] curveBindings = AnimationUtility.GetCurveBindings(originalClip);
            foreach (EditorCurveBinding binding in curveBindings)
            {
                if (handCurves.Contains(binding.propertyName))
                {
                    AnimationCurve curve = AnimationUtility.GetEditorCurve(originalClip, binding);
                    AnimationUtility.SetEditorCurve(workingClip, binding, curve);
                }
            }
        }


        static void OffsetShoulders()
        {
            foreach (KeyValuePair<string, EditorCurveBinding> bind in shoulderBindings)
            {
                float scale = 0f;
                bool eval = false;
                bool subtract = true;
                bool update = false;
                AnimationCurve curve = AnimationUtility.GetEditorCurve(originalClip, bind.Value);
                Keyframe[] keys = curve.keys;

                switch (bind.Key)
                {
                    case lShoulder:
                        {
                            scale = srScale;
                            eval = true;
                            subtract = true;
                        }
                        break;
                    case rShoulder:
                        {
                            scale = srScale;
                            eval = true;
                            subtract = true;
                        }
                        break;
                    case lArm:
                        {
                            scale = arScale;
                            eval = true;
                            subtract = false;
                            update = true;
                        }
                        break;
                    case rArm:
                        {
                            scale = arScale;
                            eval = true;
                            subtract = false;
                            update = true;
                        }
                        break;
                    case lArmTwist:
                        {
                            scale = atScale;
                            eval = false;
                            subtract = true;
                        }
                        break;
                    case rArmTwist:
                        {
                            scale = atScale;
                            eval = false;
                            subtract = true;
                        }
                        break;
                }


                float diff = shoulderOffset * scale;
                if (update)
                {
                    backgroundArmOffset = diff / arScale;
                    diff = (backgroundArmOffset + armOffset) * scale;
                }



                for (int a = 0; a < keys.Length; a++)
                {

                    keys[a].value = eval ? EvaluateValue(keys[a].value, subtract ? -diff : diff) : keys[a].value + (subtract ? -diff : diff);
                }
                curve.keys = keys;
                for (int b = 0; b < keys.Length; b++)
                {
                    curve.SmoothTangents(b, 0.0f);
                }
                AnimationUtility.SetEditorCurve(workingClip, bind.Value, curve);
            }
        }

        static void OffsetArms()
        {
            foreach (KeyValuePair<string, EditorCurveBinding> bind in armBindings)
            {
                float scale = 0f;
                bool eval = false;
                bool subtract = true;
                bool includeBackgroundVal = false;
                AnimationCurve curve = AnimationUtility.GetEditorCurve(originalClip, bind.Value);
                Keyframe[] keys = curve.keys;

                switch (bind.Key)
                {
                    case lArm:
                        {
                            scale = arScale;
                            eval = true;
                            subtract = false;
                            includeBackgroundVal = true;
                        }
                        break;
                    case rArm:
                        {
                            scale = arScale;
                            eval = true;
                            subtract = false;
                            includeBackgroundVal = true;
                        }
                        break;
                    case lArmTwist:
                        {
                            scale = atScale;
                            eval = false;
                            subtract = true;
                        }
                        break;
                    case rArmTwist:
                        {
                            scale = atScale;
                            eval = false;
                            subtract = true;
                        }
                        break;
                }

                float diff = armOffset * scale;
                if (includeBackgroundVal)
                {
                    diff = (backgroundArmOffset + armOffset) * scale;
                }

                for (int a = 0; a < keys.Length; a++)
                {

                    keys[a].value = eval ? EvaluateValue(keys[a].value, subtract ? -diff : diff) : keys[a].value + (subtract ? -diff : diff);
                }
                curve.keys = keys;
                for (int b = 0; b < keys.Length; b++)
                {
                    curve.SmoothTangents(b, 0.0f);
                }
                AnimationUtility.SetEditorCurve(workingClip, bind.Value, curve);
            }
        }

        static void OffsetLegs()
        {
            foreach (KeyValuePair<string, EditorCurveBinding> bind in legBindings)
            {
                float scale = 0f;
                bool eval = false;
                bool subtract = true;

                AnimationCurve curve = AnimationUtility.GetEditorCurve(originalClip, bind.Value);
                Keyframe[] keys = curve.keys;

                switch (bind.Key)
                {
                    case lLeg:
                        {
                            scale = arScale;
                            eval = true;
                            subtract = false;
                        }
                        break;
                    case rLeg:
                        {
                            scale = arScale;
                            eval = true;
                            subtract = false;
                        }
                        break;
                    case lFootTwist:
                        {
                            scale = ftScale;
                            eval = false;
                            subtract = true;
                        }
                        break;
                    case rFootTwist:
                        {
                            scale = ftScale;
                            eval = false;
                            subtract = true;
                        }
                        break;
                }

                float diff = legOffset * scale;

                for (int a = 0; a < keys.Length; a++)
                {

                    keys[a].value = eval ? EvaluateValue(keys[a].value, subtract ? -diff : diff) : keys[a].value + (subtract ? -diff : diff);
                }
                curve.keys = keys;
                for (int b = 0; b < keys.Length; b++)
                {
                    curve.SmoothTangents(b, 0.0f);
                }
                AnimationUtility.SetEditorCurve(workingClip, bind.Value, curve);
            }
        }

        static void OffsetHeel()
        {
            foreach (KeyValuePair<string, EditorCurveBinding> bind in heelBindings)
            {
                float scale = 0f;
                bool eval = false;
                bool subtract = true;

                AnimationCurve curve = AnimationUtility.GetEditorCurve(originalClip, bind.Value);
                Keyframe[] keys = curve.keys;

                switch (bind.Key)
                {
                    case lFoot:
                        {
                            scale = arScale;
                            eval = true;
                            subtract = false;
                        }
                        break;
                    case rFoot:
                        {
                            scale = arScale;
                            eval = true;
                            subtract = false;
                        }
                        break;
                    case lToes:
                        {
                            scale = trScale;
                            eval = false;
                            subtract = true;
                        }
                        break;
                    case rToes:
                        {
                            scale = trScale;
                            eval = false;
                            subtract = true;
                        }
                        break;
                }

                float diff = heelOffset * scale;

                for (int a = 0; a < keys.Length; a++)
                {

                    keys[a].value = eval ? EvaluateValue(keys[a].value, subtract ? -diff : diff) : keys[a].value + (subtract ? -diff : diff);
                }
                curve.keys = keys;
                for (int b = 0; b < keys.Length; b++)
                {
                    curve.SmoothTangents(b, 0.0f);
                }
                AnimationUtility.SetEditorCurve(workingClip, bind.Value, curve);
            }
        }

        static void OffsetHeight()
        {
            foreach (KeyValuePair<string, EditorCurveBinding> bind in heightBindings)
            {
                AnimationCurve curve = AnimationUtility.GetEditorCurve(originalClip, bind.Value);
                Keyframe[] keys = curve.keys;

                float diff = heightOffset;

                for (int a = 0; a < keys.Length; a++)
                {
                    keys[a].value = keys[a].value + diff;
                }
                curve.keys = keys;
                for (int b = 0; b < keys.Length; b++)
                {
                    curve.SmoothTangents(b, 0.0f);
                }
                AnimationUtility.SetEditorCurve(workingClip, bind.Value, curve);
            }
        }

        static float EvaluateValue(float currentKeyValue, float deltaValue)
        {
            //if currently above zero   
            if (currentKeyValue >= 0f)
            {
                //if it ends up below zero then the negative contribution must be x2
                if ((currentKeyValue + deltaValue) < 0f)
                {
                    return (currentKeyValue + deltaValue) * 2f;
                }
                else
                //if it ends up above zero then return sum
                {
                    return currentKeyValue + deltaValue;
                }
            }

            //if currently bleow zero
            if (currentKeyValue < 0f)
            {
                //if both are negative then double the contribution from delta and return
                if (deltaValue < 0f)
                {
                    return currentKeyValue + deltaValue * 2f;
                }
                else
                {
                    //if delta is positive then we have to consider where it will end up with a below zero contribution * 2
                    if ((currentKeyValue + deltaValue * 2f) < 0f)
                    {
                        //where the value simply ends up still negative then we can return that
                        return currentKeyValue + deltaValue * 2f;
                    }
                    else
                    {
                        //where the value ends up positive we must return half the positive value
                        return (currentKeyValue + deltaValue * 2f) / 2f;
                    }
                }
            }
            return 3f;  // go wrong spectacularly
        }

        static void RetargetBlendShapes()
        {
            string blendShape = "blendShape.";
            string baseBody = "CC_Base_Body";

            GameObject targetGameObject = animator.gameObject;
            Transform[] targetAssetData = targetGameObject.GetComponentsInChildren<Transform>();

            EditorCurveBinding[] sourceCurveBindings = AnimationUtility.GetCurveBindings(workingClip);

            // Find all of the blendshape relevant binding paths that are not needed in the target animation        
            List<string> uniqueSourcePaths = new List<string>();
            foreach (EditorCurveBinding binding in sourceCurveBindings)
            {
                if (binding.propertyName.StartsWith(blendShape))
                {
                    if (!uniqueSourcePaths.Contains(binding.path))
                        uniqueSourcePaths.Add(binding.path);
                }
            }

            List<string> validTargetPaths = new List<string>();
            foreach (Transform t in targetAssetData)
            {
                GameObject go = t.gameObject;
                if (go.GetComponent<SkinnedMeshRenderer>())
                {
                    if (go.GetComponent<SkinnedMeshRenderer>().sharedMesh.blendShapeCount > 0)
                    {
                        validTargetPaths.Add(go.name);
                    }
                }
            }

            List<string> pathsToPurge = new List<string>();
            foreach (string path in uniqueSourcePaths)
            {
                if (!validTargetPaths.Contains(path))
                {
                    pathsToPurge.Add(path);
                }
            }

            for (int i = 0; i < sourceCurveBindings.Length; i++)
            {
                if (sourceCurveBindings[i].propertyName.StartsWith(blendShape) && sourceCurveBindings[i].path.Equals(baseBody))
                {
                    foreach (Transform t in targetAssetData)
                    {
                        GameObject go = t.gameObject;
                        if (go.GetComponent<SkinnedMeshRenderer>())
                        {
                            if (go.GetComponent<SkinnedMeshRenderer>().sharedMesh.blendShapeCount > 0)
                            {
                                for (int j = 0; j < go.GetComponent<SkinnedMeshRenderer>().sharedMesh.blendShapeCount; j++)
                                {
                                    string targetPropertyName = blendShape + go.GetComponent<SkinnedMeshRenderer>().sharedMesh.GetBlendShapeName(j);
                                    string sourcePropertyName = GetValidPropertyName(sourceCurveBindings[i].propertyName, targetPropertyName);

                                    if (targetPropertyName == sourcePropertyName)
                                    {                                        
                                        EditorCurveBinding workingBinding = new EditorCurveBinding()
                                        {
                                            path = go.name,
                                            type = typeof(SkinnedMeshRenderer),
                                            propertyName = sourcePropertyName
                                        };
                                        AnimationCurve workingCurve = new AnimationCurve();
                                        workingCurve = AnimationUtility.GetEditorCurve(originalClip, sourceCurveBindings[i]);
                                        AnimationUtility.SetEditorCurve(workingClip, workingBinding, workingCurve);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            bool PURGE = true;
            // Purge all curves from the animation that dont have a valid path in the target object                    
            if (PURGE)
            {
                EditorCurveBinding[] targetCurveBindings = AnimationUtility.GetCurveBindings(workingClip);
                for (int k = 0; k < targetCurveBindings.Length; k++)
                {
                    if (pathsToPurge.Contains(targetCurveBindings[k].path))
                        AnimationUtility.SetEditorCurve(workingClip, targetCurveBindings[k], null);
                }
            }
        }

        // Deal with naming mismatches in variaous character generations as they crop up (i.e. rename the mismatched source data to the name required by the target model) 
        private static string GetValidPropertyName(string sourcePropertyName, string targetPropertyName)
        {
            string propertyName = sourcePropertyName;

            if (targetPropertyName == "blendShape.Eyes_Blink" && sourcePropertyName == "blendShape.Eye_Blink") { propertyName = targetPropertyName; }
            if (targetPropertyName == "blendShape.Eye_Blink" && sourcePropertyName == "blendShape.Eyes_Blink") { propertyName = targetPropertyName; }

            return propertyName;
        }

        static void WriteAnimationToAssetDatabase()
        {
            string animationOutputBase = "Assets";
            string animationOutputBaseFolder = "Animations"; // Assets/Animations/ will be replaced by the characters 'Home' directory 
            string basePath = animationOutputBase + "/" + animationOutputBaseFolder;
            string animationExtractFolder = "Retargeted Animations";
            string extractBasePath = basePath + "/" + animationExtractFolder;

            if (!AssetDatabase.IsValidFolder(basePath))
                AssetDatabase.CreateFolder(animationOutputBase, animationOutputBaseFolder);

            if (!AssetDatabase.IsValidFolder(extractBasePath))
                AssetDatabase.CreateFolder(basePath, animationExtractFolder);


            string animName = NameAnimation();
            string fullOutputPath = extractBasePath + "/" + animName + ".anim";

            if (!AssetDatabase.GUIDFromAssetPath(fullOutputPath).ToString().Equals(emptyGuid))
            {
                for (int i = 0; i < 999; i++)
                {
                    string extension = string.Format("{0:000}", i);
                    fullOutputPath = extractBasePath + "/" + animName + "." + extension + ".anim";
                    if (AssetDatabase.GUIDFromAssetPath(fullOutputPath).ToString().Equals(emptyGuid))
                    {
                        break;
                    }
                }
            }
            Debug.Log("Writing Asset: " + fullOutputPath);

            var output = Object.Instantiate(workingClip);  // clone so that workingClip isn't locked to an on-disk asset
            AnimationClip outputClip = output as AnimationClip;
            AssetDatabase.CreateAsset(outputClip, fullOutputPath);
        }

        static string NameAnimation()
        {
            string name = animator.gameObject.name + "_" + originalClip.name;
            return name;
        }

        // Curve Master Data

        // Jaw curve
        const string jawClose = "Jaw Close";

        // Shoulder, Six curves to consider
        const string lShoulder = "Left Shoulder Down-Up";
        const string lArm = "Left Arm Down-Up";
        const string lArmTwist = "Left Arm Twist In-Out";

        const string rShoulder = "Right Shoulder Down-Up";
        const string rArm = "Right Arm Down-Up";
        const string rArmTwist = "Right Arm Twist In-Out";

        // Arm, Four Curves to consider
        // lArm lArmTwist rArm rArmTwist

        // Leg, Four Curves to consider
        const string lLeg = "Left Upper Leg In-Out";
        const string lFootTwist = "Left Foot Twist In-Out";

        const string rLeg = "Right Upper Leg In-Out";
        const string rFootTwist = "Right Foot Twist In-Out";

        // Heel, Four Curves to consider
        const string lFoot = "Left Foot Up-Down";
        const string lToes = "Left Toes Up-Down";

        const string rFoot = "Right Foot Up-Down";
        const string rToes = "Right Toes Up-Down";

        // Height, One Curve to consider
        const string yRoot = "RootT.y";

        static string[] shoulderCurveNames = new string[]
                {
                    lShoulder,
                    lArm,
                    lArmTwist,
                    rShoulder,
                    rArm,
                    rArmTwist
                };

        static string[] armCurveNames = new string[]
                {
                    lArm,
                    lArmTwist,
                    rArm,
                    rArmTwist
                };

        static string[] legCurveNames = new string[]
                {
                    lLeg,
                    lFootTwist,
                    rLeg,
                    rFootTwist
                };

        static string[] heelCurveNames = new string[]
                {
                    lFoot,
                    lToes,
                    rFoot,
                    rToes
                };

        static string[] heightCurveNames = new string[]
                {
                    yRoot
                };

        //Translation ratios to convert angles to Mechanim values
        const float srScale = 12f / 360f; // Shoulder Rotation scale
        const float arScale = 3.6f / 360f; // Arm Rotation scale
        const float atScale = 1f / 360f; // Arm Twist scale
        const float ftScale = 8f / 360f; // Foot Twist scale
        const float trScale = 4f / 360f; // Toe rotation scale




        // Pose Master Data
        private void ExtractPose()
        {
            string dictName = "openHandPose";
            string filename = "pose";
            string extension = ".cs";

            string searchString = "hand.";
            float timeStamp = 0.1f;

            EditorCurveBinding[] sourceCurveBindings = AnimationUtility.GetCurveBindings(workingClip);

            string pathString = "Dictionary<string, float> " + dictName + " = new Dictionary<string, float>()\r";
            pathString += "{\r";
            foreach (EditorCurveBinding binding in sourceCurveBindings)
            {
                if (binding.propertyName.ToLower().Contains(searchString))
                {
                    pathString += "\t{ \"" + binding.propertyName + "\", ";
                    AnimationCurve curve = AnimationUtility.GetEditorCurve(workingClip, binding);
                    float value = curve.Evaluate(timeStamp);
                    pathString += value + "f },\r";
                }
            }
            pathString += "};";
            string path = "Assets/" + filename + extension;
            System.IO.File.WriteAllText(path, pathString);
        }


        static Dictionary<string, float> openHandPose = new Dictionary<string, float>()
    {
        { "LeftHand.Thumb.1 Stretched", -1.141453f },
        { "LeftHand.Thumb.Spread", -0.4620222f },
        { "LeftHand.Thumb.2 Stretched", 0.5442108f },
        { "LeftHand.Thumb.3 Stretched", 0.4577243f },
        { "LeftHand.Index.1 Stretched", 0.3184956f },
        { "LeftHand.Index.Spread", -0.4479268f },
        { "LeftHand.Index.2 Stretched", 0.2451891f },
        { "LeftHand.Index.3 Stretched", 0.6176971f },
        { "LeftHand.Middle.1 Stretched", 0.09830929f },
        { "LeftHand.Middle.Spread", -0.5679846f },
        { "LeftHand.Middle.2 Stretched", 0.3699116f },
        { "LeftHand.Middle.3 Stretched", 0.3705207f },
        { "LeftHand.Ring.1 Stretched", 0.09632754f },
        { "LeftHand.Ring.Spread", -0.5876712f },
        { "LeftHand.Ring.2 Stretched", 0.1289254f },
        { "LeftHand.Ring.3 Stretched", 0.3732445f },
        { "LeftHand.Little.1 Stretched", 0.09448492f },
        { "LeftHand.Little.Spread", -0.4517526f },
        { "LeftHand.Little.2 Stretched", -0.003889897f },
        { "LeftHand.Little.3 Stretched", -0.04161567f },
        { "RightHand.Thumb.1 Stretched", -1.135697f },
        { "RightHand.Thumb.Spread", -0.4576517f },
        { "RightHand.Thumb.2 Stretched", 0.5427816f },
        { "RightHand.Thumb.3 Stretched", 0.4549177f },
        { "RightHand.Index.1 Stretched", 0.3184868f },
        { "RightHand.Index.Spread", -0.4478924f },
        { "RightHand.Index.2 Stretched", 0.2451727f },
        { "RightHand.Index.3 Stretched", 0.617752f },
        { "RightHand.Middle.1 Stretched", 0.09830251f },
        { "RightHand.Middle.Spread", -0.5680417f },
        { "RightHand.Middle.2 Stretched", 0.3699542f },
        { "RightHand.Middle.3 Stretched", 0.3705046f },
        { "RightHand.Ring.1 Stretched", 0.09632745f },
        { "RightHand.Ring.Spread", -0.5876312f },
        { "RightHand.Ring.2 Stretched", 0.1288746f },
        { "RightHand.Ring.3 Stretched", 0.3732805f },
        { "RightHand.Little.1 Stretched", 0.09454078f },
        { "RightHand.Little.Spread", -0.4516154f },
        { "RightHand.Little.2 Stretched", -0.04165318f },
        { "RightHand.Little.3 Stretched", -0.04163568f },
    };

        static Dictionary<string, float> closedHandPose = new Dictionary<string, float>()
    {
        { "LeftHand.Thumb.1 Stretched", -1.141455f },
        { "LeftHand.Thumb.Spread", -0.4620211f },
        { "LeftHand.Thumb.2 Stretched", 0.3974656f },
        { "LeftHand.Thumb.3 Stretched", -0.0122656f },
        { "LeftHand.Index.1 Stretched", -0.4441552f },
        { "LeftHand.Index.Spread", -0.3593751f },
        { "LeftHand.Index.2 Stretched", -0.8875571f },
        { "LeftHand.Index.3 Stretched", -0.3460926f },
        { "LeftHand.Middle.1 Stretched", -0.5940282f },
        { "LeftHand.Middle.Spread", -0.4824f },
        { "LeftHand.Middle.2 Stretched", -0.7796204f },
        { "LeftHand.Middle.3 Stretched", -0.3495999f },
        { "LeftHand.Ring.1 Stretched", -0.5579048f },
        { "LeftHand.Ring.Spread", -1.060186f },
        { "LeftHand.Ring.2 Stretched", -1.001659f },
        { "LeftHand.Ring.3 Stretched", -0.1538185f },
        { "LeftHand.Little.1 Stretched", -0.5157003f },
        { "LeftHand.Little.Spread", -0.5512691f },
        { "LeftHand.Little.2 Stretched", -0.6109533f },
        { "LeftHand.Little.3 Stretched", -0.4368959f },
        { "RightHand.Thumb.1 Stretched", -1.141842f },
        { "RightHand.Thumb.Spread", -0.4619166f },
        { "RightHand.Thumb.2 Stretched", 0.3966853f },
        { "RightHand.Thumb.3 Stretched", -0.01453214f },
        { "RightHand.Index.1 Stretched", -0.4441575f },
        { "RightHand.Index.Spread", -0.3588968f },
        { "RightHand.Index.2 Stretched", -0.887614f },
        { "RightHand.Index.3 Stretched", -0.3457543f },
        { "RightHand.Middle.1 Stretched", -0.5940221f },
        { "RightHand.Middle.Spread", -0.4824342f },
        { "RightHand.Middle.2 Stretched", -0.7796109f },
        { "RightHand.Middle.3 Stretched", -0.3495855f },
        { "RightHand.Ring.1 Stretched", -0.557913f },
        { "RightHand.Ring.Spread", -1.060112f },
        { "RightHand.Ring.2 Stretched", -1.001655f },
        { "RightHand.Ring.3 Stretched", -0.1538157f },
        { "RightHand.Little.1 Stretched", -0.5156479f },
        { "RightHand.Little.Spread", -0.5513764f },
        { "RightHand.Little.2 Stretched", -0.64873f },
        { "RightHand.Little.3 Stretched", -0.4367864f },
    };

        static string[] handCurves = new string[]
        {
        "LeftHand.Thumb.1 Stretched",
        "LeftHand.Thumb.Spread",
        "LeftHand.Thumb.2 Stretched",
        "LeftHand.Thumb.3 Stretched",
        "LeftHand.Index.1 Stretched",
        "LeftHand.Index.Spread",
        "LeftHand.Index.2 Stretched",
        "LeftHand.Index.3 Stretched",
        "LeftHand.Middle.1 Stretched",
        "LeftHand.Middle.Spread",
        "LeftHand.Middle.2 Stretched",
        "LeftHand.Middle.3 Stretched",
        "LeftHand.Ring.1 Stretched",
        "LeftHand.Ring.Spread",
        "LeftHand.Ring.2 Stretched",
        "LeftHand.Ring.3 Stretched",
        "LeftHand.Little.1 Stretched",
        "LeftHand.Little.Spread",
        "LeftHand.Little.2 Stretched",
        "LeftHand.Little.3 Stretched",
        "RightHand.Thumb.1 Stretched",
        "RightHand.Thumb.Spread",
        "RightHand.Thumb.2 Stretched",
        "RightHand.Thumb.3 Stretched",
        "RightHand.Index.1 Stretched",
        "RightHand.Index.Spread",
        "RightHand.Index.2 Stretched",
        "RightHand.Index.3 Stretched",
        "RightHand.Middle.1 Stretched",
        "RightHand.Middle.Spread",
        "RightHand.Middle.2 Stretched",
        "RightHand.Middle.3 Stretched",
        "RightHand.Ring.1 Stretched",
        "RightHand.Ring.Spread",
        "RightHand.Ring.2 Stretched",
        "RightHand.Ring.3 Stretched",
        "RightHand.Little.1 Stretched",
        "RightHand.Little.Spread",
        "RightHand.Little.2 Stretched",
        "RightHand.Little.3 Stretched"
        };
    }
}