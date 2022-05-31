using System.IO;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

namespace Reallusion.Import
{
    public class Alembic
    {

        public static List<string> FindAlembics(string characterName, string characterFolder)
        {
            List<string> alembicGuids = new List<string>();            

            string rootFolder = "Assets/Alembic/" + characterName;
            string charFolder = characterFolder + "/Alembic/" + characterName;

            List<string> folders = new List<string>();

            if (AssetDatabase.IsValidFolder(rootFolder))
                folders.Add(rootFolder);

            if (AssetDatabase.IsValidFolder(charFolder))
                folders.Add(charFolder);

            string[] guids;

            if (folders.Count > 0)
            {
                guids = AssetDatabase.FindAssets("t:gameobject", folders.ToArray());

                foreach (string guid in guids)
                {
                    string path = AssetDatabase.GUIDToAssetPath(guid);
                    string extention = Path.GetExtension(path);
                    if (extention.iEquals(".abc"))
                    {
                        alembicGuids.Add(guid);
                    }
                }
            }

            folders.Clear();
            folders.Add(characterFolder);
            guids = AssetDatabase.FindAssets(characterName + " t:gameobject", folders.ToArray());

            foreach (string guid in guids)
            {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                string fileName = Path.GetFileNameWithoutExtension(path);
                string extention = Path.GetExtension(path);
                if (extention.iEquals(".abc") && fileName.iStartsWith(characterName))
                {
                    if (!alembicGuids.Contains(guid))
                        alembicGuids.Add(guid);
                }
            }

            return alembicGuids;
        }

        public static void ProcessAlembics(GameObject sourcePrefab, string characterName, string characterFolder)
        {
            List<string> guids = FindAlembics(characterName, characterFolder);

            Debug.Log(guids.Count);

            foreach (string guid in guids)
            {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                string folder = Path.GetDirectoryName(path);
                string fileName = Path.GetFileNameWithoutExtension(path);
                string extention = Path.GetExtension(path);
                string prefabPath = Path.Combine(folder, fileName + ".prefab");
                GameObject prefab = AssetDatabase.LoadAssetAtPath<GameObject>(path);

                Dictionary<string, Material> sourceMaterials = GetSourceMaterials(sourcePrefab);

                GameObject scenePrefab = PrefabUtility.InstantiatePrefab(prefab) as GameObject;
                if (scenePrefab)
                {
                    MeshRenderer[] renderers = scenePrefab.GetComponentsInChildren<MeshRenderer>();
                    foreach (MeshRenderer renderer in renderers)
                    {
                        string key = renderer.gameObject.name;
                        if (sourceMaterials.TryGetValue(key, out Material mat))
                        {
                            renderer.sharedMaterial = mat;
                        }
                        else
                        {
                            Debug.Log("Could not find material: " + key);
                        }
                    }
                }

                Debug.Log(prefabPath);

                //GameObject newPrefab = PrefabUtility.SaveAsPrefabAsset(scenePrefab, prefabPath);
                //UnityEngine.Object.DestroyImmediate(scenePrefab);
            }
        }       
        
        public static Dictionary<string, Material> GetSourceMaterials(GameObject sourcePrefab)
        {
            Dictionary<string, Material> materials = new Dictionary<string, Material>();

            SkinnedMeshRenderer[] renderers = sourcePrefab.GetComponentsInChildren<SkinnedMeshRenderer>();
            foreach (SkinnedMeshRenderer renderer in renderers)
            {
                foreach (Material mat in renderer.sharedMaterials)
                {
                    string key;
                    string matName = mat.name;
                    if (matName.Contains("_Transparency")) matName = matName.Replace("_Transparency", "");
                    if (matName.Contains("_Pbr")) matName = matName.Replace("_Pbr", "");

                    if (renderer.sharedMaterials.Length == 1)
                        key = renderer.gameObject.name + "Shape";
                    else
                        key = renderer.gameObject.name + "-" + matName + "Shape";

                    if (!materials.ContainsKey(key)) materials.Add(key, mat);

                    // try some variations to catch the combined body meshes:
                    if (renderer.sharedMaterials.Length > 1)
                    {
                        if (matName.iContains("std_eye") || matName.iContains("std_cornea"))
                        {
                            key = "CC_Base_Eye" + "-" + matName + "Shape";
                            if (!materials.ContainsKey(key)) materials.Add(key, mat);

                            key = "CC_Game_Eye" + "-" + matName + "Shape";
                            if (!materials.ContainsKey(key)) materials.Add(key, mat);
                        }

                        if (matName.iContains("std_teeth"))
                        {
                            key = "CC_Base_Teeth" + "-" + matName + "Shape";
                            if (!materials.ContainsKey(key)) materials.Add(key, mat);

                            key = "CC_Game_Teeth" + "-" + matName + "Shape";
                            if (!materials.ContainsKey(key)) materials.Add(key, mat);
                        }

                        if (matName.iContains("std_tongue"))
                        {
                            key = "CC_Base_Tongue" + "-" + matName + "Shape";
                            if (!materials.ContainsKey(key)) materials.Add(key, mat);

                            key = "CC_Game_Tongue" + "-" + matName + "Shape";
                            if (!materials.ContainsKey(key)) materials.Add(key, mat);
                        }
                    }
                }
            }

            return materials;
        }

    }
}
