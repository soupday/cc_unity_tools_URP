using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEditor;
using UnityEditor.SceneManagement;

namespace Reallusion.Import
{
    [InitializeOnLoad]
    public static class WindowManager
    {
        public static Scene currentScene;
        public static PreviewScene previewScene;
        public static bool showTools = true;
        static WindowManager()
        {
            // Even if update is not the most elegant. Using hierarchyWindowChanged for CPU sake will not work in all cases, because when hierarchyWindowChanged is called, Time's values might be all higher than current values. Why? Because current values are set at the first frame. If you keep reloading the same scene, this case happens.
            EditorApplication.update += WindowManager.MonitorScene;             
        }        

        private static void MonitorScene()
        {
            Scene activeScene = EditorSceneManager.GetActiveScene();
            if (currentScene != activeScene)
            {
                currentScene = activeScene;
                previewScene = PreviewScene.GetPreviewScene();
            }

            bool isPlayerShown = AnimPlayerIMGUI.IsPlayerShown();
            bool validPreviewScene = previewScene.IsValid;

            if (validPreviewScene) 
            {                
                if (showTools && !isPlayerShown)
                {                    
                    AnimPlayerIMGUI.CreatePlayer(previewScene, ImporterWindow.Current?.Character?.Fbx);
                }
                else if (!showTools && isPlayerShown)
                {                    
                    AnimPlayerIMGUI.DestroyPlayer();
                }
            }
            else 
            {
                if (isPlayerShown)
                {                    
                    AnimPlayerIMGUI.DestroyPlayer();
                }
            }                       
        }
    }
}
