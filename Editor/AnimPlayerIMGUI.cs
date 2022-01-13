using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using Object = UnityEngine.Object;

namespace Reallusion.Import
{
    public class AnimPlayerIMGUI
    {
        #region AnimPlayer

        public static AnimationClip animationClip;
        public static Animator animator;
        public static bool play = false;
        public static bool clipManuallySet = false;
        public static float time, prev, current = 0f;
        public static bool animFoldOut = true;
        public static bool AnimFoldOut { get { return animFoldOut; } set { animFoldOut = value; } }

        public static void SetCharacter(PreviewScene ps, GameObject fbx)
        {            
            if (ps.IsValid)
            {
                GameObject scenePrefab = ps.GetPreviewCharacter();

                if (scenePrefab)
                {
                    GameObject sceneFbx = Util.GetScenePrefabRoot(scenePrefab);
                    Animator anim = scenePrefab.GetComponent<Animator>();
                    AnimationClip firstClip = Util.GetFirstAnimationClipFromCharacter(sceneFbx);

                    // if this is not representing the same character then reset the animation player
                    if (fbx != sceneFbx) UpdatePlayerTargets(anim, firstClip);
                    // otherwise continue with the current animation setup
                    else UpdatePlayerTargets(anim, firstClip);
                }
            }
        }

        public static void UpdatePlayerTargets(Animator setAnimator, AnimationClip setClip)
        {                        
            if (setAnimator)
            {
                if (AnimationMode.InAnimationMode()) AnimationMode.StopAnimationMode();

                if (animator != setAnimator)
                {                     
                    animator = setAnimator;                    
                }

                // replace animation clip if: there is no current clip.
                //                        or: the current clip was not set manually by the user.
                if (setClip)
                {
                    if (!animationClip || !clipManuallySet)
                    {
                        animationClip = setClip;
                        time = 0f;
                        play = false;
                        doneStartUp = false;
                    }
                }

                if (!AnimationMode.InAnimationMode()) AnimationMode.StartAnimationMode();

                // intitialise the face refs if needed
                if (!doneStartUp) StartUp();

                // then sample the animtion
                if (animationClip) SampleOnce();

                // then apply the face
                if (doneStartUp) ApplyFace();
            }
        }

        public static void UpdatePlayerClip(AnimationClip setClip)
        {
            if (animator && setClip && animationClip != setClip)
            {
                if (AnimationMode.InAnimationMode()) AnimationMode.StopAnimationMode();

                animationClip = setClip;
                time = 0f;
                play = false;

                if (!AnimationMode.InAnimationMode()) AnimationMode.StartAnimationMode();

                SampleOnce();
            }
        }

        public static void DrawPlayer()
        {            
            GUILayout.BeginVertical();
            EditorGUI.BeginChangeCheck();
            animFoldOut = EditorGUILayout.Foldout(animFoldOut, "Animation Playback", EditorStyles.foldout);
            if (EditorGUI.EndChangeCheck())
            {
                //if (foldOut && FacialMorphIMGUI.FoldOut)
                //    FacialMorphIMGUI.FoldOut = false;
                doOnceCatchMouse = true;
            }
            if (animFoldOut)
            {
                EditorGUI.BeginChangeCheck();
                animator = (Animator)EditorGUILayout.ObjectField(new GUIContent("Scene Model", "Animated model in scene"), animator, typeof(Animator), true);
                animationClip = (AnimationClip)EditorGUILayout.ObjectField(new GUIContent("Animation", "Animation to play and manipulate"), animationClip, typeof(AnimationClip), false);
                if (EditorGUI.EndChangeCheck())
                {
                    if (animationClip && animator)
                    {
                        time = 0f;
                        play = false;
                        if (!AnimationMode.InAnimationMode())
                            AnimationMode.StartAnimationMode();

                        SampleOnce();
                        clipManuallySet = true;
                    }
                    else
                    {
                        time = 0f;
                        play = false;
                        if (AnimationMode.InAnimationMode())
                            AnimationMode.StopAnimationMode();
                    }
                }

                EditorGUI.BeginDisabledGroup(!AnimationMode.InAnimationMode());

                if (animationClip != null)
                {
                    float startTime = 0.0f;
                    float stopTime = animationClip.length;
                    EditorGUI.BeginChangeCheck();
                    time = EditorGUILayout.Slider(time, startTime, stopTime);
                    if (EditorGUI.EndChangeCheck())
                    {
                        ResetFace();
                    }
                }
                else
                {
                    float value = 0f;
                    value = EditorGUILayout.Slider(value, 0f, 1f); //disabled dummy entry
                }

                GUILayout.BeginHorizontal(EditorStyles.toolbar);
                // "Animation.FirstKey"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("Animation.FirstKey").image, "First Frame"), EditorStyles.toolbarButton))
                {
                    play = false;
                    time = 0f;
                    ResetFace();
                }
                // "Animation.PrevKey"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("Animation.PrevKey").image, "Previous Frame"), EditorStyles.toolbarButton))
                {
                    play = false;
                    time -= 0.0166f;
                    ResetFace();
                }
                // "Animation.Play"
                EditorGUI.BeginChangeCheck();
                play = GUILayout.Toggle(play, new GUIContent(EditorGUIUtility.IconContent("Animation.Play").image, "Play (Toggle)"), EditorStyles.toolbarButton);
                if (EditorGUI.EndChangeCheck())
                {                    
                    ResetFace();
                }
                // "PauseButton"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("PauseButton").image, "Pause"), EditorStyles.toolbarButton))
                {
                    play = false;
                    ResetFace();
                }
                // "Animation.NextKey"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("Animation.NextKey").image, "Next Frame"), EditorStyles.toolbarButton))
                {
                    play = false;
                    time += 0.0166f;
                    ResetFace();
                }
                // "Animation.LastKey"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("Animation.LastKey").image, "Last Frame"), EditorStyles.toolbarButton))
                {
                    play = false;
                    time = animationClip.length;
                    ResetFace();
                }

                if (!UnityEditorInternal.InternalEditorUtility.isApplicationActive) play = false;                

                GUILayout.EndHorizontal();

                EditorGUI.EndDisabledGroup();
            }
            GUILayout.EndVertical();
        }

