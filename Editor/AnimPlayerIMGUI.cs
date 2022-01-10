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
        
        public static void SetCharacter(GameObject characterPrefab)
        {
            Animator anim = characterPrefab.GetComponent<Animator>();
            AnimationClip firstClip = Util.GetFirstAnimationClipFromCharacter(characterPrefab);
            SetPlayerTargets(anim, firstClip);
            FacialMorphIMGUI.StartUp();
        }

        public static void SetPlayerTargets(Animator setAnimator, AnimationClip setClip)
        {
            if (setAnimator)
            {
                animator = setAnimator;

                if (setClip)
                {
                    if (AnimationMode.InAnimationMode())
                        AnimationMode.StopAnimationMode();

                    animationClip = setClip;
                    time = 0f;
                    play = false;

                    if (!AnimationMode.InAnimationMode())
                        AnimationMode.StartAnimationMode();

                    SampleOnce();
                }
            }
        }

        public static void DrawPlayer()
        {            
            GUILayout.BeginVertical();
            EditorGUI.BeginChangeCheck();
            foldOut = EditorGUILayout.Foldout(foldOut, "Animation Playback", EditorStyles.foldout);
            if (EditorGUI.EndChangeCheck())
                FacialMorphIMGUI.doOnceCatchMouse = true;
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

                GUILayout.EndHorizontal();

                EditorGUI.EndDisabledGroup();
            }
            GUILayout.EndVertical();
        }

        static void SampleOnce()
        {
            AnimationMode.BeginSampling();
            AnimationMode.SampleAnimationClip(animator.gameObject, animationClip, time);
            AnimationMode.EndSampling();
        }

        public static void CreatePlayer(GameObject characterPrefab = null)
        {
            if (characterPrefab)
            {
                SetCharacter(characterPrefab);
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
        }

        public static void DestroyPlayer()
        {
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

            if (AnimationMode.InAnimationMode())
                AnimationMode.StopAnimationMode();
            
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
    }
}

/* 
//update codeblock to run in controlling window - for rate limited smooth updates
void Update()
{
    if (time == 0f) time = EditorApplication.timeSinceStartup;
    deltaTime = EditorApplication.timeSinceStartup - time;
    time = EditorApplication.timeSinceStartup;

    if (!EditorApplication.isPlaying && AnimationMode.InAnimationMode())
    {               
        if (AnimPlayerIMGUI.animationClip && AnimPlayerIMGUI.animator)
        {
            if (AnimPlayerIMGUI.play)
            {
                double frameDuration = 1.0f / AnimPlayerIMGUI.animationClip.frameRate;

                AnimPlayerIMGUI.time += (float)deltaTime;
                frameTime += deltaTime;
                if (AnimPlayerIMGUI.time >= AnimPlayerIMGUI.animationClip.length)
                    AnimPlayerIMGUI.time = 0f;

                if (frameTime < frameDuration) return;
                frameTime = 0f;
            }
            else 
                frameTime = 1f;

            if (AnimPlayerIMGUI.current == AnimPlayerIMGUI.time) return;
                    
            AnimationMode.BeginSampling();
            AnimationMode.SampleAnimationClip(AnimPlayerIMGUI.animator.gameObject, AnimPlayerIMGUI.animationClip, AnimPlayerIMGUI.time);                    
            AnimationMode.EndSampling();

            SceneView.RepaintAll();
            AnimPlayerIMGUI.current = AnimPlayerIMGUI.time;
        }
    }
}
*/
