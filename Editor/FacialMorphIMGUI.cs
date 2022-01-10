using UnityEngine;
using UnityEditor;
using Object = UnityEngine.Object;
using System.Collections.Generic;

namespace Reallusion.Import
{
    public static class FacialMorphIMGUI
    {
        public static bool foldOut = true;
        public static bool useLightIcons = false;
        public static bool doOnce = true;
        public static bool doOnceCatchMouse = true;
        public static bool eyeChanged = false;

        const float EXPRESSIVENESS = 0.5f;

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

        static bool resetView = false;
        static bool resetScene = false;
        static bool snapView = false;
        static Quaternion camDir;
        static Vector3 snapLookAt;
        static Vector3 sceneLookAt;

        public static void OnSceneGUI(SceneView sceneView)
        {
            if (snapView)
            {
                if (camDir == null) camDir = GetLookBackDir();
                sceneView.LookAt((snapLookAt != null) ? snapLookAt : Vector3.zero, camDir, 0.1f);
                snapView = false;
            }

            if (resetView)
            {   
                if (snapLookAt == null) snapLookAt = Vector3.zero;
                if (sceneLookAt == null) sceneLookAt = Vector3.zero;                
                sceneView.LookAt(resetScene ? sceneLookAt : snapLookAt, GetLookBackDir(), resetScene ? 1f : 0.1f);
                resetView = false;
                resetScene = false;
            }
        }

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
                GameObject head = MeshUtil.FindCharacterBone(root, "CC_Base_Head");
                if (!head) head = MeshUtil.FindCharacterBone(root, "head");
                GameObject hips = MeshUtil.FindCharacterBone(root, "CC_Base_Hip");
                if (!hips) hips = MeshUtil.FindCharacterBone(root, "pelvis");

                if (head && leftEye && rightEye)
                    snapLookAt = (head.transform.position + leftEye.transform.position + rightEye.transform.position) / 3f;
                else if (head)
                    snapLookAt = head.transform.position;

                if (hips)
                    sceneLookAt = hips.transform.position;

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
                SceneView.beforeSceneGui += FacialMorphIMGUI.OnSceneGUI;
                //ResetSceneViewCamera();
                SceneView.RepaintAll();
            }
        }

        public static void ResetFace()
        {
            SetNeutralExpression();
            Xpos = RestXpos;
            Ypos = RestYpos;
            eyeVal = eyeRef;
            eyeChanged = true;            
            jawVal = jawRef;
            AdjustMouth(jawVal);
            blinkVal = blinkRef;
            AdjustBlink(blinkVal);
        }

        public static void ResetFaceViewCamera()
        {
            resetView = true;
            resetScene = false;
        }

        public static void ResetSceneViewCamera()
        {
            resetView = true;
            resetScene = true;
        }

        public static void CleanUp()
        {            
            SceneView.beforeSceneGui -= FacialMorphIMGUI.OnSceneGUI;
            doOnce = true;
            doOnceCatchMouse = true;
        }

        public static void DrawFacialMorph()
        {
            if (doOnce)
            {
                StartUp();
                doOnce = !doOnce;
            }

            EditorGUI.BeginDisabledGroup(AnimPlayerIMGUI.play);
            foldOut = EditorGUILayout.Foldout(foldOut, "Facial Morph", EditorStyles.foldout);
            if (foldOut && Event.current.type == EventType.Repaint)
            {
                last = GUILayoutUtility.GetLastRect();
            }

            if (foldOut)
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
                    ResetFace();

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
                if (GUILayout.Button(new GUIContent(faceAngryImage, "Angry Face"), GUILayout.Height(32f), GUILayout.Width(32f)))
                {
                    ResetFace();
                    SetFacialExpression(RL.FACE_ANGRY, false);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceDisgust, "Disgusted Face"), GUILayout.Height(32f), GUILayout.Width(32f)))
                {
                    ResetFace();
                    SetFacialExpression(RL.FACE_DISGUST, false);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceFear, "Fearful Face"), GUILayout.Height(32f), GUILayout.Width(32f)))
                {
                    ResetFace();
                    SetFacialExpression(RL.FACE_FEAR, false);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceHappy, "Happy Face"), GUILayout.Height(32f), GUILayout.Width(32f)))
                {
                    ResetFace();
                    SetFacialExpression(RL.FACE_HAPPY, false);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceSad, "Sad Face"), GUILayout.Height(32f), GUILayout.Width(32f)))
                {
                    ResetFace();
                    SetFacialExpression(RL.FACE_SAD, false);
                }
                GUILayout.FlexibleSpace();
                if (GUILayout.Button(new GUIContent(faceSurprise, "Surprised Face"), GUILayout.Height(32f), GUILayout.Width(32f)))
                {
                    ResetFace();
                    SetFacialExpression(RL.FACE_SURPRISE, false);
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

                                Xpos = Mathf.Clamp(mouseEvent.mousePosition.x,
                                                   controlAreaRect.x,
                                                   controlAreaRect.x + controlAreaRect.width);

                                Ypos = Mathf.Clamp(mouseEvent.mousePosition.y,
                                                   controlAreaRect.y,
                                                   controlAreaRect.y + controlAreaRect.height);

                                eyeChanged = true;
                            }
                        }
                        break;

                    case EventType.MouseDrag:
                        {
                            if (GUIUtility.hotControl == controlAreaId)
                            {
                                Xpos = Mathf.Lerp(Xpos, Mathf.Clamp(mouseEvent.mousePosition.x,
                                                        controlAreaRect.x,
                                                        controlAreaRect.x + controlAreaRect.width), 0.35f);

                                Ypos = Mathf.Lerp(Ypos, Mathf.Clamp(mouseEvent.mousePosition.y,
                                                        controlAreaRect.y,
                                                        controlAreaRect.y + controlAreaRect.height), 0.35f);

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

        static void SetFacialExpression(Dictionary<string, float> dict, bool zeroAllValues)
        {
            if (AnimPlayerIMGUI.animator == null) return;
            Object obj = AnimPlayerIMGUI.animator.gameObject;

            GameObject root = PrefabUtility.GetOutermostPrefabInstanceRoot(obj);

            if (root)
            {
                foreach (KeyValuePair<string, float> entry in dict)
                {
                    string shapeName = entry.Key;

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
                                    renderer.SetBlendShapeWeight(shapeIndexS, zeroAllValues ? 0f : entry.Value * EXPRESSIVENESS);
                                }
                            }
                        }
                    }
                }
            }
        }

        static void SetNeutralExpression()
        {
            SetFacialExpression(RL.FACE_SURPRISE, true);
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
                    snapView = true;

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
    }
}