        public static void SampleOnce()
        {
            AnimationMode.BeginSampling();
            AnimationMode.SampleAnimationClip(animator.gameObject, animationClip, time);
            AnimationMode.EndSampling();
        }

        public static void CreatePlayer(PreviewScene ps, GameObject fbx)
        {
            if (fbx && ps.IsValid)
            {
                SetCharacter(ps, fbx);
            }

#if SCENEVIEW_OVERLAY_COMPATIBLE
            //2021.2.0a17+  When GUI.Window is called from a static SceneView delegate, it is broken in 2021.2.0f1 - 2021.2.1f1
            //so we switch to overlays starting from an earlier version
            if (AnimPlayerOverlay.exists)
                AnimPlayerOverlay.createdOverlay.Show();
#else 
            //2020 LTS            
            AnimPlayerWindow.ShowPlayer();
#endif
            //Common
            SceneView.RepaintAll();

            EditorApplication.update += UpdateDelegate;
        }

        public static void DestroyPlayer()
        {            
            EditorApplication.update -= UpdateDelegate;

            if (AnimationMode.InAnimationMode())
                AnimationMode.StopAnimationMode();            

#if SCENEVIEW_OVERLAY_COMPATIBLE
            //2021.2.0a17+          
            if (AnimPlayerOverlay.exists)
                AnimPlayerOverlay.createdOverlay.Hide();
#else
            //2020 LTS            
            AnimPlayerWindow.HidePlayer();
#endif
            //Common
            AnimPlayerIMGUI.play = false;
            AnimPlayerIMGUI.time = 0f;
            AnimPlayerIMGUI.animator = null;
            AnimPlayerIMGUI.animationClip = null;

            SceneView.RepaintAll();
        }

        public static bool IsPlayerShown()
        {
#if SCENEVIEW_OVERLAY_COMPATIBLE
            //2021.2.0a17+
            return AnimPlayerOverlay.createdOverlay.visible;
#else
            //2020 LTS            
            return AnimPlayerWindow.isShown;
#endif
        }

        static double updateTime = 0f;
        static double deltaTime = 0f;
        static double frameTime = 1f;
        static void UpdateDelegate()
        {
            if (updateTime == 0f) updateTime = EditorApplication.timeSinceStartup;
            deltaTime = EditorApplication.timeSinceStartup - updateTime;
            updateTime = EditorApplication.timeSinceStartup;

            AdjustEyes();

            if (!EditorApplication.isPlaying && AnimationMode.InAnimationMode())
            {
                if (animationClip && animator)
                {
                    if (play)
                    {
                        double frameDuration = 1.0f / animationClip.frameRate;

                        time += (float)deltaTime;
                        frameTime += deltaTime;
                        if (time >= animationClip.length)
                            time = 0f;

                        if (frameTime < frameDuration) return;
                        frameTime = 0f;
                    }
                    else
                        frameTime = 1f;

                    if (current != time)
                    {
                        AnimationMode.BeginSampling();
                        AnimationMode.SampleAnimationClip(animator.gameObject, animationClip, time);
                        AnimationMode.EndSampling();
                        SceneView.RepaintAll();
                        
                        AnimPlayerIMGUI.current = time;
                    }
                }
            }
        }

        #endregion AnimPlayer

        #region FaceMorph

        public static bool faceFoldOut = true;
        public static bool FaceFoldOut { get { return faceFoldOut; } set { faceFoldOut = value; } }
        public static bool useLightIcons = false;
        public static bool doOnce = true;
        public static bool doOnceCatchMouse = true;
        public static bool eyeChanged = false;
        public static bool doneStartUp = false;

        static float EXPRESSIVENESS = 0.25f;
        static Dictionary<string, float> EXPRESSION;

        static float Xpos = 0f;
        static float RestXpos = 0f;
        static float Ypos = 0f;
        static float RestYpos = 0f;

        static Texture2D eyeControlImage;
        static Texture2D jawIconImage;
        static Texture2D blinkIconImage;
        static Texture2D faceDefault;
        static Texture2D faceAngryImage;
        static Texture2D faceDisgust;
        static Texture2D faceFear;
        static Texture2D faceHappy;
        static Texture2D faceSad;
        static Texture2D faceSurprise;
        static GUIStyle transparentBoxStyle;
        static Color outlineColor = Color.gray;
        static Color selectedColor = Color.gray;
        static Color mouseOverColor = Color.gray;
        static Rect last;
        static Vector2 eyeVal;
        static Vector2 eyeRef;
        static float jawVal;
        static float jawRef;
        static float blinkVal;
        static float blinkRef;
        static double resetClickTimer;

        static bool snapView = false;
        static Quaternion camDir;

        const float ICON_FACE_SIZE = 48f;

