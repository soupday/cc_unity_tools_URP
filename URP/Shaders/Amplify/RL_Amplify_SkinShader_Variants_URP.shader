// Made with Amplify Shader Editor v1.9.6
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Reallusion/Amplify/RL_SkinShader_Variants_URP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_DiffuseMap("Diffuse Map", 2D) = "white" {}
		_DiffuseColor("Diffuse Color", Color) = (1,1,1,0)
		_MaskMap("Mask Map", 2D) = "gray" {}
		_AOStrength("AO Strength", Range( 0 , 1)) = 0
		_SmoothnessPower("SmoothnessPower", Range( 0.1 , 2)) = 0.1
		_SmoothnessMin("SmoothnessMin", Range( 0 , 1)) = 0
		_SmoothnessMax("SmoothnessMax", Range( 0 , 1)) = 0
		[Normal]_NormalMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Range( 0 , 2)) = 1
		[Normal]_MicroNormalMap("Micro Normal Map", 2D) = "bump" {}
		_MicroNormalStrength("Micro Normal Strength", Range( 0 , 1)) = 0.5
		_MicroNormalTiling("Micro Normal Tiling", Range( 0 , 50)) = 25
		_SSSMap("Subsurface Map", 2D) = "white" {}
		_SubsurfaceScale("Subsurface Scale", Range( 0 , 1)) = 1
		_SubsurfaceFalloff("Subsurface Falloff", Color) = (1,0.3686275,0.2980392,0)
		_SubsurfaceNormalSoften("Subsurface Normal Soften", Range( 0 , 1)) = 0.4
		_ThicknessMap("Thickness Map", 2D) = "black" {}
		_ThicknessScale("ThicknessScale", Range( 0 , 1)) = 1
		_EmissionMap("Emission Map", 2D) = "white" {}
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		_RGBAMask("RGBAMask", 2D) = "black" {}
		_MicroSmoothnessMod("Micro Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_RSmoothnessMod("R/Nose Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_GSmoothnessMod("G/Mouth Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_BSmoothnessMod("B/Upper Lid Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_ASmoothnessMod("A/Inner Lid Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_UnmaskedSmoothnessMod("Unmasked Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_RScatterScale("R/Nose Scatter Scale", Range( 0 , 2)) = 1
		_GScatterScale("G/Mouth Scatter Scale", Range( 0 , 2)) = 1
		_BScatterScale("B/Upper Lid Scatter Scale", Range( 0 , 2)) = 1
		_AScatterScale("A/Inner Lid Scatter Scale", Range( 0 , 2)) = 1
		_UnmaskedScatterScale("Unmasked Scatter Scale", Range( 0 , 2)) = 1
		[Toggle(BOOLEAN_IS_HEAD_ON)] BOOLEAN_IS_HEAD("Is Head", Float) = 1
		_ColorBlendMap("Color Blend Map (Head)", 2D) = "gray" {}
		_ColorBlendStrength("Color Blend Strength", Range( 0 , 1)) = 0
		[Normal]_NormalBlendMap("Normal Blend Map (Head)", 2D) = "bump" {}
		_NormalBlendStrength("Normal Blend Strength (Head)", Range( 0 , 2)) = 0
		_MNAOMap("Cavity AO Map", 2D) = "white" {}
		_MouthCavityAO("Mouth Cavity AO", Range( 0 , 5)) = 2.5
		_NostrilCavityAO("Nostril Cavity AO", Range( 0 , 5)) = 2.5
		_LipsCavityAO("Lips Cavity AO", Range( 0 , 5)) = 2.5
		_CFULCMask("CFULCMask", 2D) = "black" {}
		_CheekSmoothnessMod("Cheek Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_ForeheadSmoothnessMod("Forehead Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_UpperLipSmoothnessMod("Upper Lip Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_ChinSmoothnessMod("Chin Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_CheekScatterScale("Cheek Scatter Scale", Range( 0 , 2)) = 1
		_ForeheadScatterScale("Forehead Scatter Scale", Range( 0 , 2)) = 1
		_UpperLipScatterScale("Upper Lip Scatter Scale", Range( 0 , 2)) = 1
		_ChinScatterScale("Chin Scatter Scale", Range( 0 , 2)) = 1
		_EarNeckMask("EarNeckMask", 2D) = "black" {}
		_EarSmoothnessMod("Ear Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_NeckSmoothnessMod("Neck Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_EarScatterScale("Ear Scatter Scale", Range( 0 , 2)) = 1
		_NeckScatterScale("Neck Scatter Scale", Range( 0 , 2)) = 1
		[Toggle(BOOLEAN_USE_WRINKLE_ON)] BOOLEAN_USE_WRINKLE("Use Wrinkle", Float) = 0
		_WrinkleMaskSet1A("Wrinkle Mask Set 1A", 2D) = "black" {}
		_WrinkleMaskSet1B("Wrinkle Mask Set 1B", 2D) = "black" {}
		_WrinkleMaskSet2("Wrinkle Mask Set 2", 2D) = "black" {}
		_WrinkleMaskSet3("Wrinkle Mask Set 3", 2D) = "black" {}
		_WrinkleMaskSet123("Wrinkle Mask Set 123", 2D) = "black" {}
		_WrinkleDiffuseBlend1("Wrinkle Diffuse Blend 1", 2D) = "white" {}
		_WrinkleDiffuseBlend2("Wrinkle Diffuse Blend 2", 2D) = "white" {}
		_WrinkleDiffuseBlend3("Wrinkle Diffuse Blend 3", 2D) = "white" {}
		_WrinkleRoughnessBlend1("Wrinkle Roughness Blend 1", 2D) = "gray" {}
		_WrinkleRoughnessBlend2("Wrinkle Roughness Blend 2", 2D) = "gray" {}
		_WrinkleRoughnessBlend3("Wrinkle Roughness Blend 3", 2D) = "gray" {}
		[Normal]_WrinkleNormalBlend1("Wrinkle Normal Blend 1", 2D) = "bump" {}
		[Normal]_WrinkleNormalBlend2("Wrinkle Normal Blend 2", 2D) = "bump" {}
		[Normal]_WrinkleNormalBlend3("Wrinkle Normal Blend 3", 2D) = "bump" {}
		_WrinkleFlowMap1("Wrinkle Flow Map 1", 2D) = "white" {}
		_WrinkleFlowMap2("Wrinkle Flow Map 2", 2D) = "white" {}
		_WrinkleFlowMap3("Wrinkle Flow Map 3", 2D) = "white" {}
		_WrinkleValueSet1AL("Wrinkle Value Set 1A Left", Vector) = (0,0,0,0)
		_WrinkleValueSet1BL("Wrinkle Value Set 1B Left", Vector) = (0,0,0,0)
		_WrinkleValueSet2L("Wrinkle Value Set 2 Left", Vector) = (0,0,0,0)
		_WrinkleValueSet3L("Wrinkle Value Set 3 Left", Vector) = (0,0,0,0)
		_WrinkleValueSet12CL("Wrinkle Value Set 12C Left", Vector) = (0,0,0,0)
		_WrinkleValueSet1AR("Wrinkle Value Set 1A Right", Vector) = (0,0,0,0)
		_WrinkleValueSet1BR("Wrinkle Value Set 1B Right", Vector) = (0,0,0,0)
		_WrinkleValueSet2R("Wrinkle Value Set 2 Right", Vector) = (0,0,0,0)
		_WrinkleValueSet3R("Wrinkle Value Set 3 Right", Vector) = (0,0,0,0)
		_WrinkleValueSet12CR("Wrinkle Value Set 12C Right", Vector) = (0,0,0,0)
		_WrinkleValueSet3DB("Wrinkle Value Set 3D Both", Vector) = (0,0,0,0)
		_WrinkleValueSetBCCB("Wrinkle Value Set BCC Both", Vector) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		//[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Back
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
            #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ USE_LEGACY_LIGHTMAPS
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_FORWARD

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON
			#pragma multi_compile_local __ BOOLEAN_USE_WRINKLE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif	
				#if defined(USE_APV_PROBE_OCCLUSION)
					float4 probeOcclusion : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_DiffuseMap);
			SAMPLER(sampler_DiffuseMap);
			TEXTURE2D(_WrinkleDiffuseBlend1);
			SAMPLER(sampler_WrinkleDiffuseBlend1);
			TEXTURE2D(_WrinkleFlowMap1);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleDiffuseBlend2);
			TEXTURE2D(_WrinkleFlowMap2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleDiffuseBlend3);
			TEXTURE2D(_WrinkleFlowMap3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_ColorBlendMap);
			TEXTURE2D(_MNAOMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_WrinkleNormalBlend1);
			SAMPLER(sampler_WrinkleNormalBlend1);
			TEXTURE2D(_WrinkleNormalBlend2);
			TEXTURE2D(_WrinkleNormalBlend3);
			TEXTURE2D(_NormalBlendMap);
			TEXTURE2D(_SSSMap);
			TEXTURE2D(_RGBAMask);
			TEXTURE2D(_CFULCMask);
			TEXTURE2D(_EarNeckMask);
			TEXTURE2D(_MicroNormalMap);
			TEXTURE2D(_MaskMap);
			TEXTURE2D(_EmissionMap);
			TEXTURE2D(_WrinkleRoughnessBlend1);
			TEXTURE2D(_WrinkleRoughnessBlend2);
			TEXTURE2D(_WrinkleRoughnessBlend3);
			TEXTURE2D(_ThicknessMap);


			half4 MinMaxDeltaBlend4181_g112( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half3 MinMaxDeltaBlend3183_g112( half3 In, half3 In1, half3 In2, half3 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			void SkinMask179( half4 In1, half4 Mod1, half4 Scatter1, half UMMS, half UMSS, out half SmoothnessMod, out half ScatterMask )
			{
				float mask = saturate(In1.r + In1.g + In1.b + In1.a);
				float unmask = 1.0 - mask;
				SmoothnessMod = dot(In1, Mod1) + (UMMS * unmask);
				ScatterMask = dot(In1, Scatter1) + (UMSS * unmask);
				return;
			}
			
			void HeadMask156( half4 In1, half4 In2, half4 In3, half4 Mod1, half4 Mod2, half4 Mod3, half4 Scatter1, half4 Scatter2, half4 Scatter3, half UMMS, half UMSS, out half SmoothnessMod, out half ScatterMask )
			{
				In3.zw = 0;
				float4 m = In1 + In2 + In3;
				float mask = saturate(m.x + m.y + m.z + m.w);
				float unmask = 1.0 - mask;
				SmoothnessMod = dot(In1, Mod1) + dot(In2, Mod2) + dot(In3, Mod3) + (UMMS * unmask);
				ScatterMask = dot(In1, Scatter1) + dot(In2, Scatter2) + dot(In3, Scatter3) + (UMSS * unmask);
				return;
			}
			
			half MinMaxDeltaBlend1182_g112( half In, half In1, half In2, half In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord9.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				OUTPUT_SH4( vertexInput.positionWS, normalInput.normalWS.xyz, GetWorldSpaceNormalizeViewDir( vertexInput.positionWS ), o.lightmapUVOrVertexSH.xyz, o.probeOcclusion );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_DiffuseMap = IN.ase_texcoord9.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 diffuseMap368 = SAMPLE_TEXTURE2D( _DiffuseMap, sampler_DiffuseMap, uv_DiffuseMap );
				half4 diffuse184_g112 = diffuseMap368;
				half4 In181_g112 = diffuse184_g112;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowMap1 = IN.ase_texcoord9.xy * _WrinkleFlowMap1_ST.xy + _WrinkleFlowMap1_ST.zw;
				half2 texCoord10_g112 = IN.ase_texcoord9.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g114 = 0.49;
				half leftMask27_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g114 ) / ( 0.51 - temp_output_1_0_g114 ) ) );
				half4 break107_g112 = _WrinkleValueSet12CL;
				half2 appendResult112_g112 = (half2(break107_g112.x , break107_g112.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord9.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g112 = (half2(break109_g112.x , break109_g112.y));
				half dotResult121_g112 = dot( appendResult112_g112 , appendResult115_g112 );
				half value1CLeft135_g112 = dotResult121_g112;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord9.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g112 = dot( _WrinkleValueSet1AL , maskSet1A214_g112 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord9.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g112 = dot( _WrinkleValueSet1BL , temp_output_16_0_g112 );
				half dotResult30_g112 = dot( maskSet1A214_g112 , _WrinkleValueSet1AR );
				half dotResult36_g112 = dot( temp_output_16_0_g112 , _WrinkleValueSet1BR );
				half4 break108_g112 = _WrinkleValueSet12CR;
				half2 appendResult117_g112 = (half2(break108_g112.x , break108_g112.y));
				half dotResult122_g112 = dot( appendResult115_g112 , appendResult117_g112 );
				half value1CRight136_g112 = dotResult122_g112;
				half temp_output_1_0_g113 = 0.51;
				half rightMask28_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g113 ) / ( 0.49 - temp_output_1_0_g113 ) ) );
				half temp_output_16_0_g116 = ( ( leftMask27_g112 * ( value1CLeft135_g112 + dotResult29_g112 + dotResult35_g112 ) ) + ( ( dotResult30_g112 + dotResult36_g112 + value1CRight136_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g116 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap1, sampler_Linear_Repeat, uv_WrinkleFlowMap1 ).g + temp_output_16_0_g116 ) ) * temp_output_16_0_g116 );
				half4 In1181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				float2 uv_WrinkleFlowMap2 = IN.ase_texcoord9.xy * _WrinkleFlowMap2_ST.xy + _WrinkleFlowMap2_ST.zw;
				half2 appendResult113_g112 = (half2(break107_g112.z , break107_g112.w));
				half2 appendResult114_g112 = (half2(break109_g112.z , break109_g112.w));
				half dotResult123_g112 = dot( appendResult113_g112 , appendResult114_g112 );
				half value2CLeft137_g112 = dotResult123_g112;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord9.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g112 = dot( _WrinkleValueSet2L , temp_output_17_0_g112 );
				half dotResult42_g112 = dot( temp_output_17_0_g112 , _WrinkleValueSet2R );
				half2 appendResult116_g112 = (half2(break108_g112.z , break108_g112.w));
				half dotResult124_g112 = dot( appendResult114_g112 , appendResult116_g112 );
				half value2CRight138_g112 = dotResult124_g112;
				half temp_output_16_0_g117 = ( ( leftMask27_g112 * ( value2CLeft137_g112 + dotResult41_g112 ) ) + ( ( dotResult42_g112 + value2CRight138_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g117 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap2, sampler_Linear_Repeat, uv_WrinkleFlowMap2 ).g + temp_output_16_0_g117 ) ) * temp_output_16_0_g117 );
				half4 In2181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				float2 uv_WrinkleFlowMap3 = IN.ase_texcoord9.xy * _WrinkleFlowMap3_ST.xy + _WrinkleFlowMap3_ST.zw;
				half4 break211_g112 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g112 = ( break211_g112.x * maskSet1A214_g112.y );
				half4 break118_g112 = _WrinkleValueSet3DB;
				half2 appendResult120_g112 = (half2(break118_g112.x , break118_g112.y));
				half dotResult127_g112 = dot( appendResult120_g112 , appendResult115_g112 );
				half value3DLeft129_g112 = dotResult127_g112;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord9.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g112 = dot( _WrinkleValueSet3L , temp_output_18_0_g112 );
				half dotResult48_g112 = dot( temp_output_18_0_g112 , _WrinkleValueSet3R );
				half2 appendResult119_g112 = (half2(break118_g112.z , break118_g112.w));
				half dotResult128_g112 = dot( appendResult115_g112 , appendResult119_g112 );
				half value3DRight130_g112 = dotResult128_g112;
				half valueBCCRight219_g112 = ( maskSet1A214_g112.y * break211_g112.y );
				half temp_output_16_0_g115 = ( ( leftMask27_g112 * ( valueBCCLeft217_g112 + value3DLeft129_g112 + dotResult47_g112 ) ) + ( ( dotResult48_g112 + value3DRight130_g112 + valueBCCRight219_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g115 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap3, sampler_Linear_Repeat, uv_WrinkleFlowMap3 ).g + temp_output_16_0_g115 ) ) * temp_output_16_0_g115 );
				half4 In3181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g112 ) * temp_output_23_0_g115 );
				half4 localMinMaxDeltaBlend4181_g112 = MinMaxDeltaBlend4181_g112( In181_g112 , In1181_g112 , In2181_g112 , In3181_g112 );
				half4 diffuseWrinkle365 = localMinMaxDeltaBlend4181_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch370 = diffuseWrinkle365;
				#else
				half4 staticSwitch370 = diffuseMap368;
				#endif
				half4 temp_output_339_0 = ( _DiffuseColor * staticSwitch370 );
				float2 uv_ColorBlendMap = IN.ase_texcoord9.xy * _ColorBlendMap_ST.xy + _ColorBlendMap_ST.zw;
				half4 blendOpSrc13 = SAMPLE_TEXTURE2D( _ColorBlendMap, sampler_DiffuseMap, uv_ColorBlendMap );
				half4 blendOpDest13 = temp_output_339_0;
				half4 lerpBlendMode13 = lerp(blendOpDest13,(( blendOpDest13 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest13 ) * ( 1.0 - blendOpSrc13 ) ) : ( 2.0 * blendOpDest13 * blendOpSrc13 ) ),_ColorBlendStrength);
				float2 uv_MNAOMap = IN.ase_texcoord9.xy * _MNAOMap_ST.xy + _MNAOMap_ST.zw;
				half4 tex2DNode196 = SAMPLE_TEXTURE2D( _MNAOMap, sampler_Linear_Repeat, uv_MNAOMap );
				half saferPower201 = abs( tex2DNode196.g );
				half saferPower202 = abs( tex2DNode196.b );
				half saferPower203 = abs( tex2DNode196.a );
				half cavityAO280 = ( pow( saferPower201 , _MouthCavityAO ) * pow( saferPower202 , _NostrilCavityAO ) * pow( saferPower203 , _LipsCavityAO ) );
				#ifdef BOOLEAN_IS_HEAD_ON
				half4 staticSwitch72 = ( ( saturate( lerpBlendMode13 )) * cavityAO280 );
				#else
				half4 staticSwitch72 = temp_output_339_0;
				#endif
				half4 baseColor266 = staticSwitch72;
				
				float2 uv_NormalMap = IN.ase_texcoord9.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				half normalMapScale387 = _NormalStrength;
				half3 unpack48 = UnpackNormalScale( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, uv_NormalMap ), normalMapScale387 );
				unpack48.z = lerp( 1, unpack48.z, saturate(normalMapScale387) );
				half3 normalMap373 = unpack48;
				half3 normal186_g112 = normalMap373;
				half3 In183_g112 = normal186_g112;
				float2 uv_WrinkleNormalBlend1 = IN.ase_texcoord9.xy * _WrinkleNormalBlend1_ST.xy + _WrinkleNormalBlend1_ST.zw;
				half3 unpack358 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend1, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend1 ), normalMapScale387 );
				unpack358.z = lerp( 1, unpack358.z, saturate(normalMapScale387) );
				half3 In1183_g112 = ( ( unpack358 - normal186_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleNormalBlend2 = IN.ase_texcoord9.xy * _WrinkleNormalBlend2_ST.xy + _WrinkleNormalBlend2_ST.zw;
				half3 unpack359 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend2, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend2 ), normalMapScale387 );
				unpack359.z = lerp( 1, unpack359.z, saturate(normalMapScale387) );
				half3 In2183_g112 = ( ( unpack359 - normal186_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleNormalBlend3 = IN.ase_texcoord9.xy * _WrinkleNormalBlend3_ST.xy + _WrinkleNormalBlend3_ST.zw;
				half3 unpack360 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend3, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend3 ), normalMapScale387 );
				unpack360.z = lerp( 1, unpack360.z, saturate(normalMapScale387) );
				half3 In3183_g112 = ( ( unpack360 - normal186_g112 ) * temp_output_23_0_g115 );
				half3 localMinMaxDeltaBlend3183_g112 = MinMaxDeltaBlend3183_g112( In183_g112 , In1183_g112 , In2183_g112 , In3183_g112 );
				half3 normalWrinkle367 = localMinMaxDeltaBlend3183_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half3 staticSwitch372 = normalWrinkle367;
				#else
				half3 staticSwitch372 = normalMap373;
				#endif
				float2 uv_NormalBlendMap = IN.ase_texcoord9.xy * _NormalBlendMap_ST.xy + _NormalBlendMap_ST.zw;
				float2 uv_SSSMap = IN.ase_texcoord9.xy * _SSSMap_ST.xy + _SSSMap_ST.zw;
				half localSkinMask179 = ( 0.0 );
				float2 uv_RGBAMask = IN.ase_texcoord9.xy * _RGBAMask_ST.xy + _RGBAMask_ST.zw;
				half4 tex2DNode123 = SAMPLE_TEXTURE2D( _RGBAMask, sampler_Linear_Repeat, uv_RGBAMask );
				half4 In1179 = tex2DNode123;
				half4 appendResult150 = (half4(_RSmoothnessMod , _GSmoothnessMod , _BSmoothnessMod , _ASmoothnessMod));
				half4 Mod1179 = appendResult150;
				half4 appendResult153 = (half4(_RScatterScale , _GScatterScale , _BScatterScale , _AScatterScale));
				half4 Scatter1179 = appendResult153;
				half UMMS179 = _UnmaskedSmoothnessMod;
				half UMSS179 = _UnmaskedScatterScale;
				half SmoothnessMod179 = 0.0;
				half ScatterMask179 = 0.0;
				SkinMask179( In1179 , Mod1179 , Scatter1179 , UMMS179 , UMSS179 , SmoothnessMod179 , ScatterMask179 );
				half localHeadMask156 = ( 0.0 );
				half4 In1156 = tex2DNode123;
				float2 uv_CFULCMask = IN.ase_texcoord9.xy * _CFULCMask_ST.xy + _CFULCMask_ST.zw;
				half4 In2156 = SAMPLE_TEXTURE2D( _CFULCMask, sampler_Linear_Repeat, uv_CFULCMask );
				float2 uv_EarNeckMask = IN.ase_texcoord9.xy * _EarNeckMask_ST.xy + _EarNeckMask_ST.zw;
				half4 In3156 = SAMPLE_TEXTURE2D( _EarNeckMask, sampler_Linear_Repeat, uv_EarNeckMask );
				half4 Mod1156 = appendResult150;
				half4 appendResult151 = (half4(_CheekSmoothnessMod , _ForeheadSmoothnessMod , _UpperLipSmoothnessMod , _ChinSmoothnessMod));
				half4 Mod2156 = appendResult151;
				half4 appendResult152 = (half4(_NeckSmoothnessMod , _EarSmoothnessMod , 0.0 , 0.0));
				half4 Mod3156 = appendResult152;
				half4 Scatter1156 = appendResult153;
				half4 appendResult154 = (half4(_CheekScatterScale , _ForeheadScatterScale , _UpperLipScatterScale , _ChinScatterScale));
				half4 Scatter2156 = appendResult154;
				half4 appendResult155 = (half4(_NeckScatterScale , _EarScatterScale , 0.0 , 0.0));
				half4 Scatter3156 = appendResult155;
				half UMMS156 = _UnmaskedSmoothnessMod;
				half UMSS156 = _UnmaskedScatterScale;
				half SmoothnessMod156 = 0.0;
				half ScatterMask156 = 0.0;
				HeadMask156( In1156 , In2156 , In3156 , Mod1156 , Mod2156 , Mod3156 , Scatter1156 , Scatter2156 , Scatter3156 , UMMS156 , UMSS156 , SmoothnessMod156 , ScatterMask156 );
				#ifdef BOOLEAN_IS_HEAD_ON
				half staticSwitch169 = ScatterMask156;
				#else
				half staticSwitch169 = ScatterMask179;
				#endif
				half microScatteringMultiplier277 = ( _SubsurfaceScale * staticSwitch169 );
				half temp_output_336_0 = saturate( ( SAMPLE_TEXTURE2D( _SSSMap, sampler_Linear_Repeat, uv_SSSMap ).g * microScatteringMultiplier277 ) );
				half subsurfaceFlattenNormals274 = saturate( ( 1.0 - ( temp_output_336_0 * temp_output_336_0 * _SubsurfaceNormalSoften ) ) );
				half3 unpack50 = UnpackNormalScale( SAMPLE_TEXTURE2D( _NormalBlendMap, sampler_NormalMap, uv_NormalBlendMap ), ( subsurfaceFlattenNormals274 * _NormalBlendStrength ) );
				unpack50.z = lerp( 1, unpack50.z, saturate(( subsurfaceFlattenNormals274 * _NormalBlendStrength )) );
				#ifdef BOOLEAN_IS_HEAD_ON
				half3 staticSwitch71 = BlendNormal( staticSwitch372 , unpack50 );
				#else
				half3 staticSwitch71 = staticSwitch372;
				#endif
				half2 temp_cast_15 = (_MicroNormalTiling).xx;
				half2 texCoord308 = IN.ase_texcoord9.xy * temp_cast_15 + float2( 0,0 );
				float2 uv_MaskMap = IN.ase_texcoord9.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				half4 tex2DNode32 = SAMPLE_TEXTURE2D( _MaskMap, sampler_Linear_Repeat, uv_MaskMap );
				half microNormalMask287 = tex2DNode32.b;
				half3 unpack52 = UnpackNormalScale( SAMPLE_TEXTURE2D( _MicroNormalMap, sampler_NormalMap, texCoord308 ), ( _MicroNormalStrength * microNormalMask287 * subsurfaceFlattenNormals274 ) );
				unpack52.z = lerp( 1, unpack52.z, saturate(( _MicroNormalStrength * microNormalMask287 * subsurfaceFlattenNormals274 )) );
				
				float2 uv_EmissionMap = IN.ase_texcoord9.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				half metallicMap285 = tex2DNode32.r;
				
				half smoothnessMap288 = tex2DNode32.a;
				half smoothness185_g112 = smoothnessMap288;
				half In182_g112 = smoothness185_g112;
				float2 uv_WrinkleRoughnessBlend1 = IN.ase_texcoord9.xy * _WrinkleRoughnessBlend1_ST.xy + _WrinkleRoughnessBlend1_ST.zw;
				half In1182_g112 = ( ( ( 1.0 - SAMPLE_TEXTURE2D( _WrinkleRoughnessBlend1, sampler_Linear_Repeat, uv_WrinkleRoughnessBlend1 ).g ) - smoothness185_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleRoughnessBlend2 = IN.ase_texcoord9.xy * _WrinkleRoughnessBlend2_ST.xy + _WrinkleRoughnessBlend2_ST.zw;
				half In2182_g112 = ( ( ( 1.0 - SAMPLE_TEXTURE2D( _WrinkleRoughnessBlend2, sampler_Linear_Repeat, uv_WrinkleRoughnessBlend2 ).g ) - smoothness185_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleRoughnessBlend3 = IN.ase_texcoord9.xy * _WrinkleRoughnessBlend3_ST.xy + _WrinkleRoughnessBlend3_ST.zw;
				half In3182_g112 = ( ( ( 1.0 - SAMPLE_TEXTURE2D( _WrinkleRoughnessBlend3, sampler_Linear_Repeat, uv_WrinkleRoughnessBlend3 ).g ) - smoothness185_g112 ) * temp_output_23_0_g115 );
				half localMinMaxDeltaBlend1182_g112 = MinMaxDeltaBlend1182_g112( In182_g112 , In1182_g112 , In2182_g112 , In3182_g112 );
				half smoothnessWrinkle366 = localMinMaxDeltaBlend1182_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half staticSwitch377 = smoothnessWrinkle366;
				#else
				half staticSwitch377 = smoothnessMap288;
				#endif
				half cavityMask295 = tex2DNode196.r;
				#ifdef BOOLEAN_IS_HEAD_ON
				half staticSwitch223 = ( staticSwitch377 * cavityMask295 );
				#else
				half staticSwitch223 = staticSwitch377;
				#endif
				half saferPower39 = abs( staticSwitch223 );
				half lerpResult41 = lerp( _SmoothnessMin , _SmoothnessMax , pow( saferPower39 , _SmoothnessPower ));
				#ifdef BOOLEAN_IS_HEAD_ON
				half staticSwitch170 = SmoothnessMod156;
				#else
				half staticSwitch170 = SmoothnessMod179;
				#endif
				half microSmoothnessMod276 = ( staticSwitch170 + _MicroSmoothnessMod );
				
				half ambientOcclusionMap286 = tex2DNode32.g;
				
				float2 uv_ThicknessMap = IN.ase_texcoord9.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				half4 temp_output_307_0 = ( baseColor266 * _SubsurfaceFalloff );
				

				float3 BaseColor = baseColor266.rgb;
				float3 Normal = BlendNormal( staticSwitch71 , unpack52 );
				float3 Emission = ( _EmissiveColor * SAMPLE_TEXTURE2D( _EmissionMap, sampler_DiffuseMap, uv_EmissionMap ) ).rgb;
				float3 Specular = 0.5;
				float Metallic = metallicMap285;
				float Smoothness = ( lerpResult41 + microSmoothnessMod276 );
				float Occlusion = ( 1.0 - ( ( 1.0 - ambientOcclusionMap286 ) * _AOStrength ) );
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = ( SAMPLE_TEXTURE2D( _ThicknessMap, sampler_Linear_Repeat, uv_ThicknessMap ).g * _ThicknessScale * temp_output_307_0 ).rgb;
				float3 Translucency = ( temp_output_307_0 * ( temp_output_336_0 * 0.2 ) ).rgb;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);
				#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
					inputData.bakedGI = SAMPLE_GI( SH, GetAbsolutePositionWS(inputData.positionWS),
						inputData.normalWS,
						inputData.viewDirectionWS,
						inputData.positionCS.xy,
						inputData.probeOcclusion,
						inputData.shadowMask );
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.positionCS, surfaceData, inputData);
				#endif

				#ifdef _ASE_LIGHTING_SIMPLE
					half4 color = UniversalFragmentBlinnPhong( inputData, surfaceData);
				#else
					half4 color = UniversalFragmentPBR( inputData, surfaceData);
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							[loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							[loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#define EPSILON 0.001

				#if UNITY_REVERSED_Z
					float clamped = min(positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE);
				#else
					float clamped = max(positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE);
				#endif
				positionCS.z = lerp(positionCS.z, clamped, saturate(_ShadowBias.y + EPSILON));

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON
			#pragma multi_compile_local __ BOOLEAN_USE_WRINKLE_ON


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_DiffuseMap);
			SAMPLER(sampler_DiffuseMap);
			TEXTURE2D(_WrinkleDiffuseBlend1);
			SAMPLER(sampler_WrinkleDiffuseBlend1);
			TEXTURE2D(_WrinkleFlowMap1);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleDiffuseBlend2);
			TEXTURE2D(_WrinkleFlowMap2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleDiffuseBlend3);
			TEXTURE2D(_WrinkleFlowMap3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_ColorBlendMap);
			TEXTURE2D(_MNAOMap);
			TEXTURE2D(_EmissionMap);


			half4 MinMaxDeltaBlend4181_g112( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord4.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				o.positionCS = MetaVertexPosition( v.positionOS, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.positionOS.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_DiffuseMap = IN.ase_texcoord4.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 diffuseMap368 = SAMPLE_TEXTURE2D( _DiffuseMap, sampler_DiffuseMap, uv_DiffuseMap );
				half4 diffuse184_g112 = diffuseMap368;
				half4 In181_g112 = diffuse184_g112;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord4.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowMap1 = IN.ase_texcoord4.xy * _WrinkleFlowMap1_ST.xy + _WrinkleFlowMap1_ST.zw;
				half2 texCoord10_g112 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g114 = 0.49;
				half leftMask27_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g114 ) / ( 0.51 - temp_output_1_0_g114 ) ) );
				half4 break107_g112 = _WrinkleValueSet12CL;
				half2 appendResult112_g112 = (half2(break107_g112.x , break107_g112.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord4.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g112 = (half2(break109_g112.x , break109_g112.y));
				half dotResult121_g112 = dot( appendResult112_g112 , appendResult115_g112 );
				half value1CLeft135_g112 = dotResult121_g112;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord4.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g112 = dot( _WrinkleValueSet1AL , maskSet1A214_g112 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord4.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g112 = dot( _WrinkleValueSet1BL , temp_output_16_0_g112 );
				half dotResult30_g112 = dot( maskSet1A214_g112 , _WrinkleValueSet1AR );
				half dotResult36_g112 = dot( temp_output_16_0_g112 , _WrinkleValueSet1BR );
				half4 break108_g112 = _WrinkleValueSet12CR;
				half2 appendResult117_g112 = (half2(break108_g112.x , break108_g112.y));
				half dotResult122_g112 = dot( appendResult115_g112 , appendResult117_g112 );
				half value1CRight136_g112 = dotResult122_g112;
				half temp_output_1_0_g113 = 0.51;
				half rightMask28_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g113 ) / ( 0.49 - temp_output_1_0_g113 ) ) );
				half temp_output_16_0_g116 = ( ( leftMask27_g112 * ( value1CLeft135_g112 + dotResult29_g112 + dotResult35_g112 ) ) + ( ( dotResult30_g112 + dotResult36_g112 + value1CRight136_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g116 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap1, sampler_Linear_Repeat, uv_WrinkleFlowMap1 ).g + temp_output_16_0_g116 ) ) * temp_output_16_0_g116 );
				half4 In1181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord4.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				float2 uv_WrinkleFlowMap2 = IN.ase_texcoord4.xy * _WrinkleFlowMap2_ST.xy + _WrinkleFlowMap2_ST.zw;
				half2 appendResult113_g112 = (half2(break107_g112.z , break107_g112.w));
				half2 appendResult114_g112 = (half2(break109_g112.z , break109_g112.w));
				half dotResult123_g112 = dot( appendResult113_g112 , appendResult114_g112 );
				half value2CLeft137_g112 = dotResult123_g112;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord4.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g112 = dot( _WrinkleValueSet2L , temp_output_17_0_g112 );
				half dotResult42_g112 = dot( temp_output_17_0_g112 , _WrinkleValueSet2R );
				half2 appendResult116_g112 = (half2(break108_g112.z , break108_g112.w));
				half dotResult124_g112 = dot( appendResult114_g112 , appendResult116_g112 );
				half value2CRight138_g112 = dotResult124_g112;
				half temp_output_16_0_g117 = ( ( leftMask27_g112 * ( value2CLeft137_g112 + dotResult41_g112 ) ) + ( ( dotResult42_g112 + value2CRight138_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g117 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap2, sampler_Linear_Repeat, uv_WrinkleFlowMap2 ).g + temp_output_16_0_g117 ) ) * temp_output_16_0_g117 );
				half4 In2181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord4.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				float2 uv_WrinkleFlowMap3 = IN.ase_texcoord4.xy * _WrinkleFlowMap3_ST.xy + _WrinkleFlowMap3_ST.zw;
				half4 break211_g112 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g112 = ( break211_g112.x * maskSet1A214_g112.y );
				half4 break118_g112 = _WrinkleValueSet3DB;
				half2 appendResult120_g112 = (half2(break118_g112.x , break118_g112.y));
				half dotResult127_g112 = dot( appendResult120_g112 , appendResult115_g112 );
				half value3DLeft129_g112 = dotResult127_g112;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord4.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g112 = dot( _WrinkleValueSet3L , temp_output_18_0_g112 );
				half dotResult48_g112 = dot( temp_output_18_0_g112 , _WrinkleValueSet3R );
				half2 appendResult119_g112 = (half2(break118_g112.z , break118_g112.w));
				half dotResult128_g112 = dot( appendResult115_g112 , appendResult119_g112 );
				half value3DRight130_g112 = dotResult128_g112;
				half valueBCCRight219_g112 = ( maskSet1A214_g112.y * break211_g112.y );
				half temp_output_16_0_g115 = ( ( leftMask27_g112 * ( valueBCCLeft217_g112 + value3DLeft129_g112 + dotResult47_g112 ) ) + ( ( dotResult48_g112 + value3DRight130_g112 + valueBCCRight219_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g115 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap3, sampler_Linear_Repeat, uv_WrinkleFlowMap3 ).g + temp_output_16_0_g115 ) ) * temp_output_16_0_g115 );
				half4 In3181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g112 ) * temp_output_23_0_g115 );
				half4 localMinMaxDeltaBlend4181_g112 = MinMaxDeltaBlend4181_g112( In181_g112 , In1181_g112 , In2181_g112 , In3181_g112 );
				half4 diffuseWrinkle365 = localMinMaxDeltaBlend4181_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch370 = diffuseWrinkle365;
				#else
				half4 staticSwitch370 = diffuseMap368;
				#endif
				half4 temp_output_339_0 = ( _DiffuseColor * staticSwitch370 );
				float2 uv_ColorBlendMap = IN.ase_texcoord4.xy * _ColorBlendMap_ST.xy + _ColorBlendMap_ST.zw;
				half4 blendOpSrc13 = SAMPLE_TEXTURE2D( _ColorBlendMap, sampler_DiffuseMap, uv_ColorBlendMap );
				half4 blendOpDest13 = temp_output_339_0;
				half4 lerpBlendMode13 = lerp(blendOpDest13,(( blendOpDest13 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest13 ) * ( 1.0 - blendOpSrc13 ) ) : ( 2.0 * blendOpDest13 * blendOpSrc13 ) ),_ColorBlendStrength);
				float2 uv_MNAOMap = IN.ase_texcoord4.xy * _MNAOMap_ST.xy + _MNAOMap_ST.zw;
				half4 tex2DNode196 = SAMPLE_TEXTURE2D( _MNAOMap, sampler_Linear_Repeat, uv_MNAOMap );
				half saferPower201 = abs( tex2DNode196.g );
				half saferPower202 = abs( tex2DNode196.b );
				half saferPower203 = abs( tex2DNode196.a );
				half cavityAO280 = ( pow( saferPower201 , _MouthCavityAO ) * pow( saferPower202 , _NostrilCavityAO ) * pow( saferPower203 , _LipsCavityAO ) );
				#ifdef BOOLEAN_IS_HEAD_ON
				half4 staticSwitch72 = ( ( saturate( lerpBlendMode13 )) * cavityAO280 );
				#else
				half4 staticSwitch72 = temp_output_339_0;
				#endif
				half4 baseColor266 = staticSwitch72;
				
				float2 uv_EmissionMap = IN.ase_texcoord4.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				

				float3 BaseColor = baseColor266.rgb;
				float3 Emission = ( _EmissiveColor * SAMPLE_TEXTURE2D( _EmissionMap, sampler_DiffuseMap, uv_EmissionMap ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON
			#pragma multi_compile_local __ BOOLEAN_USE_WRINKLE_ON


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_DiffuseMap);
			SAMPLER(sampler_DiffuseMap);
			TEXTURE2D(_WrinkleDiffuseBlend1);
			SAMPLER(sampler_WrinkleDiffuseBlend1);
			TEXTURE2D(_WrinkleFlowMap1);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleDiffuseBlend2);
			TEXTURE2D(_WrinkleFlowMap2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleDiffuseBlend3);
			TEXTURE2D(_WrinkleFlowMap3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_ColorBlendMap);
			TEXTURE2D(_MNAOMap);


			half4 MinMaxDeltaBlend4181_g112( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_DiffuseMap = IN.ase_texcoord2.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 diffuseMap368 = SAMPLE_TEXTURE2D( _DiffuseMap, sampler_DiffuseMap, uv_DiffuseMap );
				half4 diffuse184_g112 = diffuseMap368;
				half4 In181_g112 = diffuse184_g112;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowMap1 = IN.ase_texcoord2.xy * _WrinkleFlowMap1_ST.xy + _WrinkleFlowMap1_ST.zw;
				half2 texCoord10_g112 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g114 = 0.49;
				half leftMask27_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g114 ) / ( 0.51 - temp_output_1_0_g114 ) ) );
				half4 break107_g112 = _WrinkleValueSet12CL;
				half2 appendResult112_g112 = (half2(break107_g112.x , break107_g112.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord2.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g112 = (half2(break109_g112.x , break109_g112.y));
				half dotResult121_g112 = dot( appendResult112_g112 , appendResult115_g112 );
				half value1CLeft135_g112 = dotResult121_g112;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord2.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g112 = dot( _WrinkleValueSet1AL , maskSet1A214_g112 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord2.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g112 = dot( _WrinkleValueSet1BL , temp_output_16_0_g112 );
				half dotResult30_g112 = dot( maskSet1A214_g112 , _WrinkleValueSet1AR );
				half dotResult36_g112 = dot( temp_output_16_0_g112 , _WrinkleValueSet1BR );
				half4 break108_g112 = _WrinkleValueSet12CR;
				half2 appendResult117_g112 = (half2(break108_g112.x , break108_g112.y));
				half dotResult122_g112 = dot( appendResult115_g112 , appendResult117_g112 );
				half value1CRight136_g112 = dotResult122_g112;
				half temp_output_1_0_g113 = 0.51;
				half rightMask28_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g113 ) / ( 0.49 - temp_output_1_0_g113 ) ) );
				half temp_output_16_0_g116 = ( ( leftMask27_g112 * ( value1CLeft135_g112 + dotResult29_g112 + dotResult35_g112 ) ) + ( ( dotResult30_g112 + dotResult36_g112 + value1CRight136_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g116 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap1, sampler_Linear_Repeat, uv_WrinkleFlowMap1 ).g + temp_output_16_0_g116 ) ) * temp_output_16_0_g116 );
				half4 In1181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				float2 uv_WrinkleFlowMap2 = IN.ase_texcoord2.xy * _WrinkleFlowMap2_ST.xy + _WrinkleFlowMap2_ST.zw;
				half2 appendResult113_g112 = (half2(break107_g112.z , break107_g112.w));
				half2 appendResult114_g112 = (half2(break109_g112.z , break109_g112.w));
				half dotResult123_g112 = dot( appendResult113_g112 , appendResult114_g112 );
				half value2CLeft137_g112 = dotResult123_g112;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord2.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g112 = dot( _WrinkleValueSet2L , temp_output_17_0_g112 );
				half dotResult42_g112 = dot( temp_output_17_0_g112 , _WrinkleValueSet2R );
				half2 appendResult116_g112 = (half2(break108_g112.z , break108_g112.w));
				half dotResult124_g112 = dot( appendResult114_g112 , appendResult116_g112 );
				half value2CRight138_g112 = dotResult124_g112;
				half temp_output_16_0_g117 = ( ( leftMask27_g112 * ( value2CLeft137_g112 + dotResult41_g112 ) ) + ( ( dotResult42_g112 + value2CRight138_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g117 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap2, sampler_Linear_Repeat, uv_WrinkleFlowMap2 ).g + temp_output_16_0_g117 ) ) * temp_output_16_0_g117 );
				half4 In2181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				float2 uv_WrinkleFlowMap3 = IN.ase_texcoord2.xy * _WrinkleFlowMap3_ST.xy + _WrinkleFlowMap3_ST.zw;
				half4 break211_g112 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g112 = ( break211_g112.x * maskSet1A214_g112.y );
				half4 break118_g112 = _WrinkleValueSet3DB;
				half2 appendResult120_g112 = (half2(break118_g112.x , break118_g112.y));
				half dotResult127_g112 = dot( appendResult120_g112 , appendResult115_g112 );
				half value3DLeft129_g112 = dotResult127_g112;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord2.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g112 = dot( _WrinkleValueSet3L , temp_output_18_0_g112 );
				half dotResult48_g112 = dot( temp_output_18_0_g112 , _WrinkleValueSet3R );
				half2 appendResult119_g112 = (half2(break118_g112.z , break118_g112.w));
				half dotResult128_g112 = dot( appendResult115_g112 , appendResult119_g112 );
				half value3DRight130_g112 = dotResult128_g112;
				half valueBCCRight219_g112 = ( maskSet1A214_g112.y * break211_g112.y );
				half temp_output_16_0_g115 = ( ( leftMask27_g112 * ( valueBCCLeft217_g112 + value3DLeft129_g112 + dotResult47_g112 ) ) + ( ( dotResult48_g112 + value3DRight130_g112 + valueBCCRight219_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g115 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap3, sampler_Linear_Repeat, uv_WrinkleFlowMap3 ).g + temp_output_16_0_g115 ) ) * temp_output_16_0_g115 );
				half4 In3181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g112 ) * temp_output_23_0_g115 );
				half4 localMinMaxDeltaBlend4181_g112 = MinMaxDeltaBlend4181_g112( In181_g112 , In1181_g112 , In2181_g112 , In3181_g112 );
				half4 diffuseWrinkle365 = localMinMaxDeltaBlend4181_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch370 = diffuseWrinkle365;
				#else
				half4 staticSwitch370 = diffuseMap368;
				#endif
				half4 temp_output_339_0 = ( _DiffuseColor * staticSwitch370 );
				float2 uv_ColorBlendMap = IN.ase_texcoord2.xy * _ColorBlendMap_ST.xy + _ColorBlendMap_ST.zw;
				half4 blendOpSrc13 = SAMPLE_TEXTURE2D( _ColorBlendMap, sampler_DiffuseMap, uv_ColorBlendMap );
				half4 blendOpDest13 = temp_output_339_0;
				half4 lerpBlendMode13 = lerp(blendOpDest13,(( blendOpDest13 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest13 ) * ( 1.0 - blendOpSrc13 ) ) : ( 2.0 * blendOpDest13 * blendOpSrc13 ) ),_ColorBlendStrength);
				float2 uv_MNAOMap = IN.ase_texcoord2.xy * _MNAOMap_ST.xy + _MNAOMap_ST.zw;
				half4 tex2DNode196 = SAMPLE_TEXTURE2D( _MNAOMap, sampler_Linear_Repeat, uv_MNAOMap );
				half saferPower201 = abs( tex2DNode196.g );
				half saferPower202 = abs( tex2DNode196.b );
				half saferPower203 = abs( tex2DNode196.a );
				half cavityAO280 = ( pow( saferPower201 , _MouthCavityAO ) * pow( saferPower202 , _NostrilCavityAO ) * pow( saferPower203 , _LipsCavityAO ) );
				#ifdef BOOLEAN_IS_HEAD_ON
				half4 staticSwitch72 = ( ( saturate( lerpBlendMode13 )) * cavityAO280 );
				#else
				half4 staticSwitch72 = temp_output_339_0;
				#endif
				half4 baseColor266 = staticSwitch72;
				

				float3 BaseColor = baseColor266.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
			//#define SHADERPASS SHADERPASS_DEPTHNORMALS

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON
			#pragma multi_compile_local __ BOOLEAN_USE_WRINKLE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_WrinkleNormalBlend1);
			SAMPLER(sampler_WrinkleNormalBlend1);
			TEXTURE2D(_WrinkleFlowMap1);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleNormalBlend2);
			TEXTURE2D(_WrinkleFlowMap2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleNormalBlend3);
			TEXTURE2D(_WrinkleFlowMap3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_NormalBlendMap);
			TEXTURE2D(_SSSMap);
			TEXTURE2D(_RGBAMask);
			TEXTURE2D(_CFULCMask);
			TEXTURE2D(_EarNeckMask);
			TEXTURE2D(_MicroNormalMap);
			TEXTURE2D(_MaskMap);


			half3 MinMaxDeltaBlend3183_g112( half3 In, half3 In1, half3 In2, half3 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			void SkinMask179( half4 In1, half4 Mod1, half4 Scatter1, half UMMS, half UMSS, out half SmoothnessMod, out half ScatterMask )
			{
				float mask = saturate(In1.r + In1.g + In1.b + In1.a);
				float unmask = 1.0 - mask;
				SmoothnessMod = dot(In1, Mod1) + (UMMS * unmask);
				ScatterMask = dot(In1, Scatter1) + (UMSS * unmask);
				return;
			}
			
			void HeadMask156( half4 In1, half4 In2, half4 In3, half4 Mod1, half4 Mod2, half4 Mod3, half4 Scatter1, half4 Scatter2, half4 Scatter3, half UMMS, half UMSS, out half SmoothnessMod, out half ScatterMask )
			{
				In3.zw = 0;
				float4 m = In1 + In2 + In3;
				float mask = saturate(m.x + m.y + m.z + m.w);
				float unmask = 1.0 - mask;
				SmoothnessMod = dot(In1, Mod1) + dot(In2, Mod2) + dot(In3, Mod3) + (UMMS * unmask);
				ScatterMask = dot(In1, Scatter1) + dot(In2, Scatter2) + dot(In3, Scatter3) + (UMSS * unmask);
				return;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( v.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( v.tangentOS.xyz ), v.tangentOS.w );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_NormalMap = IN.ase_texcoord5.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				half normalMapScale387 = _NormalStrength;
				half3 unpack48 = UnpackNormalScale( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, uv_NormalMap ), normalMapScale387 );
				unpack48.z = lerp( 1, unpack48.z, saturate(normalMapScale387) );
				half3 normalMap373 = unpack48;
				half3 normal186_g112 = normalMap373;
				half3 In183_g112 = normal186_g112;
				float2 uv_WrinkleNormalBlend1 = IN.ase_texcoord5.xy * _WrinkleNormalBlend1_ST.xy + _WrinkleNormalBlend1_ST.zw;
				half3 unpack358 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend1, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend1 ), normalMapScale387 );
				unpack358.z = lerp( 1, unpack358.z, saturate(normalMapScale387) );
				float2 uv_WrinkleFlowMap1 = IN.ase_texcoord5.xy * _WrinkleFlowMap1_ST.xy + _WrinkleFlowMap1_ST.zw;
				half2 texCoord10_g112 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g114 = 0.49;
				half leftMask27_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g114 ) / ( 0.51 - temp_output_1_0_g114 ) ) );
				half4 break107_g112 = _WrinkleValueSet12CL;
				half2 appendResult112_g112 = (half2(break107_g112.x , break107_g112.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord5.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g112 = (half2(break109_g112.x , break109_g112.y));
				half dotResult121_g112 = dot( appendResult112_g112 , appendResult115_g112 );
				half value1CLeft135_g112 = dotResult121_g112;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord5.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g112 = dot( _WrinkleValueSet1AL , maskSet1A214_g112 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord5.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g112 = dot( _WrinkleValueSet1BL , temp_output_16_0_g112 );
				half dotResult30_g112 = dot( maskSet1A214_g112 , _WrinkleValueSet1AR );
				half dotResult36_g112 = dot( temp_output_16_0_g112 , _WrinkleValueSet1BR );
				half4 break108_g112 = _WrinkleValueSet12CR;
				half2 appendResult117_g112 = (half2(break108_g112.x , break108_g112.y));
				half dotResult122_g112 = dot( appendResult115_g112 , appendResult117_g112 );
				half value1CRight136_g112 = dotResult122_g112;
				half temp_output_1_0_g113 = 0.51;
				half rightMask28_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g113 ) / ( 0.49 - temp_output_1_0_g113 ) ) );
				half temp_output_16_0_g116 = ( ( leftMask27_g112 * ( value1CLeft135_g112 + dotResult29_g112 + dotResult35_g112 ) ) + ( ( dotResult30_g112 + dotResult36_g112 + value1CRight136_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g116 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap1, sampler_Linear_Repeat, uv_WrinkleFlowMap1 ).g + temp_output_16_0_g116 ) ) * temp_output_16_0_g116 );
				half3 In1183_g112 = ( ( unpack358 - normal186_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleNormalBlend2 = IN.ase_texcoord5.xy * _WrinkleNormalBlend2_ST.xy + _WrinkleNormalBlend2_ST.zw;
				half3 unpack359 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend2, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend2 ), normalMapScale387 );
				unpack359.z = lerp( 1, unpack359.z, saturate(normalMapScale387) );
				float2 uv_WrinkleFlowMap2 = IN.ase_texcoord5.xy * _WrinkleFlowMap2_ST.xy + _WrinkleFlowMap2_ST.zw;
				half2 appendResult113_g112 = (half2(break107_g112.z , break107_g112.w));
				half2 appendResult114_g112 = (half2(break109_g112.z , break109_g112.w));
				half dotResult123_g112 = dot( appendResult113_g112 , appendResult114_g112 );
				half value2CLeft137_g112 = dotResult123_g112;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord5.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g112 = dot( _WrinkleValueSet2L , temp_output_17_0_g112 );
				half dotResult42_g112 = dot( temp_output_17_0_g112 , _WrinkleValueSet2R );
				half2 appendResult116_g112 = (half2(break108_g112.z , break108_g112.w));
				half dotResult124_g112 = dot( appendResult114_g112 , appendResult116_g112 );
				half value2CRight138_g112 = dotResult124_g112;
				half temp_output_16_0_g117 = ( ( leftMask27_g112 * ( value2CLeft137_g112 + dotResult41_g112 ) ) + ( ( dotResult42_g112 + value2CRight138_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g117 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap2, sampler_Linear_Repeat, uv_WrinkleFlowMap2 ).g + temp_output_16_0_g117 ) ) * temp_output_16_0_g117 );
				half3 In2183_g112 = ( ( unpack359 - normal186_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleNormalBlend3 = IN.ase_texcoord5.xy * _WrinkleNormalBlend3_ST.xy + _WrinkleNormalBlend3_ST.zw;
				half3 unpack360 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend3, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend3 ), normalMapScale387 );
				unpack360.z = lerp( 1, unpack360.z, saturate(normalMapScale387) );
				float2 uv_WrinkleFlowMap3 = IN.ase_texcoord5.xy * _WrinkleFlowMap3_ST.xy + _WrinkleFlowMap3_ST.zw;
				half4 break211_g112 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g112 = ( break211_g112.x * maskSet1A214_g112.y );
				half4 break118_g112 = _WrinkleValueSet3DB;
				half2 appendResult120_g112 = (half2(break118_g112.x , break118_g112.y));
				half dotResult127_g112 = dot( appendResult120_g112 , appendResult115_g112 );
				half value3DLeft129_g112 = dotResult127_g112;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord5.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g112 = dot( _WrinkleValueSet3L , temp_output_18_0_g112 );
				half dotResult48_g112 = dot( temp_output_18_0_g112 , _WrinkleValueSet3R );
				half2 appendResult119_g112 = (half2(break118_g112.z , break118_g112.w));
				half dotResult128_g112 = dot( appendResult115_g112 , appendResult119_g112 );
				half value3DRight130_g112 = dotResult128_g112;
				half valueBCCRight219_g112 = ( maskSet1A214_g112.y * break211_g112.y );
				half temp_output_16_0_g115 = ( ( leftMask27_g112 * ( valueBCCLeft217_g112 + value3DLeft129_g112 + dotResult47_g112 ) ) + ( ( dotResult48_g112 + value3DRight130_g112 + valueBCCRight219_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g115 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap3, sampler_Linear_Repeat, uv_WrinkleFlowMap3 ).g + temp_output_16_0_g115 ) ) * temp_output_16_0_g115 );
				half3 In3183_g112 = ( ( unpack360 - normal186_g112 ) * temp_output_23_0_g115 );
				half3 localMinMaxDeltaBlend3183_g112 = MinMaxDeltaBlend3183_g112( In183_g112 , In1183_g112 , In2183_g112 , In3183_g112 );
				half3 normalWrinkle367 = localMinMaxDeltaBlend3183_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half3 staticSwitch372 = normalWrinkle367;
				#else
				half3 staticSwitch372 = normalMap373;
				#endif
				float2 uv_NormalBlendMap = IN.ase_texcoord5.xy * _NormalBlendMap_ST.xy + _NormalBlendMap_ST.zw;
				float2 uv_SSSMap = IN.ase_texcoord5.xy * _SSSMap_ST.xy + _SSSMap_ST.zw;
				half localSkinMask179 = ( 0.0 );
				float2 uv_RGBAMask = IN.ase_texcoord5.xy * _RGBAMask_ST.xy + _RGBAMask_ST.zw;
				half4 tex2DNode123 = SAMPLE_TEXTURE2D( _RGBAMask, sampler_Linear_Repeat, uv_RGBAMask );
				half4 In1179 = tex2DNode123;
				half4 appendResult150 = (half4(_RSmoothnessMod , _GSmoothnessMod , _BSmoothnessMod , _ASmoothnessMod));
				half4 Mod1179 = appendResult150;
				half4 appendResult153 = (half4(_RScatterScale , _GScatterScale , _BScatterScale , _AScatterScale));
				half4 Scatter1179 = appendResult153;
				half UMMS179 = _UnmaskedSmoothnessMod;
				half UMSS179 = _UnmaskedScatterScale;
				half SmoothnessMod179 = 0.0;
				half ScatterMask179 = 0.0;
				SkinMask179( In1179 , Mod1179 , Scatter1179 , UMMS179 , UMSS179 , SmoothnessMod179 , ScatterMask179 );
				half localHeadMask156 = ( 0.0 );
				half4 In1156 = tex2DNode123;
				float2 uv_CFULCMask = IN.ase_texcoord5.xy * _CFULCMask_ST.xy + _CFULCMask_ST.zw;
				half4 In2156 = SAMPLE_TEXTURE2D( _CFULCMask, sampler_Linear_Repeat, uv_CFULCMask );
				float2 uv_EarNeckMask = IN.ase_texcoord5.xy * _EarNeckMask_ST.xy + _EarNeckMask_ST.zw;
				half4 In3156 = SAMPLE_TEXTURE2D( _EarNeckMask, sampler_Linear_Repeat, uv_EarNeckMask );
				half4 Mod1156 = appendResult150;
				half4 appendResult151 = (half4(_CheekSmoothnessMod , _ForeheadSmoothnessMod , _UpperLipSmoothnessMod , _ChinSmoothnessMod));
				half4 Mod2156 = appendResult151;
				half4 appendResult152 = (half4(_NeckSmoothnessMod , _EarSmoothnessMod , 0.0 , 0.0));
				half4 Mod3156 = appendResult152;
				half4 Scatter1156 = appendResult153;
				half4 appendResult154 = (half4(_CheekScatterScale , _ForeheadScatterScale , _UpperLipScatterScale , _ChinScatterScale));
				half4 Scatter2156 = appendResult154;
				half4 appendResult155 = (half4(_NeckScatterScale , _EarScatterScale , 0.0 , 0.0));
				half4 Scatter3156 = appendResult155;
				half UMMS156 = _UnmaskedSmoothnessMod;
				half UMSS156 = _UnmaskedScatterScale;
				half SmoothnessMod156 = 0.0;
				half ScatterMask156 = 0.0;
				HeadMask156( In1156 , In2156 , In3156 , Mod1156 , Mod2156 , Mod3156 , Scatter1156 , Scatter2156 , Scatter3156 , UMMS156 , UMSS156 , SmoothnessMod156 , ScatterMask156 );
				#ifdef BOOLEAN_IS_HEAD_ON
				half staticSwitch169 = ScatterMask156;
				#else
				half staticSwitch169 = ScatterMask179;
				#endif
				half microScatteringMultiplier277 = ( _SubsurfaceScale * staticSwitch169 );
				half temp_output_336_0 = saturate( ( SAMPLE_TEXTURE2D( _SSSMap, sampler_Linear_Repeat, uv_SSSMap ).g * microScatteringMultiplier277 ) );
				half subsurfaceFlattenNormals274 = saturate( ( 1.0 - ( temp_output_336_0 * temp_output_336_0 * _SubsurfaceNormalSoften ) ) );
				half3 unpack50 = UnpackNormalScale( SAMPLE_TEXTURE2D( _NormalBlendMap, sampler_NormalMap, uv_NormalBlendMap ), ( subsurfaceFlattenNormals274 * _NormalBlendStrength ) );
				unpack50.z = lerp( 1, unpack50.z, saturate(( subsurfaceFlattenNormals274 * _NormalBlendStrength )) );
				#ifdef BOOLEAN_IS_HEAD_ON
				half3 staticSwitch71 = BlendNormal( staticSwitch372 , unpack50 );
				#else
				half3 staticSwitch71 = staticSwitch372;
				#endif
				half2 temp_cast_9 = (_MicroNormalTiling).xx;
				half2 texCoord308 = IN.ase_texcoord5.xy * temp_cast_9 + float2( 0,0 );
				float2 uv_MaskMap = IN.ase_texcoord5.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				half4 tex2DNode32 = SAMPLE_TEXTURE2D( _MaskMap, sampler_Linear_Repeat, uv_MaskMap );
				half microNormalMask287 = tex2DNode32.b;
				half3 unpack52 = UnpackNormalScale( SAMPLE_TEXTURE2D( _MicroNormalMap, sampler_NormalMap, texCoord308 ), ( _MicroNormalStrength * microNormalMask287 * subsurfaceFlattenNormals274 ) );
				unpack52.z = lerp( 1, unpack52.z, saturate(( _MicroNormalStrength * microNormalMask287 * subsurfaceFlattenNormals274 )) );
				

				float3 Normal = BlendNormal( staticSwitch71 , unpack52 );
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ USE_LEGACY_LIGHTMAPS
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_GBUFFER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif
			
			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON
			#pragma multi_compile_local __ BOOLEAN_USE_WRINKLE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				#if defined(USE_APV_PROBE_OCCLUSION)
					float4 probeOcclusion : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_DiffuseMap);
			SAMPLER(sampler_DiffuseMap);
			TEXTURE2D(_WrinkleDiffuseBlend1);
			SAMPLER(sampler_WrinkleDiffuseBlend1);
			TEXTURE2D(_WrinkleFlowMap1);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleDiffuseBlend2);
			TEXTURE2D(_WrinkleFlowMap2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleDiffuseBlend3);
			TEXTURE2D(_WrinkleFlowMap3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_ColorBlendMap);
			TEXTURE2D(_MNAOMap);
			TEXTURE2D(_NormalMap);
			SAMPLER(sampler_NormalMap);
			TEXTURE2D(_WrinkleNormalBlend1);
			SAMPLER(sampler_WrinkleNormalBlend1);
			TEXTURE2D(_WrinkleNormalBlend2);
			TEXTURE2D(_WrinkleNormalBlend3);
			TEXTURE2D(_NormalBlendMap);
			TEXTURE2D(_SSSMap);
			TEXTURE2D(_RGBAMask);
			TEXTURE2D(_CFULCMask);
			TEXTURE2D(_EarNeckMask);
			TEXTURE2D(_MicroNormalMap);
			TEXTURE2D(_MaskMap);
			TEXTURE2D(_EmissionMap);
			TEXTURE2D(_WrinkleRoughnessBlend1);
			TEXTURE2D(_WrinkleRoughnessBlend2);
			TEXTURE2D(_WrinkleRoughnessBlend3);
			TEXTURE2D(_ThicknessMap);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			half4 MinMaxDeltaBlend4181_g112( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half3 MinMaxDeltaBlend3183_g112( half3 In, half3 In1, half3 In2, half3 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			void SkinMask179( half4 In1, half4 Mod1, half4 Scatter1, half UMMS, half UMSS, out half SmoothnessMod, out half ScatterMask )
			{
				float mask = saturate(In1.r + In1.g + In1.b + In1.a);
				float unmask = 1.0 - mask;
				SmoothnessMod = dot(In1, Mod1) + (UMMS * unmask);
				ScatterMask = dot(In1, Scatter1) + (UMSS * unmask);
				return;
			}
			
			void HeadMask156( half4 In1, half4 In2, half4 In3, half4 Mod1, half4 Mod2, half4 Mod3, half4 Scatter1, half4 Scatter2, half4 Scatter3, half UMMS, half UMSS, out half SmoothnessMod, out half ScatterMask )
			{
				In3.zw = 0;
				float4 m = In1 + In2 + In3;
				float mask = saturate(m.x + m.y + m.z + m.w);
				float unmask = 1.0 - mask;
				SmoothnessMod = dot(In1, Mod1) + dot(In2, Mod2) + dot(In3, Mod3) + (UMMS * unmask);
				ScatterMask = dot(In1, Scatter1) + dot(In2, Scatter2) + dot(In3, Scatter3) + (UMSS * unmask);
				return;
			}
			
			half MinMaxDeltaBlend1182_g112( half In, half In1, half In2, half In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord9.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				OUTPUT_SH4( vertexInput.positionWS, normalInput.normalWS.xyz, GetWorldSpaceNormalizeViewDir( vertexInput.positionWS ), o.lightmapUVOrVertexSH.xyz, o.probeOcclusion );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_DiffuseMap = IN.ase_texcoord9.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 diffuseMap368 = SAMPLE_TEXTURE2D( _DiffuseMap, sampler_DiffuseMap, uv_DiffuseMap );
				half4 diffuse184_g112 = diffuseMap368;
				half4 In181_g112 = diffuse184_g112;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowMap1 = IN.ase_texcoord9.xy * _WrinkleFlowMap1_ST.xy + _WrinkleFlowMap1_ST.zw;
				half2 texCoord10_g112 = IN.ase_texcoord9.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g114 = 0.49;
				half leftMask27_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g114 ) / ( 0.51 - temp_output_1_0_g114 ) ) );
				half4 break107_g112 = _WrinkleValueSet12CL;
				half2 appendResult112_g112 = (half2(break107_g112.x , break107_g112.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord9.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g112 = (half2(break109_g112.x , break109_g112.y));
				half dotResult121_g112 = dot( appendResult112_g112 , appendResult115_g112 );
				half value1CLeft135_g112 = dotResult121_g112;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord9.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g112 = dot( _WrinkleValueSet1AL , maskSet1A214_g112 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord9.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g112 = dot( _WrinkleValueSet1BL , temp_output_16_0_g112 );
				half dotResult30_g112 = dot( maskSet1A214_g112 , _WrinkleValueSet1AR );
				half dotResult36_g112 = dot( temp_output_16_0_g112 , _WrinkleValueSet1BR );
				half4 break108_g112 = _WrinkleValueSet12CR;
				half2 appendResult117_g112 = (half2(break108_g112.x , break108_g112.y));
				half dotResult122_g112 = dot( appendResult115_g112 , appendResult117_g112 );
				half value1CRight136_g112 = dotResult122_g112;
				half temp_output_1_0_g113 = 0.51;
				half rightMask28_g112 = saturate( ( ( texCoord10_g112.x - temp_output_1_0_g113 ) / ( 0.49 - temp_output_1_0_g113 ) ) );
				half temp_output_16_0_g116 = ( ( leftMask27_g112 * ( value1CLeft135_g112 + dotResult29_g112 + dotResult35_g112 ) ) + ( ( dotResult30_g112 + dotResult36_g112 + value1CRight136_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g116 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap1, sampler_Linear_Repeat, uv_WrinkleFlowMap1 ).g + temp_output_16_0_g116 ) ) * temp_output_16_0_g116 );
				half4 In1181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				float2 uv_WrinkleFlowMap2 = IN.ase_texcoord9.xy * _WrinkleFlowMap2_ST.xy + _WrinkleFlowMap2_ST.zw;
				half2 appendResult113_g112 = (half2(break107_g112.z , break107_g112.w));
				half2 appendResult114_g112 = (half2(break109_g112.z , break109_g112.w));
				half dotResult123_g112 = dot( appendResult113_g112 , appendResult114_g112 );
				half value2CLeft137_g112 = dotResult123_g112;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord9.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g112 = dot( _WrinkleValueSet2L , temp_output_17_0_g112 );
				half dotResult42_g112 = dot( temp_output_17_0_g112 , _WrinkleValueSet2R );
				half2 appendResult116_g112 = (half2(break108_g112.z , break108_g112.w));
				half dotResult124_g112 = dot( appendResult114_g112 , appendResult116_g112 );
				half value2CRight138_g112 = dotResult124_g112;
				half temp_output_16_0_g117 = ( ( leftMask27_g112 * ( value2CLeft137_g112 + dotResult41_g112 ) ) + ( ( dotResult42_g112 + value2CRight138_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g117 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap2, sampler_Linear_Repeat, uv_WrinkleFlowMap2 ).g + temp_output_16_0_g117 ) ) * temp_output_16_0_g117 );
				half4 In2181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				float2 uv_WrinkleFlowMap3 = IN.ase_texcoord9.xy * _WrinkleFlowMap3_ST.xy + _WrinkleFlowMap3_ST.zw;
				half4 break211_g112 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g112 = ( break211_g112.x * maskSet1A214_g112.y );
				half4 break118_g112 = _WrinkleValueSet3DB;
				half2 appendResult120_g112 = (half2(break118_g112.x , break118_g112.y));
				half dotResult127_g112 = dot( appendResult120_g112 , appendResult115_g112 );
				half value3DLeft129_g112 = dotResult127_g112;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord9.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g112 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g112 = dot( _WrinkleValueSet3L , temp_output_18_0_g112 );
				half dotResult48_g112 = dot( temp_output_18_0_g112 , _WrinkleValueSet3R );
				half2 appendResult119_g112 = (half2(break118_g112.z , break118_g112.w));
				half dotResult128_g112 = dot( appendResult115_g112 , appendResult119_g112 );
				half value3DRight130_g112 = dotResult128_g112;
				half valueBCCRight219_g112 = ( maskSet1A214_g112.y * break211_g112.y );
				half temp_output_16_0_g115 = ( ( leftMask27_g112 * ( valueBCCLeft217_g112 + value3DLeft129_g112 + dotResult47_g112 ) ) + ( ( dotResult48_g112 + value3DRight130_g112 + valueBCCRight219_g112 ) * rightMask28_g112 ) );
				half temp_output_23_0_g115 = ( saturate( ( SAMPLE_TEXTURE2D( _WrinkleFlowMap3, sampler_Linear_Repeat, uv_WrinkleFlowMap3 ).g + temp_output_16_0_g115 ) ) * temp_output_16_0_g115 );
				half4 In3181_g112 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g112 ) * temp_output_23_0_g115 );
				half4 localMinMaxDeltaBlend4181_g112 = MinMaxDeltaBlend4181_g112( In181_g112 , In1181_g112 , In2181_g112 , In3181_g112 );
				half4 diffuseWrinkle365 = localMinMaxDeltaBlend4181_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch370 = diffuseWrinkle365;
				#else
				half4 staticSwitch370 = diffuseMap368;
				#endif
				half4 temp_output_339_0 = ( _DiffuseColor * staticSwitch370 );
				float2 uv_ColorBlendMap = IN.ase_texcoord9.xy * _ColorBlendMap_ST.xy + _ColorBlendMap_ST.zw;
				half4 blendOpSrc13 = SAMPLE_TEXTURE2D( _ColorBlendMap, sampler_DiffuseMap, uv_ColorBlendMap );
				half4 blendOpDest13 = temp_output_339_0;
				half4 lerpBlendMode13 = lerp(blendOpDest13,(( blendOpDest13 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest13 ) * ( 1.0 - blendOpSrc13 ) ) : ( 2.0 * blendOpDest13 * blendOpSrc13 ) ),_ColorBlendStrength);
				float2 uv_MNAOMap = IN.ase_texcoord9.xy * _MNAOMap_ST.xy + _MNAOMap_ST.zw;
				half4 tex2DNode196 = SAMPLE_TEXTURE2D( _MNAOMap, sampler_Linear_Repeat, uv_MNAOMap );
				half saferPower201 = abs( tex2DNode196.g );
				half saferPower202 = abs( tex2DNode196.b );
				half saferPower203 = abs( tex2DNode196.a );
				half cavityAO280 = ( pow( saferPower201 , _MouthCavityAO ) * pow( saferPower202 , _NostrilCavityAO ) * pow( saferPower203 , _LipsCavityAO ) );
				#ifdef BOOLEAN_IS_HEAD_ON
				half4 staticSwitch72 = ( ( saturate( lerpBlendMode13 )) * cavityAO280 );
				#else
				half4 staticSwitch72 = temp_output_339_0;
				#endif
				half4 baseColor266 = staticSwitch72;
				
				float2 uv_NormalMap = IN.ase_texcoord9.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				half normalMapScale387 = _NormalStrength;
				half3 unpack48 = UnpackNormalScale( SAMPLE_TEXTURE2D( _NormalMap, sampler_NormalMap, uv_NormalMap ), normalMapScale387 );
				unpack48.z = lerp( 1, unpack48.z, saturate(normalMapScale387) );
				half3 normalMap373 = unpack48;
				half3 normal186_g112 = normalMap373;
				half3 In183_g112 = normal186_g112;
				float2 uv_WrinkleNormalBlend1 = IN.ase_texcoord9.xy * _WrinkleNormalBlend1_ST.xy + _WrinkleNormalBlend1_ST.zw;
				half3 unpack358 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend1, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend1 ), normalMapScale387 );
				unpack358.z = lerp( 1, unpack358.z, saturate(normalMapScale387) );
				half3 In1183_g112 = ( ( unpack358 - normal186_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleNormalBlend2 = IN.ase_texcoord9.xy * _WrinkleNormalBlend2_ST.xy + _WrinkleNormalBlend2_ST.zw;
				half3 unpack359 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend2, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend2 ), normalMapScale387 );
				unpack359.z = lerp( 1, unpack359.z, saturate(normalMapScale387) );
				half3 In2183_g112 = ( ( unpack359 - normal186_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleNormalBlend3 = IN.ase_texcoord9.xy * _WrinkleNormalBlend3_ST.xy + _WrinkleNormalBlend3_ST.zw;
				half3 unpack360 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend3, sampler_WrinkleNormalBlend1, uv_WrinkleNormalBlend3 ), normalMapScale387 );
				unpack360.z = lerp( 1, unpack360.z, saturate(normalMapScale387) );
				half3 In3183_g112 = ( ( unpack360 - normal186_g112 ) * temp_output_23_0_g115 );
				half3 localMinMaxDeltaBlend3183_g112 = MinMaxDeltaBlend3183_g112( In183_g112 , In1183_g112 , In2183_g112 , In3183_g112 );
				half3 normalWrinkle367 = localMinMaxDeltaBlend3183_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half3 staticSwitch372 = normalWrinkle367;
				#else
				half3 staticSwitch372 = normalMap373;
				#endif
				float2 uv_NormalBlendMap = IN.ase_texcoord9.xy * _NormalBlendMap_ST.xy + _NormalBlendMap_ST.zw;
				float2 uv_SSSMap = IN.ase_texcoord9.xy * _SSSMap_ST.xy + _SSSMap_ST.zw;
				half localSkinMask179 = ( 0.0 );
				float2 uv_RGBAMask = IN.ase_texcoord9.xy * _RGBAMask_ST.xy + _RGBAMask_ST.zw;
				half4 tex2DNode123 = SAMPLE_TEXTURE2D( _RGBAMask, sampler_Linear_Repeat, uv_RGBAMask );
				half4 In1179 = tex2DNode123;
				half4 appendResult150 = (half4(_RSmoothnessMod , _GSmoothnessMod , _BSmoothnessMod , _ASmoothnessMod));
				half4 Mod1179 = appendResult150;
				half4 appendResult153 = (half4(_RScatterScale , _GScatterScale , _BScatterScale , _AScatterScale));
				half4 Scatter1179 = appendResult153;
				half UMMS179 = _UnmaskedSmoothnessMod;
				half UMSS179 = _UnmaskedScatterScale;
				half SmoothnessMod179 = 0.0;
				half ScatterMask179 = 0.0;
				SkinMask179( In1179 , Mod1179 , Scatter1179 , UMMS179 , UMSS179 , SmoothnessMod179 , ScatterMask179 );
				half localHeadMask156 = ( 0.0 );
				half4 In1156 = tex2DNode123;
				float2 uv_CFULCMask = IN.ase_texcoord9.xy * _CFULCMask_ST.xy + _CFULCMask_ST.zw;
				half4 In2156 = SAMPLE_TEXTURE2D( _CFULCMask, sampler_Linear_Repeat, uv_CFULCMask );
				float2 uv_EarNeckMask = IN.ase_texcoord9.xy * _EarNeckMask_ST.xy + _EarNeckMask_ST.zw;
				half4 In3156 = SAMPLE_TEXTURE2D( _EarNeckMask, sampler_Linear_Repeat, uv_EarNeckMask );
				half4 Mod1156 = appendResult150;
				half4 appendResult151 = (half4(_CheekSmoothnessMod , _ForeheadSmoothnessMod , _UpperLipSmoothnessMod , _ChinSmoothnessMod));
				half4 Mod2156 = appendResult151;
				half4 appendResult152 = (half4(_NeckSmoothnessMod , _EarSmoothnessMod , 0.0 , 0.0));
				half4 Mod3156 = appendResult152;
				half4 Scatter1156 = appendResult153;
				half4 appendResult154 = (half4(_CheekScatterScale , _ForeheadScatterScale , _UpperLipScatterScale , _ChinScatterScale));
				half4 Scatter2156 = appendResult154;
				half4 appendResult155 = (half4(_NeckScatterScale , _EarScatterScale , 0.0 , 0.0));
				half4 Scatter3156 = appendResult155;
				half UMMS156 = _UnmaskedSmoothnessMod;
				half UMSS156 = _UnmaskedScatterScale;
				half SmoothnessMod156 = 0.0;
				half ScatterMask156 = 0.0;
				HeadMask156( In1156 , In2156 , In3156 , Mod1156 , Mod2156 , Mod3156 , Scatter1156 , Scatter2156 , Scatter3156 , UMMS156 , UMSS156 , SmoothnessMod156 , ScatterMask156 );
				#ifdef BOOLEAN_IS_HEAD_ON
				half staticSwitch169 = ScatterMask156;
				#else
				half staticSwitch169 = ScatterMask179;
				#endif
				half microScatteringMultiplier277 = ( _SubsurfaceScale * staticSwitch169 );
				half temp_output_336_0 = saturate( ( SAMPLE_TEXTURE2D( _SSSMap, sampler_Linear_Repeat, uv_SSSMap ).g * microScatteringMultiplier277 ) );
				half subsurfaceFlattenNormals274 = saturate( ( 1.0 - ( temp_output_336_0 * temp_output_336_0 * _SubsurfaceNormalSoften ) ) );
				half3 unpack50 = UnpackNormalScale( SAMPLE_TEXTURE2D( _NormalBlendMap, sampler_NormalMap, uv_NormalBlendMap ), ( subsurfaceFlattenNormals274 * _NormalBlendStrength ) );
				unpack50.z = lerp( 1, unpack50.z, saturate(( subsurfaceFlattenNormals274 * _NormalBlendStrength )) );
				#ifdef BOOLEAN_IS_HEAD_ON
				half3 staticSwitch71 = BlendNormal( staticSwitch372 , unpack50 );
				#else
				half3 staticSwitch71 = staticSwitch372;
				#endif
				half2 temp_cast_15 = (_MicroNormalTiling).xx;
				half2 texCoord308 = IN.ase_texcoord9.xy * temp_cast_15 + float2( 0,0 );
				float2 uv_MaskMap = IN.ase_texcoord9.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				half4 tex2DNode32 = SAMPLE_TEXTURE2D( _MaskMap, sampler_Linear_Repeat, uv_MaskMap );
				half microNormalMask287 = tex2DNode32.b;
				half3 unpack52 = UnpackNormalScale( SAMPLE_TEXTURE2D( _MicroNormalMap, sampler_NormalMap, texCoord308 ), ( _MicroNormalStrength * microNormalMask287 * subsurfaceFlattenNormals274 ) );
				unpack52.z = lerp( 1, unpack52.z, saturate(( _MicroNormalStrength * microNormalMask287 * subsurfaceFlattenNormals274 )) );
				
				float2 uv_EmissionMap = IN.ase_texcoord9.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				half metallicMap285 = tex2DNode32.r;
				
				half smoothnessMap288 = tex2DNode32.a;
				half smoothness185_g112 = smoothnessMap288;
				half In182_g112 = smoothness185_g112;
				float2 uv_WrinkleRoughnessBlend1 = IN.ase_texcoord9.xy * _WrinkleRoughnessBlend1_ST.xy + _WrinkleRoughnessBlend1_ST.zw;
				half In1182_g112 = ( ( ( 1.0 - SAMPLE_TEXTURE2D( _WrinkleRoughnessBlend1, sampler_Linear_Repeat, uv_WrinkleRoughnessBlend1 ).g ) - smoothness185_g112 ) * temp_output_23_0_g116 );
				float2 uv_WrinkleRoughnessBlend2 = IN.ase_texcoord9.xy * _WrinkleRoughnessBlend2_ST.xy + _WrinkleRoughnessBlend2_ST.zw;
				half In2182_g112 = ( ( ( 1.0 - SAMPLE_TEXTURE2D( _WrinkleRoughnessBlend2, sampler_Linear_Repeat, uv_WrinkleRoughnessBlend2 ).g ) - smoothness185_g112 ) * temp_output_23_0_g117 );
				float2 uv_WrinkleRoughnessBlend3 = IN.ase_texcoord9.xy * _WrinkleRoughnessBlend3_ST.xy + _WrinkleRoughnessBlend3_ST.zw;
				half In3182_g112 = ( ( ( 1.0 - SAMPLE_TEXTURE2D( _WrinkleRoughnessBlend3, sampler_Linear_Repeat, uv_WrinkleRoughnessBlend3 ).g ) - smoothness185_g112 ) * temp_output_23_0_g115 );
				half localMinMaxDeltaBlend1182_g112 = MinMaxDeltaBlend1182_g112( In182_g112 , In1182_g112 , In2182_g112 , In3182_g112 );
				half smoothnessWrinkle366 = localMinMaxDeltaBlend1182_g112;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half staticSwitch377 = smoothnessWrinkle366;
				#else
				half staticSwitch377 = smoothnessMap288;
				#endif
				half cavityMask295 = tex2DNode196.r;
				#ifdef BOOLEAN_IS_HEAD_ON
				half staticSwitch223 = ( staticSwitch377 * cavityMask295 );
				#else
				half staticSwitch223 = staticSwitch377;
				#endif
				half saferPower39 = abs( staticSwitch223 );
				half lerpResult41 = lerp( _SmoothnessMin , _SmoothnessMax , pow( saferPower39 , _SmoothnessPower ));
				#ifdef BOOLEAN_IS_HEAD_ON
				half staticSwitch170 = SmoothnessMod156;
				#else
				half staticSwitch170 = SmoothnessMod179;
				#endif
				half microSmoothnessMod276 = ( staticSwitch170 + _MicroSmoothnessMod );
				
				half ambientOcclusionMap286 = tex2DNode32.g;
				
				float2 uv_ThicknessMap = IN.ase_texcoord9.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				half4 temp_output_307_0 = ( baseColor266 * _SubsurfaceFalloff );
				

				float3 BaseColor = baseColor266.rgb;
				float3 Normal = BlendNormal( staticSwitch71 , unpack52 );
				float3 Emission = ( _EmissiveColor * SAMPLE_TEXTURE2D( _EmissionMap, sampler_DiffuseMap, uv_EmissionMap ) ).rgb;
				float3 Specular = 0.5;
				float Metallic = metallicMap285;
				float Smoothness = ( lerpResult41 + microSmoothnessMod276 );
				float Occlusion = ( 1.0 - ( ( 1.0 - ambientOcclusionMap286 ) * _AOStrength ) );
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = ( SAMPLE_TEXTURE2D( _ThicknessMap, sampler_Linear_Repeat, uv_ThicknessMap ).g * _ThicknessScale * temp_output_307_0 ).rgb;
				float3 Translucency = ( temp_output_307_0 * ( temp_output_336_0 * 0.2 ) ).rgb;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);
				#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
					inputData.bakedGI = SAMPLE_GI( SH, GetAbsolutePositionWS(inputData.positionWS),
						inputData.normalWS,
						inputData.viewDirectionWS,
						inputData.positionCS.xy,
						inputData.probeOcclusion,
						inputData.shadowMask );
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			ColorMask RG

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TRANSMISSION 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 170003
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif
	
            #define SHADERPASS SHADERPASS_MOTION_VECTORS

            #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MotionVectorsCommon.hlsl"

			

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
					float3 alembicMotionVector : TEXCOORD5;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 positionCSNoJitter : TEXCOORD0;
				float4 previousPositionCSNoJitter : TEXCOORD1;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _DiffuseColor;
			half4 _WrinkleValueSet3R;
			half4 _ColorBlendMap_ST;
			half4 _MNAOMap_ST;
			half4 _NormalMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _NormalBlendMap_ST;
			half4 _SSSMap_ST;
			half4 _RGBAMask_ST;
			half4 _CFULCMask_ST;
			half4 _EarNeckMask_ST;
			half4 _MaskMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _WrinkleRoughnessBlend1_ST;
			half4 _WrinkleRoughnessBlend2_ST;
			half4 _WrinkleRoughnessBlend3_ST;
			half4 _ThicknessMap_ST;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet3L;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1B_ST;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleFlowMap1_ST;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleFlowMap3_ST;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _DiffuseMap_ST;
			half4 _WrinkleValueSet2R;
			half4 _WrinkleFlowMap2_ST;
			half _ChinScatterScale;
			half _NeckScatterScale;
			half _EarScatterScale;
			half _SubsurfaceNormalSoften;
			half _MicroNormalStrength;
			half _MicroNormalTiling;
			half _AOStrength;
			half _MicroSmoothnessMod;
			half _SmoothnessMin;
			half _SmoothnessMax;
			half _UpperLipScatterScale;
			half _SmoothnessPower;
			half _NormalBlendStrength;
			half _ForeheadScatterScale;
			half _CheekSmoothnessMod;
			half _EarSmoothnessMod;
			half _ColorBlendStrength;
			half _MouthCavityAO;
			half _NostrilCavityAO;
			half _LipsCavityAO;
			half _NormalStrength;
			half _SubsurfaceScale;
			half _ThicknessScale;
			half _GSmoothnessMod;
			half _BSmoothnessMod;
			half _CheekScatterScale;
			half _ASmoothnessMod;
			half _GScatterScale;
			half _BScatterScale;
			half _AScatterScale;
			half _UnmaskedSmoothnessMod;
			half _UnmaskedScatterScale;
			half _ForeheadSmoothnessMod;
			half _UpperLipSmoothnessMod;
			half _ChinSmoothnessMod;
			half _NeckSmoothnessMod;
			half _RScatterScale;
			half _RSmoothnessMod;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(APLICATION_SPACE_WARP_MOTION)
					// We do not need jittered position in ASW
					o.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, v.positionOS));;
					o.positionCS = o.positionCSNoJitter;
				#else
					// Jittered. Match the frame.
					o.positionCS = vertexInput.positionCS;
					o.positionCSNoJitter = mul( _NonJitteredViewProjMatrix, mul( UNITY_MATRIX_M, v.positionOS));
				#endif

				float4 prevPos = ( unity_MotionVectorsParams.x == 1 ) ? float4( v.positionOld, 1 ) : v.positionOS;

				#if _ADD_PRECOMPUTED_VELOCITY
					prevPos = prevPos - float4(v.alembicMotionVector, 0);
				#endif

				o.previousPositionCSNoJitter = mul( _PrevViewProjMatrix, mul( UNITY_PREV_MATRIX_M, prevPos ) );

				ApplyMotionVectorZBias( o.positionCS );
				return o;
			}

			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}

			half4 frag(	VertexOutput IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(APLICATION_SPACE_WARP_MOTION)
					return float4( CalcAswNdcMotionVectorFromCsPositions( IN.positionCSNoJitter, IN.previousPositionCSNoJitter ), 1 );
				#else
					return float4( CalcNdcMotionVectorFromCsPositions( IN.positionCSNoJitter, IN.previousPositionCSNoJitter ), 0, 0 );
				#endif
			}		
			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}
