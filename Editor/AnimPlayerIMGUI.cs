using UnityEngine;
using UnityEditor;

namespace Reallusion.Import
{
    public class AnimPlayerIMGUI
    {
        public static AnimationClip animationClip;
        public static Animator animator;
        public static bool play;
        public static float time, prev, current = 0f;        
        public static bool foldOut = true;
        public static bool FoldOut { get { return foldOut; } set { foldOut = value; } }        
        
        public static void SetCharacter(PreviewScene ps, GameObject fbx, bool refresh)
        {
            Debug.Log("SetCharacter");
            if (ps.IsValid)
            {
                GameObject scenePrefab = ps.GetPreviewCharacter();

                if (scenePrefab)
                {
                    GameObject sceneFbx = Util.GetScenePrefabRoot(scenePrefab);
                    Animator anim = scenePrefab.GetComponent<Animator>();
                    AnimationClip firstClip = Util.GetFirstAnimationClipFromCharacter(sceneFbx);

                    // if this is not representing the same character then reset the animation player
                    if (fbx != sceneFbx) UpdatePlayerTargets(anim, firstClip, refresh);
                    // otherwise continue with the current animation setup
                    else UpdatePlayerTargets(anim, firstClip, refresh);
                }
            }
        }

        public static void UpdatePlayerTargets(Animator setAnimator, AnimationClip setClip, bool refresh)
        {                        
            if (setAnimator)
            {
                if (AnimationMode.InAnimationMode()) AnimationMode.StopAnimationMode();

                if (animator != setAnimator)
                {                     
                    animator = setAnimator;                    
                }

                if (!refresh) FacialMorphIMGUI.StartUp();

                if (!animationClip)
                {
                    animationClip = setClip;
                    time = 0f;
                    play = false;
                }

                if (!AnimationMode.InAnimationMode()) AnimationMode.StartAnimationMode();

                if (animationClip) SampleOnce();
                if (refresh) FacialMorphIMGUI.ApplyFace();
            }
        }        

        public static void DrawPlayer()
        {            
            GUILayout.BeginVertical();
            EditorGUI.BeginChangeCheck();
            foldOut = EditorGUILayout.Foldout(foldOut, "Animation Playback", EditorStyles.foldout);
            if (EditorGUI.EndChangeCheck())
            {
                //if (foldOut && FacialMorphIMGUI.FoldOut)
                //    FacialMorphIMGUI.FoldOut = false;
                FacialMorphIMGUI.doOnceCatchMouse = true;
            }
            if (foldOut)
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
                        FacialMorphIMGUI.ResetFace();
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
                    FacialMorphIMGUI.ResetFace();
                }
                // "Animation.PrevKey"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("Animation.PrevKey").image, "Previous Frame"), EditorStyles.toolbarButton))
                {
                    play = false;
                    time -= 0.0166f;
                    FacialMorphIMGUI.ResetFace();
                }
                // "Animation.Play"
                EditorGUI.BeginChangeCheck();
                play = GUILayout.Toggle(play, new GUIContent(EditorGUIUtility.IconContent("Animation.Play").image, "Play (Toggle)"), EditorStyles.toolbarButton);
                if (EditorGUI.EndChangeCheck())
                {                    
                    FacialMorphIMGUI.ResetFace();
                }
                // "PauseButton"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("PauseButton").image, "Pause"), EditorStyles.toolbarButton))
                {
                    play = false;
                    FacialMorphIMGUI.ResetFace();
                }
                // "Animation.NextKey"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("Animation.NextKey").image, "Next Frame"), EditorStyles.toolbarButton))
                {
                    play = false;
                    time += 0.0166f;
                    FacialMorphIMGUI.ResetFace();
                }
                // "Animation.LastKey"
                if (GUILayout.Button(new GUIContent(EditorGUIUtility.IconContent("Animation.LastKey").image, "Last Frame"), EditorStyles.toolbarButton))
                {
                    play = false;
                    time = animationClip.length;
                    FacialMorphIMGUI.ResetFace();
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

        public static void CreatePlayer(PreviewScene ps, GameObject fbx, bool refresh)
        {
            if (fbx && ps.IsValid)
            {
                SetCharacter(ps, fbx, refresh);
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
            Debug.Log("DestroyPlayer()");
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

            FacialMorphIMGUI.AdjustEyes();

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
    }
}