        public static void StartUp()
        {
            CleanUp();

            selectedColor = new Color(0.19f, 0.58f, 0.75f, 0.5f);
            mouseOverColor = new Color(0.45f, 0.45f, 0.45f, 0.5f);
            outlineColor = mouseOverColor;

            string[] folders = new string[] { "Assets", "Packages" };
            eyeControlImage = Util.FindTexture(folders, useLightIcons ? "eye_1280_gry" : "eye_1280_blk");
            jawIconImage = Util.FindTexture(folders, useLightIcons ? "mouth_1024_gry" : "mouth_1024_blk");
            blinkIconImage = Util.FindTexture(folders, useLightIcons ? "blink_1024_gry" : "blink_1024_blk");
            faceDefault = Util.FindTexture(folders, "RLIcon_FaceDefault");
            faceAngryImage = Util.FindTexture(folders, "RLIcon_FaceAngry");
            faceDisgust = Util.FindTexture(folders, "RLIcon_FaceDisgust");
            faceFear = Util.FindTexture(folders, "RLIcon_FaceFear");
            faceHappy = Util.FindTexture(folders, "RLIcon_FaceHappy");
            faceSad = Util.FindTexture(folders, "RLIcon_FaceSad");
            faceSurprise = Util.FindTexture(folders, "RLIcon_FaceSurprise");

            transparentBoxStyle = new GUIStyle(GUI.skin.box);
            Texture2D transparent = new Texture2D(1, 1, TextureFormat.RGBAFloat, false);
            transparent.SetPixel(0, 0, new Color(1f, 1f, 1f, 0f));
            transparent.Apply();
            transparentBoxStyle.normal.background = transparent;

            EXPRESSIVENESS = 0f;
            EXPRESSION = null;

            if (AnimPlayerIMGUI.animator == null) return;

            Object obj = AnimPlayerIMGUI.animator.gameObject;
            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                GameObject leftEye = MeshUtil.FindCharacterBone(root, "CC_Base_L_Eye");
                if (!leftEye) leftEye = MeshUtil.FindCharacterBone(root, "L_Eye");
                GameObject rightEye = MeshUtil.FindCharacterBone(root, "CC_Base_R_Eye");
                if (!rightEye) rightEye = MeshUtil.FindCharacterBone(root, "R_Eye");
                GameObject jawBone = MeshUtil.FindCharacterBone(root, "CC_Base_JawRoot");
                if (!jawBone) jawBone = MeshUtil.FindCharacterBone(root, "JawRoot");

                if (leftEye && rightEye)
                {
                    Vector3 euler = leftEye.transform.localRotation.eulerAngles;
                    eyeRef = new Vector2(euler.z, euler.x);
                    eyeVal = new Vector2(euler.z, euler.x);
                }

                if (jawBone)
                {
                    Transform jaw = jawBone.transform;
                    Quaternion rotation = jaw.localRotation;
                    Vector3 euler = rotation.eulerAngles;
                    jawRef = euler.z;
                    jawVal = jawRef;
                }

                const string shapeNameSingle = "Eye_Blink";
                for (int i = 0; i < root.transform.childCount; i++)
                {
                    GameObject child = root.transform.GetChild(i).gameObject;
                    SkinnedMeshRenderer renderer = child.GetComponent<SkinnedMeshRenderer>();
                    if (renderer)
                    {
                        Mesh mesh = renderer.sharedMesh;
                        if (mesh.blendShapeCount > 0)
                        {
                            int shapeIndexS = mesh.GetBlendShapeIndex(shapeNameSingle);

                            if (shapeIndexS > 0)
                            {
                                blinkRef = renderer.GetBlendShapeWeight(shapeIndexS);
                                blinkVal = blinkRef;
                            }
                        }
                    }
                }
                SceneView.RepaintAll();                
            }

            doneStartUp = true;
        }

        public static void ResetFace(bool full = false)
        {
            SetNeutralExpression();
            if (full)
            {
                EXPRESSIVENESS = 0f;
                EXPRESSION = null;
            }
            Xpos = RestXpos;
            Ypos = RestYpos;
            eyeVal = eyeRef;
            eyeChanged = true;
            jawVal = jawRef;
            AdjustMouth(jawVal);
            blinkVal = blinkRef;
            AdjustBlink(blinkVal);
        }

        public static void ApplyFace()
        {
            eyeChanged = true;
            if (EXPRESSION != null)
                SetFacialExpression(EXPRESSION, true);
            AdjustMouth(jawVal);
            AdjustBlink(blinkVal);
        }