/*ASEBEGIN
Version=19600
Node;AmplifyShaderEditor.CommentaryNode;364;-5375.53,-3197.479;Inherit;False;2706.421;2113.521;;43;363;362;361;341;388;360;359;358;357;356;355;354;375;374;371;348;351;349;399;350;353;352;396;397;398;379;384;383;380;381;386;385;382;367;366;365;401;402;403;411;412;419;420;Wrinkle System;1,0.5137255,0.7779443,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;229;-5921.438,145.91;Inherit;False;3216.245;1858.522;;58;276;277;174;170;171;172;68;169;156;179;165;164;167;168;166;181;182;147;146;161;159;163;180;157;123;183;152;153;155;124;125;151;154;121;138;150;144;140;133;137;148;142;120;122;131;134;145;139;132;141;130;135;143;129;127;126;128;417;Micro-Smoothess/Scattering;0.4764151,1,0.9938402,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;220;-1735.542,2667.253;Inherit;False;1913.987;862.4985;;17;27;28;29;114;30;66;69;119;115;261;267;279;307;327;336;414;415;Subsurface Scattering;1,0.5051794,0.495283,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;208;-4654.008,-805.9103;Inherit;False;1980.672;617.1674;;13;280;203;202;201;197;207;204;205;206;196;195;295;418;Head Cavity Mask;0.5235849,1,0.9775805,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;314;-1060.737,3655.976;Inherit;False;1243.882;319.7932;Subsurface Normal Flattening;5;274;312;311;310;313;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;212;-2235.64,-1821.26;Inherit;False;2379.154;942.4747;;16;368;2;1;12;14;11;339;338;19;266;72;209;281;13;369;370;Base Color;0.495283,1,0.5625787,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;294;-3855.127,2547.446;Inherit;False;1090.966;451.807;;7;31;32;285;286;287;288;416;Mask Map;0.495283,1,0.986145,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;228;-2012.045,1478.413;Inherit;False;2159.251;547.3636;;13;282;377;378;292;222;223;175;41;278;42;43;39;40;Smoothness;0.5330188,1,0.9963375,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;213;-2240.617,-782.9695;Inherit;False;2378.617;1318.153;;22;59;60;61;52;71;54;53;308;57;50;48;62;58;289;51;49;325;326;373;372;376;387;Normal Blending;0.4858491,0.5398334,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;82;-775.9232,2212.324;Inherit;False;929.907;257.7939;;5;293;37;35;36;33;Ambient Occlusion;0.495283,1,0.9960415,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;235;-712.3485,727.3322;Inherit;False;853.0981;468.4968;;5;231;232;233;234;413;Emission;0.989594,0.495283,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;144;-5216.135,1777.438;Inherit;False;Property;_NeckScatterScale;Neck Scatter Scale;54;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-5870.57,1107.733;Inherit;False;Property;_ForeheadSmoothnessMod;Forehead Smoothness Mod;43;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;130;-5870.502,1028.739;Inherit;False;Property;_CheekSmoothnessMod;Cheek Smoothness Mod;42;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;143;-5216.635,1699.838;Inherit;False;Property;_ChinScatterScale;Chin Scatter Scale;49;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-5222.64,1468.738;Inherit;False;Property;_CheekScatterScale;Cheek Scatter Scale;46;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-5220.736,1543.238;Inherit;False;Property;_ForeheadScatterScale;Forehead Scatter Scale;47;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;135;-5864.63,1412.598;Inherit;False;Property;_EarSmoothnessMod;Ear Smoothness Mod;51;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;150;-5482.35,848.4108;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-5868.589,1183.79;Inherit;False;Property;_UpperLipSmoothnessMod;Upper Lip Smoothness Mod;44;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;120;-5278.858,198.8011;Inherit;True;Property;_RGBAMask;RGBAMask;20;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;142;-5215.736,1623.538;Inherit;False;Property;_UpperLipScatterScale;Upper Lip Scatter Scale;48;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-5867.921,1334.53;Inherit;False;Property;_NeckSmoothnessMod;Neck Smoothness Mod;52;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;133;-5870.629,1257.79;Inherit;False;Property;_ChinSmoothnessMod;Chin Smoothness Mod;45;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;145;-5216.337,1859.838;Inherit;False;Property;_EarScatterScale;Ear Scatter Scale;53;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;183;-5030.324,927.0665;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;124;-4965.036,427.8192;Inherit;True;Property;_TextureSample9;Texture Sample 9;32;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode;155;-4812.561,1653.032;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;151;-5485.214,1004.599;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;154;-4817.48,1491.676;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;123;-4961.156,195.9101;Inherit;True;Property;_TextureSample8;Texture Sample 8;32;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;125;-4968.036,652.8188;Inherit;True;Property;_TextureSample10;Texture Sample 10;32;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.DynamicAppendNode;152;-5478.733,1174.053;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;153;-4822.524,1324.257;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;157;-4485.396,1398.249;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;164;-4488.799,925.8127;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;147;-4804.24,1892.508;Inherit;False;Property;_UnmaskedScatterScale;Unmasked Scatter Scale;31;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;180;-4277.39,1351.719;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;182;-4295.063,1365.363;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;165;-4498.22,990.5948;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;161;-4481.163,1478.158;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;167;-5040.264,980.3148;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;168;-5044.868,1008.421;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;163;-4483.671,852.2808;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;181;-4282.742,963.0557;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;146;-4804.84,1818.008;Inherit;False;Property;_UnmaskedSmoothnessMod;Unmasked Smoothness Mod;26;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;159;-4483.228,1441.246;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;166;-5036.362,953.3891;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CustomExpressionNode;179;-4116.683,1551.105;Inherit;False;float mask = saturate(In1.r + In1.g + In1.b + In1.a)@$float unmask = 1.0 - mask@$$SmoothnessMod = dot(In1, Mod1) + (UMMS * unmask)@$ScatterMask = dot(In1, Scatter1) + (UMSS * unmask)@$return@;7;Create;7;True;In1;FLOAT4;0,0,0,0;In;;Inherit;False;True;Mod1;FLOAT4;0,0,0,0;In;;Inherit;False;True;Scatter1;FLOAT4;0,0,0,0;In;;Inherit;False;True;UMMS;FLOAT;0;In;;Inherit;False;True;UMSS;FLOAT;0;In;;Inherit;False;True;SmoothnessMod;FLOAT;0;Out;;Inherit;False;True;ScatterMask;FLOAT;0;Out;;Inherit;False;SkinMask;True;False;0;;False;8;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;3;FLOAT;0;FLOAT;7;FLOAT;8
Node;AmplifyShaderEditor.CustomExpressionNode;156;-4116.715,1186.906;Inherit;False;In3.zw = 0@$float4 m = In1 + In2 + In3@$float mask = saturate(m.x + m.y + m.z + m.w)@$float unmask = 1.0 - mask@$$SmoothnessMod = dot(In1, Mod1) + dot(In2, Mod2) + dot(In3, Mod3) + (UMMS * unmask)@$ScatterMask = dot(In1, Scatter1) + dot(In2, Scatter2) + dot(In3, Scatter3) + (UMSS * unmask)@$return@;7;Create;13;True;In1;FLOAT4;0,0,0,0;In;;Inherit;False;True;In2;FLOAT4;0,0,0,0;In;;Inherit;False;True;In3;FLOAT4;0,0,0,0;In;;Inherit;False;True;Mod1;FLOAT4;0,0,0,0;In;;Inherit;False;True;Mod2;FLOAT4;0,0,0,0;In;;Inherit;False;True;Mod3;FLOAT4;0,0,0,0;In;;Inherit;False;True;Scatter1;FLOAT4;0,0,0,0;In;;Inherit;False;True;Scatter2;FLOAT4;0,0,0,0;In;;Inherit;False;True;Scatter3;FLOAT4;0,0,0,0;In;;Inherit;False;True;UMMS;FLOAT;0;In;;Inherit;False;True;UMSS;FLOAT;0;In;;Inherit;False;True;SmoothnessMod;FLOAT;0;Out;;Inherit;False;True;ScatterMask;FLOAT;0;Out;;Inherit;False;HeadMask;True;False;0;;False;14;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;9;FLOAT4;0,0,0,0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;3;FLOAT;0;FLOAT;13;FLOAT;14
Node;AmplifyShaderEditor.RangedFloatNode;68;-3587.94,1564.914;Inherit;False;Property;_SubsurfaceScale;Subsurface Scale;13;0;Create;True;0;0;0;False;0;False;1;0.85;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;172;-3213.256,1605.946;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;27;-1643.384,3009.34;Inherit;True;Property;_SSSMap;Subsurface Map;12;0;Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;277;-2977.661,1621.493;Inherit;False;microScatteringMultiplier;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;28;-1351.417,3093.075;Inherit;True;Property;_TextureSample2;Texture Sample 2;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;279;-1326.702,3290.222;Inherit;False;277;microScatteringMultiplier;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;-1025.345,3214.753;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;204;-3977.836,-446.3848;Inherit;False;Property;_MouthCavityAO;Mouth Cavity AO;38;0;Create;True;0;0;0;False;0;False;2.5;2.5;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;205;-3977.836,-371.3848;Inherit;False;Property;_NostrilCavityAO;Nostril Cavity AO;39;0;Create;True;0;0;0;False;0;False;2.5;2.5;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;313;-1026.737,3835.976;Inherit;False;Property;_SubsurfaceNormalSoften;Subsurface Normal Soften;15;0;Create;True;0;0;0;False;0;False;0.4;0.65;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;196;-3997.858,-661.9286;Inherit;True;Property;_TextureSample11;Texture Sample 11;32;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;336;-877.075,3225.632;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-3977.836,-296.3848;Inherit;False;Property;_LipsCavityAO;Lips Cavity AO;40;0;Create;True;0;0;0;False;0;False;2.5;2.5;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;203;-3341.862,-431.3848;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;201;-3342.862,-643.385;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;310;-698.7376,3760.976;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;202;-3343.862,-536.3851;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;207;-3083.988,-560.6332;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;31;-3805.128,2659.586;Inherit;True;Property;_MaskMap;Mask Map;2;0;Create;False;0;0;0;False;0;False;None;None;False;gray;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.OneMinusNode;311;-512.8137,3791.382;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;280;-2885.78,-566.2528;Inherit;False;cavityAO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;32;-3442.609,2661.744;Inherit;True;Property;_TextureSample4;Texture Sample 4;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;312;-313.7972,3792.8;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;13;-828.2365,-1312.348;Inherit;False;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;295;-3608.803,-715.5761;Inherit;False;cavityMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;281;-809.6323,-1160.13;Inherit;False;280;cavityAO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;288;-3007.34,2883.253;Inherit;False;smoothnessMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;274;-119.2839,3788.979;Inherit;False;subsurfaceFlattenNormals;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;209;-571.6563,-1265.26;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-2171.121,-74.08789;Inherit;False;Property;_NormalBlendStrength;Normal Blend Strength (Head);36;0;Create;False;0;0;0;False;0;False;0;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;325;-2191.167,-377.4025;Inherit;False;274;subsurfaceFlattenNormals;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;171;-3575.731,1428.302;Inherit;False;Property;_MicroSmoothnessMod;Micro Smoothness Mod;21;0;Create;True;0;0;0;False;0;False;0;-0.05;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;287;-3013.998,2790.401;Inherit;False;microNormalMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;286;-3029.161,2696.34;Inherit;False;ambientOcclusionMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;324;-1855.969,-229.5575;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;49;-1715.109,-732.9696;Inherit;True;Property;_NormalMap;Normal Map;7;1;[Normal];Create;True;0;0;0;False;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;51;-1721.925,-416.9095;Inherit;True;Property;_NormalBlendMap;Normal Blend Map (Head);35;1;[Normal];Create;False;0;0;0;False;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;266;-103.9292,-1272.774;Inherit;False;baseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;62;-2081.277,126.7674;Inherit;False;Property;_MicroNormalTiling;Micro Normal Tiling;11;0;Create;True;0;0;0;False;0;False;25;20;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;50;-1360.625,-340.1081;Inherit;True;Property;_TextureSample6;Texture Sample 6;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;293;-744.9214,2263.6;Inherit;False;286;ambientOcclusionMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-2079.897,224.414;Inherit;False;Property;_MicroNormalStrength;Micro Normal Strength;10;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;326;-2075.185,414.078;Inherit;False;274;subsurfaceFlattenNormals;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-877.3478,1792.652;Inherit;False;Property;_SmoothnessPower;SmoothnessPower;4;0;Create;True;0;0;0;False;0;False;0.1;1.35;0.1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;48;-1368.809,-653.1702;Inherit;True;Property;_TextureSample5;Texture Sample 5;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;289;-2023.831,325.1693;Inherit;False;287;microNormalMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;174;-3205.118,1338.393;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;33;-419.5572,2268.659;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;39;-562.2332,1713.367;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-565.9235,2368.116;Inherit;False;Property;_AOStrength;AO Strength;3;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;57;-1634.541,213.7224;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;66;-512.8407,3074.174;Inherit;False;Property;_SubsurfaceFalloff;Subsurface Falloff;14;0;Create;True;0;0;0;False;0;False;1,0.3686275,0.2980392,0;1,0.3686274,0.2980392,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;43;-880.4745,1627.142;Inherit;False;Property;_SmoothnessMax;SmoothnessMax;6;0;Create;True;0;0;0;False;0;False;0;0.8661538;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;276;-2974.205,1333.605;Inherit;False;microSmoothnessMod;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;267;-489.2372,2986.478;Inherit;False;266;baseColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-881.3461,1528.413;Inherit;False;Property;_SmoothnessMin;SmoothnessMin;5;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;308;-1715.351,86.57606;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;285;-3007.333,2597.446;Inherit;False;metallicMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;233;-313.2517,777.3322;Inherit;False;Property;_EmissiveColor;Emissive Color;19;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;232;-382.6018,965.829;Inherit;True;Property;_TextureSample12;Texture Sample 12;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;30;-939.8237,2737.313;Inherit;True;Property;_TextureSample3;Texture Sample 3;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;307;-263.7095,3057.134;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;278;-331.2587,1786.982;Inherit;False;276;microSmoothnessMod;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;327;-255.7886,3224.537;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;114;-931.1096,2932.94;Inherit;False;Property;_ThicknessScale;ThicknessScale;17;0;Create;True;0;0;0;False;0;False;1;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;41;-292.7053,1603.925;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;52;-1362.721,30.26169;Inherit;True;Property;_TextureSample7;Texture Sample 7;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-198.9745,2262.323;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;-1.554609,3120.266;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;37;-25.01527,2270.281;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;-7.465607,2740.98;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;175;0.4094224,1707.347;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;234;-21.252,912.3322;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;290;-35.24173,1274.675;Inherit;False;285;metallicMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;291;1007.145,973.4159;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;305;1007.451,1028.851;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;265;988.7359,2803.758;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;273;1006.199,1106.422;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StickyNoteNode;197;-4275.65,-395.1431;Inherit;False;182.5439;132.5438;MNAO Map;;1,1,1,1;R - mouth cavity mask$G - mouth gradient$B - nostril gradient$A - lip gradient;0;0
Node;AmplifyShaderEditor.WireNode;264;997.1307,2521.128;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;261;-676.9075,3354.999;Inherit;False;Constant;_SubsurfaceWrapMax;Subsurface Wrap Max;53;0;Create;True;0;0;0;False;0;False;0.2;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;122;-5264.799,651.9438;Inherit;True;Property;_EarNeckMask;EarNeckMask;50;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;126;-5871.432,717.2508;Inherit;False;Property;_RSmoothnessMod;R/Nose Smoothness Mod;22;0;Create;False;0;0;0;False;0;False;0;-0.119;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-5871.432,791.1179;Inherit;False;Property;_GSmoothnessMod;G/Mouth Smoothness Mod;23;0;Create;False;0;0;0;False;0;False;0;-0.034;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;128;-5870.449,867.0728;Inherit;False;Property;_BSmoothnessMod;B/Upper Lid Smoothness Mod;24;0;Create;False;0;0;0;False;0;False;0;0.3;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-5871.439,947.0417;Inherit;False;Property;_ASmoothnessMod;A/Inner Lid Smoothness Mod;25;0;Create;False;0;0;0;False;0;False;0;0.574;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;148;-5219.895,1168.184;Inherit;False;Property;_RScatterScale;R/Nose Scatter Scale;27;0;Create;False;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;137;-5220.338,1236.739;Inherit;False;Property;_GScatterScale;G/Mouth Scatter Scale;28;0;Create;False;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;138;-5218.338,1312.739;Inherit;False;Property;_BScatterScale;B/Upper Lid Scatter Scale;29;0;Create;False;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;139;-5219.338,1383.739;Inherit;False;Property;_AScatterScale;A/Inner Lid Scatter Scale;30;0;Create;False;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;306;1010.575,511.162;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;322;1019.641,686.1033;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;270;1004.16,881.5826;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;11;-2102.36,-1231.268;Inherit;True;Property;_ColorBlendMap;Color Blend Map (Head);33;0;Create;False;0;0;0;False;0;False;None;None;False;gray;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;14;-1790.619,-1058.952;Inherit;False;Property;_ColorBlendStrength;Color Blend Strength;34;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;12;-1786.356,-1268.269;Inherit;True;Property;_TextureSample1;Texture Sample 1;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1;-1773.311,-1474.785;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexturePropertyNode;2;-2095.26,-1458.416;Inherit;True;Property;_DiffuseMap;Diffuse Map;0;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode;338;-1214.111,-1739.471;Inherit;False;Property;_DiffuseColor;Diffuse Color;1;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;339;-959.9448,-1552.432;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;170;-3570.901,1303.913;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;32;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Reference;72;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;169;-3564.514,1656.318;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;32;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Reference;72;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;54;-538.4346,-461.9525;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BlendNormalsNode;61;-108.2646,-450.1985;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;369;-1445.864,-1387.524;Inherit;False;365;diffuseWrinkle;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;368;-1455.458,-1525.569;Inherit;False;diffuseMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;373;-1045.308,-692.3812;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;376;-1029.159,-597.6074;Inherit;False;367;normalWrinkle;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;71;-355.7217,-637.7139;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;32;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Reference;72;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;223;-1180.134,1683.294;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;32;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Reference;72;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;222;-1379.222,1795.357;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;292;-1932.364,1615.218;Inherit;False;288;smoothnessMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;378;-1936.143,1704.428;Inherit;False;366;smoothnessWrinkle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;282;-1592.698,1852.632;Inherit;False;295;cavityMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;377;-1687.802,1638.309;Inherit;False;Property;BOOLEAN_USE_WRINKLE2;Use Wrinkle;55;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Reference;370;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;72;-374.3588,-1372.652;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;32;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-2177.274,-649.4672;Inherit;False;Property;_NormalStrength;Normal Strength;8;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;370;-1232.864,-1465.524;Inherit;False;Property;BOOLEAN_USE_WRINKLE;Use Wrinkle;55;0;Create;False;0;0;0;False;0;False;1;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;372;-816.083,-656.7979;Inherit;False;Property;BOOLEAN_USE_WRINKLE1;Use Wrinkle;55;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Reference;370;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;365;-2924.932,-2828.969;Inherit;False;diffuseWrinkle;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;366;-2944.932,-2714.969;Inherit;False;smoothnessWrinkle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;367;-2929.932,-2604.969;Inherit;False;normalWrinkle;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;352;-4982.649,-2685.429;Inherit;True;Property;_WrinkleDiffuseBlend1;Wrinkle Diffuse Blend 1;61;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;353;-4681.478,-2611.3;Inherit;True;Property;_WrinkleDiffuseBlend2;Wrinkle Diffuse Blend 2;62;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;371;-3901.534,-3079.103;Inherit;False;368;diffuseMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;374;-3932.238,-2994.785;Inherit;False;288;smoothnessMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;375;-3905.238,-2911.785;Inherit;False;373;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;354;-4379.805,-2536.579;Inherit;True;Property;_WrinkleDiffuseBlend3;Wrinkle Diffuse Blend 3;63;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;355;-4989.208,-2478.067;Inherit;True;Property;_WrinkleRoughnessBlend1;Wrinkle Roughness Blend 1;64;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;356;-4683.021,-2404.761;Inherit;True;Property;_WrinkleRoughnessBlend2;Wrinkle Roughness Blend 2;65;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;357;-4383.967,-2323.437;Inherit;True;Property;_WrinkleRoughnessBlend3;Wrinkle Roughness Blend 3;66;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;359;-4689.214,-2197.321;Inherit;True;Property;_WrinkleNormalBlend2;Wrinkle Normal Blend 2;68;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;360;-4385.004,-2112.907;Inherit;True;Property;_WrinkleNormalBlend3;Wrinkle Normal Blend 3;69;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;361;-4061.719,-2455.876;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;362;-4061.005,-2388.117;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;363;-4061.149,-2316.068;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;349;-4676.815,-3024.1;Inherit;True;Property;_WrinkleMaskSet1B;Wrinkle Mask Set 1B;57;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;351;-4981.156,-2891.029;Inherit;True;Property;_WrinkleMaskSet3;Wrinkle Mask Set 3;59;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;348;-4976.637,-3101.118;Inherit;True;Property;_WrinkleMaskSet1A;Wrinkle Mask Set 1A;56;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;350;-4375.56,-2891.29;Inherit;True;Property;_WrinkleMaskSet2;Wrinkle Mask Set 2;58;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;399;-4677.079,-2816.188;Inherit;True;Property;_WrinkleMaskSet123;Wrinkle Mask Set 123;60;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.Vector4Node;382;-4744.661,-1355.396;Inherit;False;Property;_WrinkleValueSet3L;Wrinkle Value Set 3 Left;76;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;385;-4496.513,-1422.54;Inherit;False;Property;_WrinkleValueSet2R;Wrinkle Value Set 2 Right;80;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;386;-4241.512,-1369.54;Inherit;False;Property;_WrinkleValueSet3R;Wrinkle Value Set 3 Right;81;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;381;-4980.661,-1421.396;Inherit;False;Property;_WrinkleValueSet2L;Wrinkle Value Set 2 Left;75;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;380;-4745.96,-1545.107;Inherit;False;Property;_WrinkleValueSet1BL;Wrinkle Value Set 1B Left;74;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;383;-4496.811,-1605.251;Inherit;False;Property;_WrinkleValueSet1AR;Wrinkle Value Set 1A Right;78;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;384;-4240.81,-1562.251;Inherit;False;Property;_WrinkleValueSet1BR;Wrinkle Value Set 1B Right;79;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;379;-4980.96,-1604.107;Inherit;False;Property;_WrinkleValueSet1AL;Wrinkle Value Set 1A Left;73;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;398;-3983.338,-1417.821;Inherit;False;Property;_WrinkleValueSet12CR;Wrinkle Value Set 12C Right;82;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;397;-3982.188,-1612.015;Inherit;False;Property;_WrinkleValueSet12CL;Wrinkle Value Set 12C Left;77;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;358;-4993.11,-2266.305;Inherit;True;Property;_WrinkleNormalBlend1;Wrinkle Normal Blend 1;67;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;401;-4990.938,-2063.143;Inherit;True;Property;_WrinkleFlowMap1;Wrinkle Flow Map 1;70;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;402;-4685.299,-1986.733;Inherit;True;Property;_WrinkleFlowMap2;Wrinkle Flow Map 2;71;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;403;-4379.662,-1909.291;Inherit;True;Property;_WrinkleFlowMap3;Wrinkle Flow Map 3;72;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;388;-5304.025,-1999.434;Inherit;False;387;normalMapScale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;387;-1714.323,-524.6427;Inherit;False;normalMapScale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;410;-3463.776,-2737.958;Inherit;False;RL_Amplify_WrinkleMapSystem;-1;;112;d27d6ddfed52eb04ba4585a9fc285421;0;32;7;COLOR;0,0,0,0;False;8;FLOAT;0;False;9;FLOAT3;0,0,0;False;15;FLOAT4;0,0,0,0;False;16;FLOAT4;0,0,0,0;False;17;FLOAT4;0,0,0,0;False;18;FLOAT4;0,0,0,0;False;105;FLOAT4;0,0,0,0;False;67;COLOR;0,0,0,0;False;71;COLOR;0,0,0,0;False;76;COLOR;0,0,0,0;False;68;FLOAT;0;False;72;FLOAT;0;False;77;FLOAT;0;False;69;FLOAT3;0,0,0;False;73;FLOAT3;0,0,0;False;78;FLOAT3;0,0,0;False;151;FLOAT;0;False;155;FLOAT;0;False;156;FLOAT;0;False;19;FLOAT4;0,0,0,0;False;20;FLOAT4;0,0,0,0;False;23;FLOAT4;0,0,0,0;False;24;FLOAT4;0,0,0,0;False;103;FLOAT4;0,0,0,0;False;21;FLOAT4;0,0,0,0;False;22;FLOAT4;0,0,0,0;False;25;FLOAT4;0,0,0,0;False;26;FLOAT4;0,0,0,0;False;104;FLOAT4;0,0,0,0;False;106;FLOAT4;0,0,0,0;False;210;FLOAT4;0,0,0,0;False;3;FLOAT4;0;FLOAT;1;FLOAT3;6
Node;AmplifyShaderEditor.Vector4Node;396;-3729.247,-1543.24;Inherit;False;Property;_WrinkleValueSet3DB;Wrinkle Value Set 3D Both;83;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;411;-3701.806,-1354.502;Inherit;False;Property;_WrinkleValueSetBCCB;Wrinkle Value Set BCC Both;84;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;53;-1717.862,-122.5297;Inherit;True;Property;_MicroNormalMap;Micro Normal Map;9;1;[Normal];Create;True;0;0;0;False;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;231;-677.3489,885.8763;Inherit;True;Property;_EmissionMap;Emission Map;18;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerStateNode;413;-654.6285,1086.46;Inherit;False;0;0;0;1;2;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.TexturePropertyNode;29;-1359.003,2734.873;Inherit;True;Property;_ThicknessMap;Thickness Map;16;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.WireNode;415;-1149.664,2922.181;Inherit;False;1;0;SAMPLERSTATE;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;414;-1632.664,2914.181;Inherit;False;412;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;416;-3796.771,2873.88;Inherit;False;412;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.TexturePropertyNode;121;-5586.061,424.1726;Inherit;True;Property;_CFULCMask;CFULCMask;41;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;417;-5320.433,514.1663;Inherit;False;412;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.TexturePropertyNode;195;-4482.684,-717.7444;Inherit;True;Property;_MNAOMap;Cavity AO Map;37;0;Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;418;-4485.569,-506.9464;Inherit;False;412;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;341;-5307.774,-2518.632;Inherit;False;0;0;0;1;-1;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;412;-5337.567,-2355.107;Inherit;False;mainSamplerState;-1;True;1;0;SAMPLERSTATE;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;419;-5354.233,-2695.628;Inherit;False;0;0;0;1;352;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;420;-5349.042,-2223.723;Inherit;False;0;0;0;1;358;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;22;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;24;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;26;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;23;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;25;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;21;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;19;-231.2036,849.3382;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;20;2364.753,849.3382;Half;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;Reallusion/Amplify/RL_SkinShader_Variants_URP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;44;Lighting Model;0;0;Workflow;1;637772825850121632;Surface;0;637772825868519660;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;638577476267541321;Transmission;1;637772850612646128;  Transmission Shadow;0.5,False,;637782843343460286;Translucency;1;637772840223650237;  Translucency Strength;1,False,;637782843347113608;  Normal Distortion;0.5,False,;637782843350385796;  Scattering;2,False,;637782843353567621;  Direct;0.9,False,;637782843356998360;  Ambient;0.1,False,;637782843360478407;  Shadow;0.5,False,;637782843364399850;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;637772870354882285;  Phong;0;637772870352635162;  Strength;0,False,;637772870307115194;  Type;0;0;  Tess;1,False,;637772870321916518;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;11;False;True;True;True;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;421;2364.753,929.3382;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;422;2364.753,929.3382;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;423;2364.753,949.3382;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;150;0;126;0
WireConnection;150;1;127;0
WireConnection;150;2;128;0
WireConnection;150;3;129;0
WireConnection;183;0;150;0
WireConnection;124;0;121;0
WireConnection;124;7;417;0
WireConnection;155;0;144;0
WireConnection;155;1;145;0
WireConnection;151;0;130;0
WireConnection;151;1;131;0
WireConnection;151;2;132;0
WireConnection;151;3;133;0
WireConnection;154;0;140;0
WireConnection;154;1;141;0
WireConnection;154;2;142;0
WireConnection;154;3;143;0
WireConnection;123;0;120;0
WireConnection;123;7;417;0
WireConnection;125;0;122;0
WireConnection;125;7;417;0
WireConnection;152;0;134;0
WireConnection;152;1;135;0
WireConnection;153;0;148;0
WireConnection;153;1;137;0
WireConnection;153;2;138;0
WireConnection;153;3;139;0
WireConnection;157;0;153;0
WireConnection;164;0;124;0
WireConnection;180;0;183;0
WireConnection;182;0;153;0
WireConnection;165;0;125;0
WireConnection;161;0;155;0
WireConnection;167;0;151;0
WireConnection;168;0;152;0
WireConnection;163;0;123;0
WireConnection;181;0;123;0
WireConnection;159;0;154;0
WireConnection;166;0;150;0
WireConnection;179;1;181;0
WireConnection;179;2;180;0
WireConnection;179;3;182;0
WireConnection;179;4;146;0
WireConnection;179;5;147;0
WireConnection;156;1;163;0
WireConnection;156;2;164;0
WireConnection;156;3;165;0
WireConnection;156;4;166;0
WireConnection;156;5;167;0
WireConnection;156;6;168;0
WireConnection;156;7;157;0
WireConnection;156;8;159;0
WireConnection;156;9;161;0
WireConnection;156;10;146;0
WireConnection;156;11;147;0
WireConnection;172;0;68;0
WireConnection;172;1;169;0
WireConnection;277;0;172;0
WireConnection;28;0;27;0
WireConnection;28;7;414;0
WireConnection;69;0;28;2
WireConnection;69;1;279;0
WireConnection;196;0;195;0
WireConnection;196;7;418;0
WireConnection;336;0;69;0
WireConnection;203;0;196;4
WireConnection;203;1;206;0
WireConnection;201;0;196;2
WireConnection;201;1;204;0
WireConnection;310;0;336;0
WireConnection;310;1;336;0
WireConnection;310;2;313;0
WireConnection;202;0;196;3
WireConnection;202;1;205;0
WireConnection;207;0;201;0
WireConnection;207;1;202;0
WireConnection;207;2;203;0
WireConnection;311;0;310;0
WireConnection;280;0;207;0
WireConnection;32;0;31;0
WireConnection;32;7;416;0
WireConnection;312;0;311;0
WireConnection;13;0;12;0
WireConnection;13;1;339;0
WireConnection;13;2;14;0
WireConnection;295;0;196;1
WireConnection;288;0;32;4
WireConnection;274;0;312;0
WireConnection;209;0;13;0
WireConnection;209;1;281;0
WireConnection;287;0;32;3
WireConnection;286;0;32;2
WireConnection;324;0;325;0
WireConnection;324;1;59;0
WireConnection;266;0;72;0
WireConnection;50;0;51;0
WireConnection;50;5;324;0
WireConnection;50;7;49;1
WireConnection;48;0;49;0
WireConnection;48;5;387;0
WireConnection;48;7;49;1
WireConnection;174;0;170;0
WireConnection;174;1;171;0
WireConnection;33;0;293;0
WireConnection;39;0;223;0
WireConnection;39;1;40;0
WireConnection;57;0;58;0
WireConnection;57;1;289;0
WireConnection;57;2;326;0
WireConnection;276;0;174;0
WireConnection;308;0;62;0
WireConnection;285;0;32;1
WireConnection;232;0;231;0
WireConnection;232;7;413;0
WireConnection;30;0;29;0
WireConnection;30;7;415;0
WireConnection;307;0;267;0
WireConnection;307;1;66;0
WireConnection;327;0;336;0
WireConnection;327;1;261;0
WireConnection;41;0;42;0
WireConnection;41;1;43;0
WireConnection;41;2;39;0
WireConnection;52;0;53;0
WireConnection;52;1;308;0
WireConnection;52;5;57;0
WireConnection;52;7;49;1
WireConnection;35;0;33;0
WireConnection;35;1;36;0
WireConnection;119;0;307;0
WireConnection;119;1;327;0
WireConnection;37;0;35;0
WireConnection;115;0;30;2
WireConnection;115;1;114;0
WireConnection;115;2;307;0
WireConnection;175;0;41;0
WireConnection;175;1;278;0
WireConnection;234;0;233;0
WireConnection;234;1;232;0
WireConnection;291;0;290;0
WireConnection;305;0;175;0
WireConnection;265;0;119;0
WireConnection;273;0;37;0
WireConnection;264;0;115;0
WireConnection;306;0;266;0
WireConnection;322;0;61;0
WireConnection;270;0;234;0
WireConnection;12;0;11;0
WireConnection;12;7;2;1
WireConnection;1;0;2;0
WireConnection;1;7;2;1
WireConnection;339;0;338;0
WireConnection;339;1;370;0
WireConnection;170;1;179;7
WireConnection;170;0;156;13
WireConnection;169;1;179;8
WireConnection;169;0;156;14
WireConnection;54;0;372;0
WireConnection;54;1;50;0
WireConnection;61;0;71;0
WireConnection;61;1;52;0
WireConnection;368;0;1;0
WireConnection;373;0;48;0
WireConnection;71;1;372;0
WireConnection;71;0;54;0
WireConnection;223;1;377;0
WireConnection;223;0;222;0
WireConnection;222;0;377;0
WireConnection;222;1;282;0
WireConnection;377;1;292;0
WireConnection;377;0;378;0
WireConnection;72;1;339;0
WireConnection;72;0;209;0
WireConnection;370;1;368;0
WireConnection;370;0;369;0
WireConnection;372;1;373;0
WireConnection;372;0;376;0
WireConnection;365;0;410;0
WireConnection;366;0;410;1
WireConnection;367;0;410;6
WireConnection;352;7;419;0
WireConnection;353;7;419;0
WireConnection;354;7;419;0
WireConnection;355;7;341;0
WireConnection;356;7;341;0
WireConnection;357;7;341;0
WireConnection;359;5;388;0
WireConnection;359;7;420;0
WireConnection;360;5;388;0
WireConnection;360;7;420;0
WireConnection;361;0;355;2
WireConnection;362;0;356;2
WireConnection;363;0;357;2
WireConnection;349;7;341;0
WireConnection;351;7;341;0
WireConnection;348;7;341;0
WireConnection;350;7;341;0
WireConnection;399;7;341;0
WireConnection;358;5;388;0
WireConnection;358;7;420;0
WireConnection;401;7;341;0
WireConnection;402;7;341;0
WireConnection;403;7;341;0
WireConnection;387;0;60;0
WireConnection;410;7;371;0
WireConnection;410;8;374;0
WireConnection;410;9;375;0
WireConnection;410;15;348;0
WireConnection;410;16;349;0
WireConnection;410;17;350;0
WireConnection;410;18;351;0
WireConnection;410;105;399;0
WireConnection;410;67;352;0
WireConnection;410;71;353;0
WireConnection;410;76;354;0
WireConnection;410;68;361;0
WireConnection;410;72;362;0
WireConnection;410;77;363;0
WireConnection;410;69;358;0
WireConnection;410;73;359;0
WireConnection;410;78;360;0
WireConnection;410;151;401;2
WireConnection;410;155;402;2
WireConnection;410;156;403;2
WireConnection;410;19;379;0
WireConnection;410;20;380;0
WireConnection;410;23;381;0
WireConnection;410;24;382;0
WireConnection;410;103;397;0
WireConnection;410;21;383;0
WireConnection;410;22;384;0
WireConnection;410;25;385;0
WireConnection;410;26;386;0
WireConnection;410;104;398;0
WireConnection;410;106;396;0
WireConnection;410;210;411;0
WireConnection;415;0;414;0
WireConnection;412;0;341;0
WireConnection;20;0;306;0
WireConnection;20;1;322;0
WireConnection;20;2;270;0
WireConnection;20;3;291;0
WireConnection;20;4;305;0
WireConnection;20;5;273;0
WireConnection;20;14;264;0
WireConnection;20;15;265;0
ASEEND*/
//CHKSM=662029DBFA2940A4F21E73C4314C7248A9BBEF3C