using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine.SceneManagement;

namespace Reallusion.Import
{
    public struct PreviewScene
    {
        UnityEngine.SceneManagement.Scene scene;
        Transform container;
        Transform stage;
        Transform lighting;
        Transform character;
        Transform baked;


        public static PreviewScene OpenPreviewScene(GameObject fbx)
        {
            if (!fbx) return new PreviewScene();
            if (!EditorSceneManager.SaveCurrentModifiedScenesIfUserWantsTo()) return new PreviewScene();

            Scene scene = EditorSceneManager.NewScene(NewSceneSetup.EmptyScene);
            GameObject.Instantiate(Util.FindPreviewScenePrefab(), Vector3.zero, Quaternion.identity);

            PreviewScene previewScene = GetPreviewScene();

            previewScene.ShowPreviewCharacter(fbx);

            return previewScene;
        }

        public static PreviewScene GetPreviewScene()
        {
            PreviewScene ps = new PreviewScene();
            ps.container = GameObject.Find("Preview Scene Container")?.transform;
            ps.character = GameObject.Find("Character Container")?.transform;
            ps.baked = GameObject.Find("Baked Character Container")?.transform;
            ps.stage = GameObject.Find("Stage")?.transform;
            ps.lighting = GameObject.Find("Lighting")?.transform;
            ps.scene = UnityEngine.SceneManagement.SceneManager.GetActiveScene();
            return ps;
        }

        public bool IsValid { get { return scene.IsValid() && container && character && baked && stage && lighting; } }

        public GameObject GetPreviewCharacter()
        {
            if (character.transform.childCount > 0)
            {
                return character.transform.GetChild(0).gameObject;
            }

            return null;
        }

        public GameObject GetBakedCharacter()
        {
            if (baked.transform.childCount > 0)
            {
                return baked.transform.GetChild(0).gameObject;
            }

            return null;
        }

        public void ClearCharacter()
        {
            if (character)
            {
                GameObject[] children = new GameObject[character.childCount];

                for (int i = 0; i < character.childCount; i++)
                {
                    children[i] = character.GetChild(i).gameObject;
                }

                foreach (GameObject child in children)
                {
                    GameObject.DestroyImmediate(child);
                }
            }
        }

        public void ClearBaked()
        {
            if (baked)
            {
                GameObject[] children = new GameObject[baked.childCount];

                for (int i = 0; i < baked.childCount; i++)
                {
                    children[i] = baked.GetChild(i).gameObject;
                }

                foreach (GameObject child in children)
                {
                    GameObject.DestroyImmediate(child);
                }
            }
        }

        public GameObject ShowPreviewCharacter(GameObject fbxAsset)
        {
            if (!fbxAsset) return null;
            GameObject prefabAsset = Util.FindCharacterPrefabAsset(fbxAsset);

            if (character)
            {
                ClearCharacter();

                GameObject clone = PrefabUtility.InstantiatePrefab(prefabAsset ? prefabAsset : fbxAsset, character.transform) as GameObject;
                if (clone)
                {
                    Selection.activeGameObject = clone;
                    return clone;
                }
            }

            return null;
        }

        public GameObject ShowBakedCharacter(GameObject bakedAsset)
        {
            if (!bakedAsset) return null;            

            ClearBaked();

            GameObject clone = PrefabUtility.InstantiatePrefab(bakedAsset, baked.transform) as GameObject;
            if (clone)
            {
                Selection.activeGameObject = clone;
                return clone;
            }

            return null;
        }
    

        public GameObject UpdatePreviewCharacter(GameObject prefabAsset)
        {
            if (!prefabAsset) return null;            

            ClearCharacter();
            
            GameObject clone = PrefabUtility.InstantiatePrefab(prefabAsset, character.transform) as GameObject;
            if (clone)
            {
                Debug.Log("Replacing prefab with new generated prefab...");
                Selection.activeGameObject = clone;
                return clone;
            }

            return null;
        }
    }
}