        public static void ResetFaceViewCamera()
        {
            Object obj = AnimPlayerIMGUI.animator.gameObject;
            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                Vector3 lookAt = Vector3.zero;

                GameObject head = MeshUtil.FindCharacterBone(root, "CC_Base_Head");
                if (!head) head = MeshUtil.FindCharacterBone(root, "head");
                GameObject leftEye = MeshUtil.FindCharacterBone(root, "CC_Base_L_Eye");
                if (!leftEye) leftEye = MeshUtil.FindCharacterBone(root, "L_Eye");
                GameObject rightEye = MeshUtil.FindCharacterBone(root, "CC_Base_R_Eye");
                if (!rightEye) rightEye = MeshUtil.FindCharacterBone(root, "R_Eye");

                if (head && leftEye && rightEye)
                    lookAt = (head.transform.position + leftEye.transform.position + rightEye.transform.position) / 3f;
                else if (head)
                    lookAt = head.transform.position;

                if (head)
                {                    
                    //foreach (SceneView sv in SceneView.sceneViews)
                    //{
                        SceneView.lastActiveSceneView.LookAt(lookAt, GetLookBackDir(), 0.25f);
                    //}
                }
            }
        }

        public static void CleanUp()
        {
            doOnce = true;
            doOnceCatchMouse = true;
            doneStartUp = false;
            clipManuallySet = false;
            EXPRESSION = null;
            EXPRESSIVENESS = 0f;
        }

        public static void DrawFacialMorph()
        {
            if (doOnce)
            {
                StartUp();
                doOnce = !doOnce;
            }

            EditorGUI.BeginDisabledGroup(play);
            EditorGUI.BeginChangeCheck();
            faceFoldOut = EditorGUILayout.Foldout(faceFoldOut, "Facial Morph", EditorStyles.foldout);
            if (EditorGUI.EndChangeCheck())
            {
                //if (foldOut && AnimPlayerIMGUI.FoldOut)
                //    AnimPlayerIMGUI.FoldOut = false;
            }
            if (faceFoldOut && Event.current.type == EventType.Repaint)
            {
                last = GUILayoutUtility.GetLastRect();
            }

            if (faceFoldOut)
            {
                //Directly positioned controls
                float xPadding = 6f;
                float yPadding = 3f;
                float yFoldoutOffset = 18f;
                float eyeControlWidth = 100f;
                float eyeControlHeight = 50f;

                Rect eyeControlRect = new Rect(last.x + xPadding, last.y + yFoldoutOffset + yPadding, eyeControlWidth, eyeControlHeight);

                Rect rightTopRowIcon = new Rect(eyeControlRect.x + eyeControlRect.width + xPadding * 2,
                                                eyeControlRect.y, 24f, 24f);

                Rect rightTopRowSlider = new Rect(rightTopRowIcon.x + rightTopRowIcon.width + +xPadding * 2,
                                                eyeControlRect.y, 100f, 24f);

                Rect rightSecRowIcon = new Rect(eyeControlRect.x + eyeControlRect.width + xPadding * 2,
                                                rightTopRowIcon.y + rightTopRowIcon.height + yPadding, 24f, 24f);

                Rect rightSecRowSlider = new Rect(rightTopRowIcon.x + rightTopRowIcon.width + +xPadding * 2,
                                                rightTopRowSlider.y + rightTopRowIcon.height + yPadding, 100f, 24f);

                Rect rightRefreshButton = new Rect(rightTopRowSlider.x + rightTopRowSlider.width + xPadding * 3,
                                                rightTopRowSlider.y + rightTopRowSlider.height - yPadding * 6, 32f, 32f);

                eyeVal = CatchMouse(eyeControlRect, eyeRef, invertX: true, invertY: true);

                GUI.DrawTexture(rightTopRowIcon, jawIconImage);
                EditorGUI.BeginChangeCheck();
                jawVal = GUI.HorizontalSlider(rightTopRowSlider, jawVal, jawRef - 25f, jawRef + 0f);
                if (EditorGUI.EndChangeCheck())
                {
                    SetIndividualBlendShape("Mouth_Open", Mathf.InverseLerp(jawRef + 0f, jawRef - 25f, jawVal) * 100f);
                    AdjustMouth(jawVal);
                }

                GUI.DrawTexture(rightSecRowIcon, blinkIconImage);
                EditorGUI.BeginChangeCheck();
                blinkVal = GUI.HorizontalSlider(rightSecRowSlider, blinkVal, -30f, 120f);
                if (EditorGUI.EndChangeCheck())
                {
                    AdjustBlink(blinkVal);
                }

                if (GUI.Button(rightRefreshButton, new GUIContent(EditorGUIUtility.IconContent("Refresh").image, "Reset Face and View")))
                {
                    ResetFace(true);

                    if (resetClickTimer > 0f && (EditorApplication.timeSinceStartup - resetClickTimer < 0.5f))
                        ResetFaceViewCamera();

                    resetClickTimer = EditorApplication.timeSinceStartup;

                    SceneView.RepaintAll();
                }

                GUILayout.BeginVertical();
                //Shenanigans with 2021 overlays
                //Invisible GUILayout boxes to determine the boundaries of the panel in overlay mode
                //the height is determined by the vertical box + the horizontal GULayout group below it
                GUILayout.Box("", transparentBoxStyle, GUILayout.Width(1f), GUILayout.Height(45f));  //total height = this + button strip
                GUILayout.Box("", transparentBoxStyle, GUILayout.Width(308f), GUILayout.Height(1f)); //total width

                GUILayout.BeginHorizontal();
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceAngryImage, "Angry Face"), GUILayout.Height(ICON_FACE_SIZE), GUILayout.Width(ICON_FACE_SIZE)))
                {
                    ResetFace();
                    SetFacialExpression(FACE_ANGRY);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceDisgust, "Disgusted Face"), GUILayout.Height(ICON_FACE_SIZE), GUILayout.Width(ICON_FACE_SIZE)))
                {
                    ResetFace();
                    SetFacialExpression(FACE_DISGUST);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceFear, "Fearful Face"), GUILayout.Height(ICON_FACE_SIZE), GUILayout.Width(ICON_FACE_SIZE)))
                {
                    ResetFace();
                    SetFacialExpression(FACE_FEAR);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceHappy, "Happy Face"), GUILayout.Height(ICON_FACE_SIZE), GUILayout.Width(ICON_FACE_SIZE)))
                {
                    ResetFace();
                    SetFacialExpression(FACE_HAPPY);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceSad, "Sad Face"), GUILayout.Height(ICON_FACE_SIZE), GUILayout.Width(ICON_FACE_SIZE)))
                {
                    ResetFace();
                    SetFacialExpression(FACE_SAD);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceSurprise, "Surprised Face"), GUILayout.Height(ICON_FACE_SIZE), GUILayout.Width(ICON_FACE_SIZE)))
                {
                    ResetFace();
                    SetFacialExpression(FACE_SURPRISE);
                }
                GUILayout.FlexibleSpace();
                GUILayout.EndHorizontal();
                GUILayout.EndVertical();
            }
            EditorGUI.EndDisabledGroup();
        }

        static Vector2 CatchMouse(Rect controlAreaRect, Vector2 referenceVector2, bool invertX, bool invertY)
        {
            if (doOnceCatchMouse && Event.current.type == EventType.Repaint)
            {
                Xpos = controlAreaRect.x + controlAreaRect.width / 2;
                RestXpos = Xpos;
                Ypos = controlAreaRect.y + controlAreaRect.height / 2;
                RestYpos = Ypos;
                doOnceCatchMouse = !doOnceCatchMouse;
            }

            Rect buttonRect = new Rect(Xpos - 8f, Ypos - 8f, 16f, 16f);
            GUI.DrawTexture(controlAreaRect, eyeControlImage);

            GUI.DrawTexture(buttonRect, EditorGUIUtility.IconContent("sv_icon_dot0_pix16_gizmo").image);
            int buttonId = GUIUtility.GetControlID(FocusType.Passive, buttonRect);
            int controlAreaId = GUIUtility.GetControlID(FocusType.Passive, controlAreaRect);

            Event mouseEvent = Event.current;

            if (controlAreaRect.Contains(mouseEvent.mousePosition))
            {
                if (mouseEvent.type == EventType.MouseDown && mouseEvent.clickCount == 2)
                {
                    // Double click event
                    SnapViewToHead();
                }
            }

            if (controlAreaRect.Contains(mouseEvent.mousePosition))
            {
                switch (mouseEvent.GetTypeForControl(controlAreaId))
                {
                    case EventType.MouseDown:
                        {
                            if (controlAreaRect.Contains(mouseEvent.mousePosition))
                            {
                                outlineColor = selectedColor;
                                GUIUtility.hotControl = controlAreaId;
                                Event.current.Use();

                                /*
                                Xpos = Mathf.Clamp(mouseEvent.mousePosition.x,
                                                   controlAreaRect.x,
                                                   controlAreaRect.x + controlAreaRect.width);

                                Ypos = Mathf.Clamp(mouseEvent.mousePosition.y,
                                                   controlAreaRect.y,
                                                   controlAreaRect.y + controlAreaRect.height);

                                eyeChanged = true;
                                */
                            }
                        }
                        break;

                    case EventType.MouseDrag:
                        {
                            if (GUIUtility.hotControl == controlAreaId)
                            {
                                Xpos = Mathf.Lerp(Xpos, Mathf.Clamp(mouseEvent.mousePosition.x,
                                                        controlAreaRect.x,
                                                        controlAreaRect.x + controlAreaRect.width), 0.25f);

                                Ypos = Mathf.Lerp(Ypos, Mathf.Clamp(mouseEvent.mousePosition.y,
                                                        controlAreaRect.y,
                                                        controlAreaRect.y + controlAreaRect.height), 0.25f);

                                eyeChanged = true;
                            }
                        }
                        break;

                    case EventType.MouseUp:
                        {
                            outlineColor = mouseOverColor;
                            if (GUIUtility.hotControl == buttonId)
                                GUIUtility.hotControl = 0;
                        }
                        break;

                    case EventType.Repaint:
                        {
                            GUI.DrawTexture(position: controlAreaRect, image: Texture2D.whiteTexture, scaleMode: ScaleMode.StretchToFill,
                                    alphaBlend: false, imageAspect: 1f, color: outlineColor, borderWidth: 1, borderRadius: 1);
                            SceneView.RepaintAll();
                        }
                        break;
                }
            }
            float relX = (Xpos - controlAreaRect.width / 2 - controlAreaRect.x) * (invertX ? -1 : 1);
            float relY = (Ypos - controlAreaRect.height / 2 - controlAreaRect.y) * (invertY ? -1 : 1);

            Vector2 output = new Vector2(referenceVector2.x + relX, referenceVector2.y + relY);
            return output;
        }

        public static void AdjustEyes()
        {
            if (!eyeChanged) return;

            Vector2 input = eyeVal;

            //wrap around values
            if (input.x > 360f) input.x -= 360f;
            if (input.x < -360f) input.x += 360f;
            if (input.y > 360f) input.y -= 360f;
            if (input.y < -360f) input.y += 360f;

            if (AnimPlayerIMGUI.animator == null) return;
            Object obj = AnimPlayerIMGUI.animator.gameObject;

            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                GameObject leftEye = MeshUtil.FindCharacterBone(root, "CC_Base_L_Eye");
                if (!leftEye) leftEye = MeshUtil.FindCharacterBone(root, "L_Eye");
                GameObject rightEye = MeshUtil.FindCharacterBone(root, "CC_Base_R_Eye");
                if (!rightEye) rightEye = MeshUtil.FindCharacterBone(root, "R_Eye");

                if (leftEye && rightEye)
                {
                    Vector3 euler = leftEye.transform.localRotation.eulerAngles;
                    euler.z = input.x;
                    euler.x = input.y;

                    Quaternion rotation = Quaternion.identity;
                    rotation.eulerAngles = euler;
                    leftEye.transform.localRotation = rotation;
                    rightEye.transform.localRotation = rotation;
                }
            }

            eyeChanged = false;
        }

        static void AdjustMouth(float input)
        {
            if (AnimPlayerIMGUI.animator == null) return;
            Object obj = AnimPlayerIMGUI.animator.gameObject;

            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                GameObject jawBone = MeshUtil.FindCharacterBone(root, "CC_Base_JawRoot");
                if (!jawBone) jawBone = MeshUtil.FindCharacterBone(root, "JawRoot");
                if (jawBone)
                {
                    Transform jaw = jawBone.transform;
                    Quaternion rotation = jaw.localRotation;
                    Vector3 euler = rotation.eulerAngles;
                    euler.z = input;
                    jaw.localEulerAngles = euler;
                }
            }
        }

        static void AdjustBlink(float input)
        {
            if (AnimPlayerIMGUI.animator == null) return;
            Object obj = AnimPlayerIMGUI.animator.gameObject;

            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                const string shapeNameSingle = "Eye_Blink";
                for (int i = 0; i < root.transform.childCount; i++)
                {
                    GameObject child = root.transform.GetChild(i).gameObject;
                    SkinnedMeshRenderer renderer = child.GetComponent<SkinnedMeshRenderer>();
                    if (renderer)
                    {
                        Mesh mesh = renderer.sharedMesh;
                        if (mesh.blendShapeCount > 0)
                        {
                            int shapeIndexS = mesh.GetBlendShapeIndex(shapeNameSingle);

                            if (shapeIndexS >= 0)
                            {
                                renderer.SetBlendShapeWeight(shapeIndexS, input);
                            }
                        }
                    }
                }
            }
        }

        static void SetFacialExpression(Dictionary<string, float> dict, bool restore = false)
        {
            if (animator == null) return;
            if (dict == null) return;

            Object obj = animator.gameObject;

            if (!restore)
            {
                if (dict != FACE_NEUTRAL)
                {
                    if (EXPRESSION != dict)
                    {
                        EXPRESSIVENESS = 0.25f;
                        EXPRESSION = dict;
                    }
                    else
                    {
                        EXPRESSIVENESS += 0.25f;
                        if (EXPRESSIVENESS > 1.0f) EXPRESSIVENESS = 0f;
                    }
                }
            }

            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                foreach (KeyValuePair<string, float> entry in dict)
                {
                    string shapeName = entry.Key;

                    if (shapeName.iEquals("**Turn_Jaw"))
                    {
                        if (!restore)
                        {
                            jawVal = jawRef - entry.Value * 0.25f * EXPRESSIVENESS;
                            AdjustMouth(jawVal);
                        }
                    }
                    else
                    {
                        for (int i = 0; i < root.transform.childCount; i++)
                        {
                            GameObject child = root.transform.GetChild(i).gameObject;
                            SkinnedMeshRenderer renderer = child.GetComponent<SkinnedMeshRenderer>();
                            if (renderer)
                            {
                                Mesh mesh = renderer.sharedMesh;
                                if (mesh.blendShapeCount > 0)
                                {
                                    int shapeIndexS = mesh.GetBlendShapeIndex(shapeName);

                                    if (shapeIndexS >= 0)
                                    {
                                        renderer.SetBlendShapeWeight(shapeIndexS, entry.Value * EXPRESSIVENESS);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        static void SetNeutralExpression()
        {
            SetFacialExpression(FACE_NEUTRAL, true);
        }

        static void SetIndividualBlendShape(string individualShapeName, float value)
        {
            if (AnimPlayerIMGUI.animator == null) return;
            Object obj = AnimPlayerIMGUI.animator.gameObject;

            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                for (int i = 0; i < root.transform.childCount; i++)
                {
                    GameObject child = root.transform.GetChild(i).gameObject;
                    SkinnedMeshRenderer renderer = child.GetComponent<SkinnedMeshRenderer>();
                    if (renderer)
                    {
                        Mesh mesh = renderer.sharedMesh;
                        if (mesh.blendShapeCount > 0)
                        {
                            int shapeIndexS = mesh.GetBlendShapeIndex(individualShapeName);

                            if (shapeIndexS >= 0)
                            {
                                renderer.SetBlendShapeWeight(shapeIndexS, value);
                            }
                        }
                    }
                }
            }
        }

        static void SnapViewToHead()
        {
            if (AnimPlayerIMGUI.animator == null) return;

            Object obj = AnimPlayerIMGUI.animator.gameObject;
            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                Vector3 snapLookAt = Vector3.zero;

                GameObject head = MeshUtil.FindCharacterBone(root, "CC_Base_Head");
                if (!head) head = MeshUtil.FindCharacterBone(root, "head");
                GameObject leftEye = MeshUtil.FindCharacterBone(root, "CC_Base_L_Eye");
                if (!leftEye) leftEye = MeshUtil.FindCharacterBone(root, "L_Eye");
                GameObject rightEye = MeshUtil.FindCharacterBone(root, "CC_Base_R_Eye");
                if (!rightEye) rightEye = MeshUtil.FindCharacterBone(root, "R_Eye");

                if (head && leftEye && rightEye)
                    snapLookAt = (head.transform.position + leftEye.transform.position + rightEye.transform.position) / 3f;
                else if (head)
                    snapLookAt = head.transform.position;

                if (head)
                {
                    camDir = Quaternion.AngleAxis(180f, head.transform.up) * head.transform.rotation;

                    //foreach (SceneView sv in SceneView.sceneViews)
                    //{
                        SceneView.lastActiveSceneView.LookAt(snapLookAt, camDir, 0.15f);
                    //}

                    SceneView.RepaintAll();
                }
            }
        }

        static Quaternion GetLookBackDir()
        {
            Quaternion rot = new Quaternion();
            Vector3 euler = rot.eulerAngles;
            euler.y = -180f;
            rot.eulerAngles = euler;
            return rot;
        }

        // Facial Expressions
        public static Dictionary<string, float> FACE_HAPPY = new Dictionary<string, float>
        {
            {"Brow_Raise_Inner_L", 0f },
            {"Brow_Raise_Inner_R", 0f },
            {"Brow_Raise_Outer_L", 0f },
            {"Brow_Raise_Outer_R", 0f },
            {"Brow_Drop_L", 0f },
            {"Brow_Drop_R", 0f },
            {"Brow_Raise_L", 70f },
            {"Brow_Raise_R", 70f },

            {"Eye_Wide_L", 40f },
            {"Eye_Wide_R", 40f },
            {"Eye_Squint_L", 30f },
            {"Eye_Squint_R", 30f },

            {"Nose_Scrunch", 0f },
            {"Nose_Nostrils_Flare", 40f },
            {"Cheek_Raise_L", 30f },
            {"Cheek_Raise_R", 30f },

            {"Mouth_Frown", 0f },
            {"Mouth_Blow", 0f },
            {"Mouth_Pucker", 0f },
            {"Mouth_Widen", 0f },
            {"Mouth_Widen_Sides", 0f },
            {"Mouth_Smile", 70f },
            {"Mouth_Smile_L", 40f },
            {"Mouth_Smile_R", 40f },
            {"Mouth_Dimple_L", 0f },
            {"Mouth_Dimple_R", 0f },
            {"Mouth_Plosive", 0f },
            {"Mouth_Lips_Open", 10f },
            {"Mouth_Lips_Part", 0f },
            {"Mouth_Bottom_Lip_Down", 70f },
            {"Mouth_Top_Lip_Up", 20f },
            {"Mouth_Bottom_Lip_Under", 30f },
            {"Mouth_Snarl_Upper_L", -20f },
            {"Mouth_Snarl_Upper_R", -20f },
            {"Mouth_Snarl_Lower_L", 0f },
            {"Mouth_Snarl_Lower_R", 0f },
            {"Mouth_Up", 30f },
            {"Mouth_Down", 0f },
            {"Mouth_Open", 0f },

            {"**Turn_Jaw", 9f },
        };

        public static Dictionary<string, float> FACE_SAD = new Dictionary<string, float>
        {
            {"Brow_Raise_Inner_L", 100f },
            {"Brow_Raise_Inner_R", 100f },
            {"Brow_Raise_Outer_L", 0f },
            {"Brow_Raise_Outer_R", 0f },
            {"Brow_Drop_L", 40f },
            {"Brow_Drop_R", 40f },
            {"Brow_Raise_L", 0f },
            {"Brow_Raise_R", 0f },

            {"Eye_Wide_L", 40f },
            {"Eye_Wide_R", 40f },
            {"Eye_Squint_L", 20f },
            {"Eye_Squint_R", 20f },

            {"Nose_Scrunch", 0f },
            {"Nose_Nostrils_Flare", 0f },
            {"Cheek_Raise_L", 60f },
            {"Cheek_Raise_R", 60f },

            {"Mouth_Frown", 30f },
            {"Mouth_Blow", 20f },
            {"Mouth_Pucker", 0f },
            {"Mouth_Widen", 30f },
            {"Mouth_Widen_Sides", 0f },
            {"Mouth_Smile", 0f },
            {"Mouth_Smile_L", 0f },
            {"Mouth_Smile_R", 0f },
            {"Mouth_Dimple_L", 0f },
            {"Mouth_Dimple_R", 0f },
            {"Mouth_Plosive", 0f },
            {"Mouth_Lips_Open", 0f },
            {"Mouth_Lips_Part", 30f },
            {"Mouth_Bottom_Lip_Down", 0f },
            {"Mouth_Top_Lip_Up", 30f },
            {"Mouth_Bottom_Lip_Under", 0f },
            {"Mouth_Snarl_Upper_L", 0f },
            {"Mouth_Snarl_Upper_R", 0f },
            {"Mouth_Snarl_Lower_L", 0f },
            {"Mouth_Snarl_Lower_R", 0f },
            {"Mouth_Up", 0f },
            {"Mouth_Down", 60f },
            {"Mouth_Open", 0f },

            {"**Turn_Jaw", 9f },
        };

        public static Dictionary<string, float> FACE_ANGRY = new Dictionary<string, float>
        {
            {"Brow_Raise_Inner_L", 0f },
            {"Brow_Raise_Inner_R", 0f },
            {"Brow_Raise_Outer_L", 50f },
            {"Brow_Raise_Outer_R", 50f },
            {"Brow_Drop_L", 0f },
            {"Brow_Drop_R", 0f },
            {"Brow_Raise_L", 0f },
            {"Brow_Raise_R", 0f },

            {"Eye_Wide_L", 100f },
            {"Eye_Wide_R", 100f },
            {"Eye_Squint_L", 60f },
            {"Eye_Squint_R", 60f },

            {"Nose_Scrunch", 80f },
            {"Nose_Nostrils_Flare", 0f },
            {"Cheek_Raise_L", 100f },
            {"Cheek_Raise_R", 100f },

            {"Mouth_Frown", 80f },
            {"Mouth_Blow", 0f },
            {"Mouth_Pucker", 30f },
            {"Mouth_Widen", 0f },
            {"Mouth_Widen_Sides", 0f },
            {"Mouth_Smile", 0f },
            {"Mouth_Smile_L", 0f },
            {"Mouth_Smile_R", 0f },
            {"Mouth_Dimple_L", 0f },
            {"Mouth_Dimple_R", 0f },
            {"Mouth_Plosive", 50f },
            {"Mouth_Lips_Open", 0f },
            {"Mouth_Lips_Part", 0f },
            {"Mouth_Bottom_Lip_Down", 60f },
            {"Mouth_Top_Lip_Up", 100f },
            {"Mouth_Bottom_Lip_Under", 0f },
            {"Mouth_Snarl_Upper_L", 0f },
            {"Mouth_Snarl_Upper_R", 0f },
            {"Mouth_Snarl_Lower_L", 0f },
            {"Mouth_Snarl_Lower_R", 0f },
            {"Mouth_Up", 50f },
            {"Mouth_Down", 0f },
            {"Mouth_Open", 0f },

            {"**Turn_Jaw", 20f },
        };

        public static Dictionary<string, float> FACE_DISGUST = new Dictionary<string, float>
        {
            {"Brow_Raise_Inner_L", 0f },
            {"Brow_Raise_Inner_R", 0f },
            {"Brow_Raise_Outer_L", 60f },
            {"Brow_Raise_Outer_R", 60f },
            {"Brow_Drop_L", 70f },
            {"Brow_Drop_R", 70f },
            {"Brow_Raise_L", 0f },
            {"Brow_Raise_R", 0f },

            {"Eye_Wide_L", 0f },
            {"Eye_Wide_R", 0f },
            {"Eye_Squint_L", 20f },
            {"Eye_Squint_R", 20f },

            {"Nose_Scrunch", 100f },
            {"Nose_Nostrils_Flare", 0f },
            {"Cheek_Raise_L", 60f },
            {"Cheek_Raise_R", 60f },

            {"Mouth_Frown", 30f },
            {"Mouth_Blow", 0f },
            {"Mouth_Pucker", 0f },
            {"Mouth_Widen", 0f },
            {"Mouth_Widen_Sides", 0f },
            {"Mouth_Smile", 0f },
            {"Mouth_Smile_L", 0f },
            {"Mouth_Smile_R", 0f },
            {"Mouth_Dimple_L", 30f },
            {"Mouth_Dimple_R", 30f },
            {"Mouth_Plosive", 0f },
            {"Mouth_Lips_Open", 0f },
            {"Mouth_Lips_Part", 0f },
            {"Mouth_Bottom_Lip_Down", 0f },
            {"Mouth_Top_Lip_Up", 100f },
            {"Mouth_Bottom_Lip_Under", 0f },
            {"Mouth_Snarl_Upper_L", 0f },
            {"Mouth_Snarl_Upper_R", 0f },
            {"Mouth_Snarl_Lower_L", 20f },
            {"Mouth_Snarl_Lower_R", 20f },
            {"Mouth_Up", 0f },
            {"Mouth_Down", 40f },
            {"Mouth_Open", 0f },

            {"**Turn_Jaw", 9f },
        };

        public static Dictionary<string, float> FACE_FEAR = new Dictionary<string, float>
        {
            {"Brow_Raise_Inner_L", 80f },
            {"Brow_Raise_Inner_R", 80f },
            {"Brow_Raise_Outer_L", 0f },
            {"Brow_Raise_Outer_R", 0f },
            {"Brow_Drop_L", 0f },
            {"Brow_Drop_R", 0f },
            {"Brow_Raise_L", 0f },
            {"Brow_Raise_R", 0f },

            {"Eye_Wide_L", 100f },
            {"Eye_Wide_R", 100f },
            {"Eye_Squint_L", 100f },
            {"Eye_Squint_R", 100f },

            {"Nose_Scrunch", 60f },
            {"Nose_Nostrils_Flare", 0f },
            {"Cheek_Raise_L", 100f },
            {"Cheek_Raise_R", 100f },

            {"Mouth_Frown", 70f },
            {"Mouth_Blow", 0f },
            {"Mouth_Pucker", 30f },
            {"Mouth_Widen", 40f },
            {"Mouth_Widen_Sides", 20f },
            {"Mouth_Smile", 0f },
            {"Mouth_Smile_L", 0f },
            {"Mouth_Smile_R", 0f },
            {"Mouth_Dimple_L", 0f },
            {"Mouth_Dimple_R", 0f },
            {"Mouth_Plosive", 0f },
            {"Mouth_Lips_Open", 0f },
            {"Mouth_Lips_Part", 0f },
            {"Mouth_Bottom_Lip_Down", 30f },
            {"Mouth_Top_Lip_Up", 100f },
            {"Mouth_Bottom_Lip_Under", 0f },
            {"Mouth_Snarl_Upper_L", 0f },
            {"Mouth_Snarl_Upper_R", 0f },
            {"Mouth_Snarl_Lower_L", 30f },
            {"Mouth_Snarl_Lower_R", 30f },
            {"Mouth_Up", 0f },
            {"Mouth_Down", 0f },
            {"Mouth_Open", 0f },

            {"**Turn_Jaw", 20f },
        };

        public static Dictionary<string, float> FACE_SURPRISE = new Dictionary<string, float>
        {
            {"Brow_Raise_Inner_L", 70f },
            {"Brow_Raise_Inner_R", 70f },
            {"Brow_Raise_Outer_L", 0f },
            {"Brow_Raise_Outer_R", 0f },
            {"Brow_Drop_L", 0f },
            {"Brow_Drop_R", 0f },
            {"Brow_Raise_L", 100f },
            {"Brow_Raise_R", 100f },

            {"Eye_Wide_L", 100f },
            {"Eye_Wide_R", 100f },
            {"Eye_Squint_L", 0f },
            {"Eye_Squint_R", 0f },

            {"Nose_Scrunch", 0f },
            {"Nose_Nostrils_Flare", 30f },
            {"Cheek_Raise_L", 70f },
            {"Cheek_Raise_R", 70f },

            {"Mouth_Frown", 0f },
            {"Mouth_Blow", 0f },
            {"Mouth_Pucker", 0f },
            {"Mouth_Widen", 0f },
            {"Mouth_Widen_Sides", 0f },
            {"Mouth_Smile", 60f },
            {"Mouth_Smile_L", 0f },
            {"Mouth_Smile_R", 0f },
            {"Mouth_Dimple_L", 0f },
            {"Mouth_Dimple_R", 0f },
            {"Mouth_Plosive", 0f },
            {"Mouth_Lips_Open", 0f },
            {"Mouth_Lips_Part", 0f },
            {"Mouth_Bottom_Lip_Down", 0f },
            {"Mouth_Top_Lip_Up", 0f },
            {"Mouth_Bottom_Lip_Under", 0f },
            {"Mouth_Snarl_Upper_L", 0f },
            {"Mouth_Snarl_Upper_R", 0f },
            {"Mouth_Snarl_Lower_L", 0f },
            {"Mouth_Snarl_Lower_R", 0f },
            {"Mouth_Up", 90f },
            {"Mouth_Down", 0f },
            {"Mouth_Open", 100f },

            {"**Turn_Jaw", 20f },
        };

        public static Dictionary<string, float> FACE_NEUTRAL = new Dictionary<string, float>
        {
            {"Brow_Raise_Inner_L", 0f },
            {"Brow_Raise_Inner_R", 0f },
            {"Brow_Raise_Outer_L", 0f },
            {"Brow_Raise_Outer_R", 0f },
            {"Brow_Drop_L", 0f },
            {"Brow_Drop_R", 0f },
            {"Brow_Raise_L", 0f },
            {"Brow_Raise_R", 0f },

            {"Eye_Wide_L", 0f },
            {"Eye_Wide_R", 0f },
            {"Eye_Squint_L", 0f },
            {"Eye_Squint_R", 0f },

            {"Nose_Scrunch", 0f },
            {"Nose_Nostrils_Flare", 0f },
            {"Cheek_Raise_L", 0f },
            {"Cheek_Raise_R", 0f },

            {"Mouth_Frown", 0f },
            {"Mouth_Blow", 0f },
            {"Mouth_Pucker", 0f },
            {"Mouth_Widen", 0f },
            {"Mouth_Widen_Sides", 0f },
            {"Mouth_Smile", 0f },
            {"Mouth_Smile_L", 0f },
            {"Mouth_Smile_R", 0f },
            {"Mouth_Dimple_L", 0f },
            {"Mouth_Dimple_R", 0f },
            {"Mouth_Plosive", 0f },
            {"Mouth_Lips_Open", 0f },
            {"Mouth_Lips_Part", 0f },
            {"Mouth_Bottom_Lip_Down", 0f },
            {"Mouth_Top_Lip_Up", 0f },
            {"Mouth_Bottom_Lip_Under", 0f },
            {"Mouth_Snarl_Upper_L", 0f },
            {"Mouth_Snarl_Upper_R", 0f },
            {"Mouth_Snarl_Lower_L", 0f },
            {"Mouth_Snarl_Lower_R", 0f },
            {"Mouth_Up", 0f },
            {"Mouth_Down", 0f },
            {"Mouth_Open", 0f },

            {"**Turn_Jaw", 0f },
        };

        #endregion FaceMorph
    }
}