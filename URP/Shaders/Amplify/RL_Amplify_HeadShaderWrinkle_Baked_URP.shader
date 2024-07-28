// Made with Amplify Shader Editor v1.9.6
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Reallusion/Amplify/RL_HeadShaderWrinkle_Baked_URP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_BaseMap("Base Map", 2D) = "white" {}
		_BaseColor("Base Color", Color) = (1,1,1,0)
		_MetallicGlossMap("Metallic Gloss Map", 2D) = "white" {}
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 1
		[Normal]_BumpMap("Bump Map", 2D) = "bump" {}
		_BumpScale("Bump Scale", Range( 0 , 2)) = 2
		_OcclusionMap("Occlusion Map", 2D) = "white" {}
		_OcclusionStrength("Occlusion Strength", Range( 0 , 1)) = 1
		_EmissionMap("Emission Map", 2D) = "white" {}
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		_SubsurfaceMaskMap("Subsurface Mask Map", 2D) = "white" {}
		_SubsurfaceMask("Subsurface Mask", Range( 0 , 2)) = 1
		_ThicknessMap("Transmission Map", 2D) = "white" {}
		_Thickness("Transmission", Range( 0 , 2)) = 1
		_DetailMask("Detail Mask", 2D) = "white" {}
		[Normal]_DetailNormalMap("Detail Normal Map", 2D) = "bump" {}
		_DetailNormalMapScale("Detail Normal Map Scale", Range( 0 , 2)) = 1
		_SubsurfaceFalloff("Subsurface Falloff", Color) = (1,1,1,0)
		[Toggle(BOOLEAN_USE_WRINKLE_ON)] BOOLEAN_USE_WRINKLE("Use Wrinkle", Float) = 0
		_WrinkleMaskSet1A("Wrinkle Mask Set 1A", 2D) = "black" {}
		_WrinkleMaskSet1B("Wrinkle Mask Set 1B", 2D) = "black" {}
		_WrinkleMaskSet2("Wrinkle Mask Set 2", 2D) = "black" {}
		_WrinkleMaskSet3("Wrinkle Mask Set 3", 2D) = "black" {}
		_WrinkleMaskSet123("Wrinkle Mask Set 123", 2D) = "black" {}
		_WrinkleDiffuseBlend1("Wrinkle Diffuse Blend 1", 2D) = "white" {}
		_WrinkleDiffuseBlend2("Wrinkle Diffuse Blend 2", 2D) = "white" {}
		_WrinkleDiffuseBlend3("Wrinkle Diffuse Blend 3", 2D) = "white" {}
		_WrinkleSmoothnessPack("Wrinkle Smoothness Pack", 2D) = "gray" {}
		_WrinkleFlowPack("Wrinkle Flow Pack", 2D) = "white" {}
		[Normal]_WrinkleNormalBlend1("Wrinkle Normal Blend 1", 2D) = "bump" {}
		[Normal]_WrinkleNormalBlend2("Wrinkle Normal Blend 2", 2D) = "bump" {}
		[Normal]_WrinkleNormalBlend3("Wrinkle Normal Blend 3", 2D) = "bump" {}
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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);
			TEXTURE2D(_WrinkleDiffuseBlend1);
			SAMPLER(sampler_WrinkleDiffuseBlend1);
			TEXTURE2D(_WrinkleFlowPack);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleDiffuseBlend2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleDiffuseBlend3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_WrinkleNormalBlend1);
			TEXTURE2D(_WrinkleNormalBlend2);
			TEXTURE2D(_WrinkleNormalBlend3);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_DetailMask);
			TEXTURE2D(_EmissionMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_WrinkleSmoothnessPack);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_ThicknessMap);
			TEXTURE2D(_SubsurfaceMaskMap);


			half4 MinMaxDeltaBlend4181_g35( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half3 MinMaxDeltaBlend3183_g35( half3 In, half3 In1, half3 In2, half3 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half MinMaxDeltaBlend1182_g35( half In, half In1, half In2, half In3 )
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

				float2 uv_BaseMap = IN.ase_texcoord9.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				half4 diffuseMap205 = tex2DNode145;
				half4 diffuse184_g35 = diffuseMap205;
				half4 In181_g35 = diffuse184_g35;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowPack = IN.ase_texcoord9.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g35 = IN.ase_texcoord9.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g37 = 0.49;
				half leftMask27_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g37 ) / ( 0.51 - temp_output_1_0_g37 ) ) );
				half4 break107_g35 = _WrinkleValueSet12CL;
				half2 appendResult112_g35 = (half2(break107_g35.x , break107_g35.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord9.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g35 = (half2(break109_g35.x , break109_g35.y));
				half dotResult121_g35 = dot( appendResult112_g35 , appendResult115_g35 );
				half value1CLeft135_g35 = dotResult121_g35;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord9.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g35 = dot( _WrinkleValueSet1AL , maskSet1A214_g35 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord9.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g35 = dot( _WrinkleValueSet1BL , temp_output_16_0_g35 );
				half dotResult30_g35 = dot( maskSet1A214_g35 , _WrinkleValueSet1AR );
				half dotResult36_g35 = dot( temp_output_16_0_g35 , _WrinkleValueSet1BR );
				half4 break108_g35 = _WrinkleValueSet12CR;
				half2 appendResult117_g35 = (half2(break108_g35.x , break108_g35.y));
				half dotResult122_g35 = dot( appendResult115_g35 , appendResult117_g35 );
				half value1CRight136_g35 = dotResult122_g35;
				half temp_output_1_0_g36 = 0.51;
				half rightMask28_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g36 ) / ( 0.49 - temp_output_1_0_g36 ) ) );
				half temp_output_16_0_g76 = ( ( leftMask27_g35 * ( value1CLeft135_g35 + dotResult29_g35 + dotResult35_g35 ) ) + ( ( dotResult30_g35 + dotResult36_g35 + value1CRight136_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g76 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g76 ) ) * temp_output_16_0_g76 );
				half4 In1181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g35 ) * temp_output_23_0_g76 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				half2 appendResult113_g35 = (half2(break107_g35.z , break107_g35.w));
				half2 appendResult114_g35 = (half2(break109_g35.z , break109_g35.w));
				half dotResult123_g35 = dot( appendResult113_g35 , appendResult114_g35 );
				half value2CLeft137_g35 = dotResult123_g35;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord9.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g35 = dot( _WrinkleValueSet2L , temp_output_17_0_g35 );
				half dotResult42_g35 = dot( temp_output_17_0_g35 , _WrinkleValueSet2R );
				half2 appendResult116_g35 = (half2(break108_g35.z , break108_g35.w));
				half dotResult124_g35 = dot( appendResult114_g35 , appendResult116_g35 );
				half value2CRight138_g35 = dotResult124_g35;
				half temp_output_16_0_g77 = ( ( leftMask27_g35 * ( value2CLeft137_g35 + dotResult41_g35 ) ) + ( ( dotResult42_g35 + value2CRight138_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g77 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g77 ) ) * temp_output_16_0_g77 );
				half4 In2181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g35 ) * temp_output_23_0_g77 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				half4 break211_g35 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g35 = ( break211_g35.x * maskSet1A214_g35.y );
				half4 break118_g35 = _WrinkleValueSet3DB;
				half2 appendResult120_g35 = (half2(break118_g35.x , break118_g35.y));
				half dotResult127_g35 = dot( appendResult120_g35 , appendResult115_g35 );
				half value3DLeft129_g35 = dotResult127_g35;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord9.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g35 = dot( _WrinkleValueSet3L , temp_output_18_0_g35 );
				half dotResult48_g35 = dot( temp_output_18_0_g35 , _WrinkleValueSet3R );
				half2 appendResult119_g35 = (half2(break118_g35.z , break118_g35.w));
				half dotResult128_g35 = dot( appendResult115_g35 , appendResult119_g35 );
				half value3DRight130_g35 = dotResult128_g35;
				half valueBCCRight219_g35 = ( maskSet1A214_g35.y * break211_g35.y );
				half temp_output_16_0_g75 = ( ( leftMask27_g35 * ( valueBCCLeft217_g35 + value3DLeft129_g35 + dotResult47_g35 ) ) + ( ( dotResult48_g35 + value3DRight130_g35 + valueBCCRight219_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g75 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g75 ) ) * temp_output_16_0_g75 );
				half4 In3181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g35 ) * temp_output_23_0_g75 );
				half4 localMinMaxDeltaBlend4181_g35 = MinMaxDeltaBlend4181_g35( In181_g35 , In1181_g35 , In2181_g35 , In3181_g35 );
				half4 diffuseWrinkle215 = localMinMaxDeltaBlend4181_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch242 = diffuseWrinkle215;
				#else
				half4 staticSwitch242 = diffuseMap205;
				#endif
				half4 baseColor200 = ( _BaseColor * staticSwitch242 );
				
				float2 uv_BumpMap = IN.ase_texcoord9.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				half normalMapScale260 = _BumpScale;
				half3 unpack146 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, uv_BumpMap ), normalMapScale260 );
				unpack146.z = lerp( 1, unpack146.z, saturate(normalMapScale260) );
				half3 normalMap206 = unpack146;
				half3 normal186_g35 = normalMap206;
				half3 In183_g35 = normal186_g35;
				float2 uv_WrinkleNormalBlend1 = IN.ase_texcoord9.xy * _WrinkleNormalBlend1_ST.xy + _WrinkleNormalBlend1_ST.zw;
				half3 unpack239 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend1, sampler_BumpMap, uv_WrinkleNormalBlend1 ), normalMapScale260 );
				unpack239.z = lerp( 1, unpack239.z, saturate(normalMapScale260) );
				half3 In1183_g35 = ( ( unpack239 - normal186_g35 ) * temp_output_23_0_g76 );
				float2 uv_WrinkleNormalBlend2 = IN.ase_texcoord9.xy * _WrinkleNormalBlend2_ST.xy + _WrinkleNormalBlend2_ST.zw;
				half3 unpack240 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend2, sampler_BumpMap, uv_WrinkleNormalBlend2 ), normalMapScale260 );
				unpack240.z = lerp( 1, unpack240.z, saturate(normalMapScale260) );
				half3 In2183_g35 = ( ( unpack240 - normal186_g35 ) * temp_output_23_0_g77 );
				float2 uv_WrinkleNormalBlend3 = IN.ase_texcoord9.xy * _WrinkleNormalBlend3_ST.xy + _WrinkleNormalBlend3_ST.zw;
				half3 unpack241 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend3, sampler_BumpMap, uv_WrinkleNormalBlend3 ), normalMapScale260 );
				unpack241.z = lerp( 1, unpack241.z, saturate(normalMapScale260) );
				half3 In3183_g35 = ( ( unpack241 - normal186_g35 ) * temp_output_23_0_g75 );
				half3 localMinMaxDeltaBlend3183_g35 = MinMaxDeltaBlend3183_g35( In183_g35 , In1183_g35 , In2183_g35 , In3183_g35 );
				half3 normalWrinkle217 = localMinMaxDeltaBlend3183_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half3 staticSwitch246 = normalWrinkle217;
				#else
				half3 staticSwitch246 = normalMap206;
				#endif
				float2 uv_DetailNormalMap = IN.ase_texcoord9.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
				float2 uv_DetailMask = IN.ase_texcoord9.xy * _DetailMask_ST.xy + _DetailMask_ST.zw;
				half3 unpack148 = UnpackNormalScale( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_BumpMap, uv_DetailNormalMap ), ( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g ) );
				unpack148.z = lerp( 1, unpack148.z, saturate(( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g )) );
				
				float2 uv_EmissionMap = IN.ase_texcoord9.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				float2 uv_MetallicGlossMap = IN.ase_texcoord9.xy * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
				half4 tex2DNode150 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_Linear_Repeat, uv_MetallicGlossMap );
				
				half smoothnessMap207 = tex2DNode150.a;
				half smoothness185_g35 = smoothnessMap207;
				half In182_g35 = smoothness185_g35;
				float2 uv_WrinkleSmoothnessPack = IN.ase_texcoord9.xy * _WrinkleSmoothnessPack_ST.xy + _WrinkleSmoothnessPack_ST.zw;
				half4 tex2DNode235 = SAMPLE_TEXTURE2D( _WrinkleSmoothnessPack, sampler_Linear_Repeat, uv_WrinkleSmoothnessPack );
				half In1182_g35 = ( ( tex2DNode235.r - smoothness185_g35 ) * temp_output_23_0_g76 );
				half In2182_g35 = ( ( tex2DNode235.g - smoothness185_g35 ) * temp_output_23_0_g77 );
				half In3182_g35 = ( ( tex2DNode235.b - smoothness185_g35 ) * temp_output_23_0_g75 );
				half localMinMaxDeltaBlend1182_g35 = MinMaxDeltaBlend1182_g35( In182_g35 , In1182_g35 , In2182_g35 , In3182_g35 );
				half smoothnessWrinkle216 = localMinMaxDeltaBlend1182_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half staticSwitch249 = smoothnessWrinkle216;
				#else
				half staticSwitch249 = smoothnessMap207;
				#endif
				
				float2 uv_OcclusionMap = IN.ase_texcoord9.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				
				float2 uv_ThicknessMap = IN.ase_texcoord9.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				half4 temp_output_203_0 = ( _SubsurfaceFalloff * baseColor200 );
				
				float2 uv_SubsurfaceMaskMap = IN.ase_texcoord9.xy * _SubsurfaceMaskMap_ST.xy + _SubsurfaceMaskMap_ST.zw;
				

				float3 BaseColor = baseColor200.rgb;
				float3 Normal = BlendNormal( staticSwitch246 , unpack148 );
				float3 Emission = ( SAMPLE_TEXTURE2D( _EmissionMap, sampler_BaseMap, uv_EmissionMap ) * _EmissiveColor ).rgb;
				float3 Specular = 0.5;
				float Metallic = ( _Metallic * tex2DNode150.g );
				float Smoothness = ( staticSwitch249 * _Smoothness );
				float Occlusion = ( 1.0 - ( _OcclusionStrength * ( 1.0 - SAMPLE_TEXTURE2D( _OcclusionMap, sampler_Linear_Repeat, uv_OcclusionMap ).g ) ) );
				float Alpha = tex2DNode145.a;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = ( _Thickness * SAMPLE_TEXTURE2D( _ThicknessMap, sampler_Linear_Repeat, uv_ThicknessMap ) * temp_output_203_0 ).rgb;
				float3 Translucency = ( _SubsurfaceMask * 0.5 * SAMPLE_TEXTURE2D( _SubsurfaceMaskMap, sampler_Linear_Repeat, uv_SubsurfaceMaskMap ) * temp_output_203_0 ).rgb;

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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);


			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

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

				float2 uv_BaseMap = IN.ase_texcoord3.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				

				float Alpha = tex2DNode145.a;
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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

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

				float2 uv_BaseMap = IN.ase_texcoord3.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				

				float Alpha = tex2DNode145.a;
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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);
			TEXTURE2D(_WrinkleDiffuseBlend1);
			SAMPLER(sampler_WrinkleDiffuseBlend1);
			TEXTURE2D(_WrinkleFlowPack);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleDiffuseBlend2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleDiffuseBlend3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_EmissionMap);


			half4 MinMaxDeltaBlend4181_g35( half4 In, half4 In1, half4 In2, half4 In3 )
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

				float2 uv_BaseMap = IN.ase_texcoord4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				half4 diffuseMap205 = tex2DNode145;
				half4 diffuse184_g35 = diffuseMap205;
				half4 In181_g35 = diffuse184_g35;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord4.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowPack = IN.ase_texcoord4.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g35 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g37 = 0.49;
				half leftMask27_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g37 ) / ( 0.51 - temp_output_1_0_g37 ) ) );
				half4 break107_g35 = _WrinkleValueSet12CL;
				half2 appendResult112_g35 = (half2(break107_g35.x , break107_g35.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord4.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g35 = (half2(break109_g35.x , break109_g35.y));
				half dotResult121_g35 = dot( appendResult112_g35 , appendResult115_g35 );
				half value1CLeft135_g35 = dotResult121_g35;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord4.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g35 = dot( _WrinkleValueSet1AL , maskSet1A214_g35 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord4.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g35 = dot( _WrinkleValueSet1BL , temp_output_16_0_g35 );
				half dotResult30_g35 = dot( maskSet1A214_g35 , _WrinkleValueSet1AR );
				half dotResult36_g35 = dot( temp_output_16_0_g35 , _WrinkleValueSet1BR );
				half4 break108_g35 = _WrinkleValueSet12CR;
				half2 appendResult117_g35 = (half2(break108_g35.x , break108_g35.y));
				half dotResult122_g35 = dot( appendResult115_g35 , appendResult117_g35 );
				half value1CRight136_g35 = dotResult122_g35;
				half temp_output_1_0_g36 = 0.51;
				half rightMask28_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g36 ) / ( 0.49 - temp_output_1_0_g36 ) ) );
				half temp_output_16_0_g76 = ( ( leftMask27_g35 * ( value1CLeft135_g35 + dotResult29_g35 + dotResult35_g35 ) ) + ( ( dotResult30_g35 + dotResult36_g35 + value1CRight136_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g76 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g76 ) ) * temp_output_16_0_g76 );
				half4 In1181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g35 ) * temp_output_23_0_g76 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord4.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				half2 appendResult113_g35 = (half2(break107_g35.z , break107_g35.w));
				half2 appendResult114_g35 = (half2(break109_g35.z , break109_g35.w));
				half dotResult123_g35 = dot( appendResult113_g35 , appendResult114_g35 );
				half value2CLeft137_g35 = dotResult123_g35;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord4.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g35 = dot( _WrinkleValueSet2L , temp_output_17_0_g35 );
				half dotResult42_g35 = dot( temp_output_17_0_g35 , _WrinkleValueSet2R );
				half2 appendResult116_g35 = (half2(break108_g35.z , break108_g35.w));
				half dotResult124_g35 = dot( appendResult114_g35 , appendResult116_g35 );
				half value2CRight138_g35 = dotResult124_g35;
				half temp_output_16_0_g77 = ( ( leftMask27_g35 * ( value2CLeft137_g35 + dotResult41_g35 ) ) + ( ( dotResult42_g35 + value2CRight138_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g77 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g77 ) ) * temp_output_16_0_g77 );
				half4 In2181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g35 ) * temp_output_23_0_g77 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord4.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				half4 break211_g35 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g35 = ( break211_g35.x * maskSet1A214_g35.y );
				half4 break118_g35 = _WrinkleValueSet3DB;
				half2 appendResult120_g35 = (half2(break118_g35.x , break118_g35.y));
				half dotResult127_g35 = dot( appendResult120_g35 , appendResult115_g35 );
				half value3DLeft129_g35 = dotResult127_g35;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord4.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g35 = dot( _WrinkleValueSet3L , temp_output_18_0_g35 );
				half dotResult48_g35 = dot( temp_output_18_0_g35 , _WrinkleValueSet3R );
				half2 appendResult119_g35 = (half2(break118_g35.z , break118_g35.w));
				half dotResult128_g35 = dot( appendResult115_g35 , appendResult119_g35 );
				half value3DRight130_g35 = dotResult128_g35;
				half valueBCCRight219_g35 = ( maskSet1A214_g35.y * break211_g35.y );
				half temp_output_16_0_g75 = ( ( leftMask27_g35 * ( valueBCCLeft217_g35 + value3DLeft129_g35 + dotResult47_g35 ) ) + ( ( dotResult48_g35 + value3DRight130_g35 + valueBCCRight219_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g75 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g75 ) ) * temp_output_16_0_g75 );
				half4 In3181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g35 ) * temp_output_23_0_g75 );
				half4 localMinMaxDeltaBlend4181_g35 = MinMaxDeltaBlend4181_g35( In181_g35 , In1181_g35 , In2181_g35 , In3181_g35 );
				half4 diffuseWrinkle215 = localMinMaxDeltaBlend4181_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch242 = diffuseWrinkle215;
				#else
				half4 staticSwitch242 = diffuseMap205;
				#endif
				half4 baseColor200 = ( _BaseColor * staticSwitch242 );
				
				float2 uv_EmissionMap = IN.ase_texcoord4.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				

				float3 BaseColor = baseColor200.rgb;
				float3 Emission = ( SAMPLE_TEXTURE2D( _EmissionMap, sampler_BaseMap, uv_EmissionMap ) * _EmissiveColor ).rgb;
				float Alpha = tex2DNode145.a;
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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);
			TEXTURE2D(_WrinkleDiffuseBlend1);
			SAMPLER(sampler_WrinkleDiffuseBlend1);
			TEXTURE2D(_WrinkleFlowPack);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleDiffuseBlend2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleDiffuseBlend3);
			TEXTURE2D(_WrinkleMaskSet3);


			half4 MinMaxDeltaBlend4181_g35( half4 In, half4 In1, half4 In2, half4 In3 )
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

				float2 uv_BaseMap = IN.ase_texcoord2.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				half4 diffuseMap205 = tex2DNode145;
				half4 diffuse184_g35 = diffuseMap205;
				half4 In181_g35 = diffuse184_g35;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowPack = IN.ase_texcoord2.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g35 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g37 = 0.49;
				half leftMask27_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g37 ) / ( 0.51 - temp_output_1_0_g37 ) ) );
				half4 break107_g35 = _WrinkleValueSet12CL;
				half2 appendResult112_g35 = (half2(break107_g35.x , break107_g35.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord2.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g35 = (half2(break109_g35.x , break109_g35.y));
				half dotResult121_g35 = dot( appendResult112_g35 , appendResult115_g35 );
				half value1CLeft135_g35 = dotResult121_g35;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord2.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g35 = dot( _WrinkleValueSet1AL , maskSet1A214_g35 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord2.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g35 = dot( _WrinkleValueSet1BL , temp_output_16_0_g35 );
				half dotResult30_g35 = dot( maskSet1A214_g35 , _WrinkleValueSet1AR );
				half dotResult36_g35 = dot( temp_output_16_0_g35 , _WrinkleValueSet1BR );
				half4 break108_g35 = _WrinkleValueSet12CR;
				half2 appendResult117_g35 = (half2(break108_g35.x , break108_g35.y));
				half dotResult122_g35 = dot( appendResult115_g35 , appendResult117_g35 );
				half value1CRight136_g35 = dotResult122_g35;
				half temp_output_1_0_g36 = 0.51;
				half rightMask28_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g36 ) / ( 0.49 - temp_output_1_0_g36 ) ) );
				half temp_output_16_0_g76 = ( ( leftMask27_g35 * ( value1CLeft135_g35 + dotResult29_g35 + dotResult35_g35 ) ) + ( ( dotResult30_g35 + dotResult36_g35 + value1CRight136_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g76 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g76 ) ) * temp_output_16_0_g76 );
				half4 In1181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g35 ) * temp_output_23_0_g76 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				half2 appendResult113_g35 = (half2(break107_g35.z , break107_g35.w));
				half2 appendResult114_g35 = (half2(break109_g35.z , break109_g35.w));
				half dotResult123_g35 = dot( appendResult113_g35 , appendResult114_g35 );
				half value2CLeft137_g35 = dotResult123_g35;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord2.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g35 = dot( _WrinkleValueSet2L , temp_output_17_0_g35 );
				half dotResult42_g35 = dot( temp_output_17_0_g35 , _WrinkleValueSet2R );
				half2 appendResult116_g35 = (half2(break108_g35.z , break108_g35.w));
				half dotResult124_g35 = dot( appendResult114_g35 , appendResult116_g35 );
				half value2CRight138_g35 = dotResult124_g35;
				half temp_output_16_0_g77 = ( ( leftMask27_g35 * ( value2CLeft137_g35 + dotResult41_g35 ) ) + ( ( dotResult42_g35 + value2CRight138_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g77 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g77 ) ) * temp_output_16_0_g77 );
				half4 In2181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g35 ) * temp_output_23_0_g77 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				half4 break211_g35 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g35 = ( break211_g35.x * maskSet1A214_g35.y );
				half4 break118_g35 = _WrinkleValueSet3DB;
				half2 appendResult120_g35 = (half2(break118_g35.x , break118_g35.y));
				half dotResult127_g35 = dot( appendResult120_g35 , appendResult115_g35 );
				half value3DLeft129_g35 = dotResult127_g35;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord2.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g35 = dot( _WrinkleValueSet3L , temp_output_18_0_g35 );
				half dotResult48_g35 = dot( temp_output_18_0_g35 , _WrinkleValueSet3R );
				half2 appendResult119_g35 = (half2(break118_g35.z , break118_g35.w));
				half dotResult128_g35 = dot( appendResult115_g35 , appendResult119_g35 );
				half value3DRight130_g35 = dotResult128_g35;
				half valueBCCRight219_g35 = ( maskSet1A214_g35.y * break211_g35.y );
				half temp_output_16_0_g75 = ( ( leftMask27_g35 * ( valueBCCLeft217_g35 + value3DLeft129_g35 + dotResult47_g35 ) ) + ( ( dotResult48_g35 + value3DRight130_g35 + valueBCCRight219_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g75 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g75 ) ) * temp_output_16_0_g75 );
				half4 In3181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g35 ) * temp_output_23_0_g75 );
				half4 localMinMaxDeltaBlend4181_g35 = MinMaxDeltaBlend4181_g35( In181_g35 , In1181_g35 , In2181_g35 , In3181_g35 );
				half4 diffuseWrinkle215 = localMinMaxDeltaBlend4181_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch242 = diffuseWrinkle215;
				#else
				half4 staticSwitch242 = diffuseMap205;
				#endif
				half4 baseColor200 = ( _BaseColor * staticSwitch242 );
				

				float3 BaseColor = baseColor200.rgb;
				float Alpha = tex2DNode145.a;
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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_WrinkleNormalBlend1);
			TEXTURE2D(_WrinkleFlowPack);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleNormalBlend2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleNormalBlend3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_DetailMask);
			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);


			half3 MinMaxDeltaBlend3183_g35( half3 In, half3 In1, half3 In2, half3 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
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

				float2 uv_BumpMap = IN.ase_texcoord5.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				half normalMapScale260 = _BumpScale;
				half3 unpack146 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, uv_BumpMap ), normalMapScale260 );
				unpack146.z = lerp( 1, unpack146.z, saturate(normalMapScale260) );
				half3 normalMap206 = unpack146;
				half3 normal186_g35 = normalMap206;
				half3 In183_g35 = normal186_g35;
				float2 uv_WrinkleNormalBlend1 = IN.ase_texcoord5.xy * _WrinkleNormalBlend1_ST.xy + _WrinkleNormalBlend1_ST.zw;
				half3 unpack239 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend1, sampler_BumpMap, uv_WrinkleNormalBlend1 ), normalMapScale260 );
				unpack239.z = lerp( 1, unpack239.z, saturate(normalMapScale260) );
				float2 uv_WrinkleFlowPack = IN.ase_texcoord5.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g35 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g37 = 0.49;
				half leftMask27_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g37 ) / ( 0.51 - temp_output_1_0_g37 ) ) );
				half4 break107_g35 = _WrinkleValueSet12CL;
				half2 appendResult112_g35 = (half2(break107_g35.x , break107_g35.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord5.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g35 = (half2(break109_g35.x , break109_g35.y));
				half dotResult121_g35 = dot( appendResult112_g35 , appendResult115_g35 );
				half value1CLeft135_g35 = dotResult121_g35;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord5.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g35 = dot( _WrinkleValueSet1AL , maskSet1A214_g35 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord5.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g35 = dot( _WrinkleValueSet1BL , temp_output_16_0_g35 );
				half dotResult30_g35 = dot( maskSet1A214_g35 , _WrinkleValueSet1AR );
				half dotResult36_g35 = dot( temp_output_16_0_g35 , _WrinkleValueSet1BR );
				half4 break108_g35 = _WrinkleValueSet12CR;
				half2 appendResult117_g35 = (half2(break108_g35.x , break108_g35.y));
				half dotResult122_g35 = dot( appendResult115_g35 , appendResult117_g35 );
				half value1CRight136_g35 = dotResult122_g35;
				half temp_output_1_0_g36 = 0.51;
				half rightMask28_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g36 ) / ( 0.49 - temp_output_1_0_g36 ) ) );
				half temp_output_16_0_g76 = ( ( leftMask27_g35 * ( value1CLeft135_g35 + dotResult29_g35 + dotResult35_g35 ) ) + ( ( dotResult30_g35 + dotResult36_g35 + value1CRight136_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g76 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g76 ) ) * temp_output_16_0_g76 );
				half3 In1183_g35 = ( ( unpack239 - normal186_g35 ) * temp_output_23_0_g76 );
				float2 uv_WrinkleNormalBlend2 = IN.ase_texcoord5.xy * _WrinkleNormalBlend2_ST.xy + _WrinkleNormalBlend2_ST.zw;
				half3 unpack240 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend2, sampler_BumpMap, uv_WrinkleNormalBlend2 ), normalMapScale260 );
				unpack240.z = lerp( 1, unpack240.z, saturate(normalMapScale260) );
				half2 appendResult113_g35 = (half2(break107_g35.z , break107_g35.w));
				half2 appendResult114_g35 = (half2(break109_g35.z , break109_g35.w));
				half dotResult123_g35 = dot( appendResult113_g35 , appendResult114_g35 );
				half value2CLeft137_g35 = dotResult123_g35;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord5.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g35 = dot( _WrinkleValueSet2L , temp_output_17_0_g35 );
				half dotResult42_g35 = dot( temp_output_17_0_g35 , _WrinkleValueSet2R );
				half2 appendResult116_g35 = (half2(break108_g35.z , break108_g35.w));
				half dotResult124_g35 = dot( appendResult114_g35 , appendResult116_g35 );
				half value2CRight138_g35 = dotResult124_g35;
				half temp_output_16_0_g77 = ( ( leftMask27_g35 * ( value2CLeft137_g35 + dotResult41_g35 ) ) + ( ( dotResult42_g35 + value2CRight138_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g77 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g77 ) ) * temp_output_16_0_g77 );
				half3 In2183_g35 = ( ( unpack240 - normal186_g35 ) * temp_output_23_0_g77 );
				float2 uv_WrinkleNormalBlend3 = IN.ase_texcoord5.xy * _WrinkleNormalBlend3_ST.xy + _WrinkleNormalBlend3_ST.zw;
				half3 unpack241 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend3, sampler_BumpMap, uv_WrinkleNormalBlend3 ), normalMapScale260 );
				unpack241.z = lerp( 1, unpack241.z, saturate(normalMapScale260) );
				half4 break211_g35 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g35 = ( break211_g35.x * maskSet1A214_g35.y );
				half4 break118_g35 = _WrinkleValueSet3DB;
				half2 appendResult120_g35 = (half2(break118_g35.x , break118_g35.y));
				half dotResult127_g35 = dot( appendResult120_g35 , appendResult115_g35 );
				half value3DLeft129_g35 = dotResult127_g35;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord5.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g35 = dot( _WrinkleValueSet3L , temp_output_18_0_g35 );
				half dotResult48_g35 = dot( temp_output_18_0_g35 , _WrinkleValueSet3R );
				half2 appendResult119_g35 = (half2(break118_g35.z , break118_g35.w));
				half dotResult128_g35 = dot( appendResult115_g35 , appendResult119_g35 );
				half value3DRight130_g35 = dotResult128_g35;
				half valueBCCRight219_g35 = ( maskSet1A214_g35.y * break211_g35.y );
				half temp_output_16_0_g75 = ( ( leftMask27_g35 * ( valueBCCLeft217_g35 + value3DLeft129_g35 + dotResult47_g35 ) ) + ( ( dotResult48_g35 + value3DRight130_g35 + valueBCCRight219_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g75 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g75 ) ) * temp_output_16_0_g75 );
				half3 In3183_g35 = ( ( unpack241 - normal186_g35 ) * temp_output_23_0_g75 );
				half3 localMinMaxDeltaBlend3183_g35 = MinMaxDeltaBlend3183_g35( In183_g35 , In1183_g35 , In2183_g35 , In3183_g35 );
				half3 normalWrinkle217 = localMinMaxDeltaBlend3183_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half3 staticSwitch246 = normalWrinkle217;
				#else
				half3 staticSwitch246 = normalMap206;
				#endif
				float2 uv_DetailNormalMap = IN.ase_texcoord5.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
				float2 uv_DetailMask = IN.ase_texcoord5.xy * _DetailMask_ST.xy + _DetailMask_ST.zw;
				half3 unpack148 = UnpackNormalScale( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_BumpMap, uv_DetailNormalMap ), ( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g ) );
				unpack148.z = lerp( 1, unpack148.z, saturate(( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g )) );
				
				float2 uv_BaseMap = IN.ase_texcoord5.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				

				float3 Normal = BlendNormal( staticSwitch246 , unpack148 );
				float Alpha = tex2DNode145.a;
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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);
			TEXTURE2D(_WrinkleDiffuseBlend1);
			SAMPLER(sampler_WrinkleDiffuseBlend1);
			TEXTURE2D(_WrinkleFlowPack);
			SAMPLER(sampler_Linear_Repeat);
			TEXTURE2D(_WrinkleMaskSet123);
			TEXTURE2D(_WrinkleMaskSet1A);
			TEXTURE2D(_WrinkleMaskSet1B);
			TEXTURE2D(_WrinkleDiffuseBlend2);
			TEXTURE2D(_WrinkleMaskSet2);
			TEXTURE2D(_WrinkleDiffuseBlend3);
			TEXTURE2D(_WrinkleMaskSet3);
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_BumpMap);
			TEXTURE2D(_WrinkleNormalBlend1);
			TEXTURE2D(_WrinkleNormalBlend2);
			TEXTURE2D(_WrinkleNormalBlend3);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_DetailMask);
			TEXTURE2D(_EmissionMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_WrinkleSmoothnessPack);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_ThicknessMap);
			TEXTURE2D(_SubsurfaceMaskMap);


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			half4 MinMaxDeltaBlend4181_g35( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half3 MinMaxDeltaBlend3183_g35( half3 In, half3 In1, half3 In2, half3 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half MinMaxDeltaBlend1182_g35( half In, half In1, half In2, half In3 )
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

				float2 uv_BaseMap = IN.ase_texcoord9.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				half4 diffuseMap205 = tex2DNode145;
				half4 diffuse184_g35 = diffuseMap205;
				half4 In181_g35 = diffuse184_g35;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowPack = IN.ase_texcoord9.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g35 = IN.ase_texcoord9.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g37 = 0.49;
				half leftMask27_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g37 ) / ( 0.51 - temp_output_1_0_g37 ) ) );
				half4 break107_g35 = _WrinkleValueSet12CL;
				half2 appendResult112_g35 = (half2(break107_g35.x , break107_g35.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord9.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g35 = (half2(break109_g35.x , break109_g35.y));
				half dotResult121_g35 = dot( appendResult112_g35 , appendResult115_g35 );
				half value1CLeft135_g35 = dotResult121_g35;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord9.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g35 = dot( _WrinkleValueSet1AL , maskSet1A214_g35 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord9.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g35 = dot( _WrinkleValueSet1BL , temp_output_16_0_g35 );
				half dotResult30_g35 = dot( maskSet1A214_g35 , _WrinkleValueSet1AR );
				half dotResult36_g35 = dot( temp_output_16_0_g35 , _WrinkleValueSet1BR );
				half4 break108_g35 = _WrinkleValueSet12CR;
				half2 appendResult117_g35 = (half2(break108_g35.x , break108_g35.y));
				half dotResult122_g35 = dot( appendResult115_g35 , appendResult117_g35 );
				half value1CRight136_g35 = dotResult122_g35;
				half temp_output_1_0_g36 = 0.51;
				half rightMask28_g35 = saturate( ( ( texCoord10_g35.x - temp_output_1_0_g36 ) / ( 0.49 - temp_output_1_0_g36 ) ) );
				half temp_output_16_0_g76 = ( ( leftMask27_g35 * ( value1CLeft135_g35 + dotResult29_g35 + dotResult35_g35 ) ) + ( ( dotResult30_g35 + dotResult36_g35 + value1CRight136_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g76 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g76 ) ) * temp_output_16_0_g76 );
				half4 In1181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g35 ) * temp_output_23_0_g76 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				half2 appendResult113_g35 = (half2(break107_g35.z , break107_g35.w));
				half2 appendResult114_g35 = (half2(break109_g35.z , break109_g35.w));
				half dotResult123_g35 = dot( appendResult113_g35 , appendResult114_g35 );
				half value2CLeft137_g35 = dotResult123_g35;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord9.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g35 = dot( _WrinkleValueSet2L , temp_output_17_0_g35 );
				half dotResult42_g35 = dot( temp_output_17_0_g35 , _WrinkleValueSet2R );
				half2 appendResult116_g35 = (half2(break108_g35.z , break108_g35.w));
				half dotResult124_g35 = dot( appendResult114_g35 , appendResult116_g35 );
				half value2CRight138_g35 = dotResult124_g35;
				half temp_output_16_0_g77 = ( ( leftMask27_g35 * ( value2CLeft137_g35 + dotResult41_g35 ) ) + ( ( dotResult42_g35 + value2CRight138_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g77 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g77 ) ) * temp_output_16_0_g77 );
				half4 In2181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g35 ) * temp_output_23_0_g77 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord9.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				half4 break211_g35 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g35 = ( break211_g35.x * maskSet1A214_g35.y );
				half4 break118_g35 = _WrinkleValueSet3DB;
				half2 appendResult120_g35 = (half2(break118_g35.x , break118_g35.y));
				half dotResult127_g35 = dot( appendResult120_g35 , appendResult115_g35 );
				half value3DLeft129_g35 = dotResult127_g35;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord9.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g35 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g35 = dot( _WrinkleValueSet3L , temp_output_18_0_g35 );
				half dotResult48_g35 = dot( temp_output_18_0_g35 , _WrinkleValueSet3R );
				half2 appendResult119_g35 = (half2(break118_g35.z , break118_g35.w));
				half dotResult128_g35 = dot( appendResult115_g35 , appendResult119_g35 );
				half value3DRight130_g35 = dotResult128_g35;
				half valueBCCRight219_g35 = ( maskSet1A214_g35.y * break211_g35.y );
				half temp_output_16_0_g75 = ( ( leftMask27_g35 * ( valueBCCLeft217_g35 + value3DLeft129_g35 + dotResult47_g35 ) ) + ( ( dotResult48_g35 + value3DRight130_g35 + valueBCCRight219_g35 ) * rightMask28_g35 ) );
				half temp_output_23_0_g75 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g75 ) ) * temp_output_16_0_g75 );
				half4 In3181_g35 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g35 ) * temp_output_23_0_g75 );
				half4 localMinMaxDeltaBlend4181_g35 = MinMaxDeltaBlend4181_g35( In181_g35 , In1181_g35 , In2181_g35 , In3181_g35 );
				half4 diffuseWrinkle215 = localMinMaxDeltaBlend4181_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch242 = diffuseWrinkle215;
				#else
				half4 staticSwitch242 = diffuseMap205;
				#endif
				half4 baseColor200 = ( _BaseColor * staticSwitch242 );
				
				float2 uv_BumpMap = IN.ase_texcoord9.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				half normalMapScale260 = _BumpScale;
				half3 unpack146 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, uv_BumpMap ), normalMapScale260 );
				unpack146.z = lerp( 1, unpack146.z, saturate(normalMapScale260) );
				half3 normalMap206 = unpack146;
				half3 normal186_g35 = normalMap206;
				half3 In183_g35 = normal186_g35;
				float2 uv_WrinkleNormalBlend1 = IN.ase_texcoord9.xy * _WrinkleNormalBlend1_ST.xy + _WrinkleNormalBlend1_ST.zw;
				half3 unpack239 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend1, sampler_BumpMap, uv_WrinkleNormalBlend1 ), normalMapScale260 );
				unpack239.z = lerp( 1, unpack239.z, saturate(normalMapScale260) );
				half3 In1183_g35 = ( ( unpack239 - normal186_g35 ) * temp_output_23_0_g76 );
				float2 uv_WrinkleNormalBlend2 = IN.ase_texcoord9.xy * _WrinkleNormalBlend2_ST.xy + _WrinkleNormalBlend2_ST.zw;
				half3 unpack240 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend2, sampler_BumpMap, uv_WrinkleNormalBlend2 ), normalMapScale260 );
				unpack240.z = lerp( 1, unpack240.z, saturate(normalMapScale260) );
				half3 In2183_g35 = ( ( unpack240 - normal186_g35 ) * temp_output_23_0_g77 );
				float2 uv_WrinkleNormalBlend3 = IN.ase_texcoord9.xy * _WrinkleNormalBlend3_ST.xy + _WrinkleNormalBlend3_ST.zw;
				half3 unpack241 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend3, sampler_BumpMap, uv_WrinkleNormalBlend3 ), normalMapScale260 );
				unpack241.z = lerp( 1, unpack241.z, saturate(normalMapScale260) );
				half3 In3183_g35 = ( ( unpack241 - normal186_g35 ) * temp_output_23_0_g75 );
				half3 localMinMaxDeltaBlend3183_g35 = MinMaxDeltaBlend3183_g35( In183_g35 , In1183_g35 , In2183_g35 , In3183_g35 );
				half3 normalWrinkle217 = localMinMaxDeltaBlend3183_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half3 staticSwitch246 = normalWrinkle217;
				#else
				half3 staticSwitch246 = normalMap206;
				#endif
				float2 uv_DetailNormalMap = IN.ase_texcoord9.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
				float2 uv_DetailMask = IN.ase_texcoord9.xy * _DetailMask_ST.xy + _DetailMask_ST.zw;
				half3 unpack148 = UnpackNormalScale( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_BumpMap, uv_DetailNormalMap ), ( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g ) );
				unpack148.z = lerp( 1, unpack148.z, saturate(( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g )) );
				
				float2 uv_EmissionMap = IN.ase_texcoord9.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				float2 uv_MetallicGlossMap = IN.ase_texcoord9.xy * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
				half4 tex2DNode150 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_Linear_Repeat, uv_MetallicGlossMap );
				
				half smoothnessMap207 = tex2DNode150.a;
				half smoothness185_g35 = smoothnessMap207;
				half In182_g35 = smoothness185_g35;
				float2 uv_WrinkleSmoothnessPack = IN.ase_texcoord9.xy * _WrinkleSmoothnessPack_ST.xy + _WrinkleSmoothnessPack_ST.zw;
				half4 tex2DNode235 = SAMPLE_TEXTURE2D( _WrinkleSmoothnessPack, sampler_Linear_Repeat, uv_WrinkleSmoothnessPack );
				half In1182_g35 = ( ( tex2DNode235.r - smoothness185_g35 ) * temp_output_23_0_g76 );
				half In2182_g35 = ( ( tex2DNode235.g - smoothness185_g35 ) * temp_output_23_0_g77 );
				half In3182_g35 = ( ( tex2DNode235.b - smoothness185_g35 ) * temp_output_23_0_g75 );
				half localMinMaxDeltaBlend1182_g35 = MinMaxDeltaBlend1182_g35( In182_g35 , In1182_g35 , In2182_g35 , In3182_g35 );
				half smoothnessWrinkle216 = localMinMaxDeltaBlend1182_g35;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half staticSwitch249 = smoothnessWrinkle216;
				#else
				half staticSwitch249 = smoothnessMap207;
				#endif
				
				float2 uv_OcclusionMap = IN.ase_texcoord9.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				
				float2 uv_ThicknessMap = IN.ase_texcoord9.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				half4 temp_output_203_0 = ( _SubsurfaceFalloff * baseColor200 );
				
				float2 uv_SubsurfaceMaskMap = IN.ase_texcoord9.xy * _SubsurfaceMaskMap_ST.xy + _SubsurfaceMaskMap_ST.zw;
				

				float3 BaseColor = baseColor200.rgb;
				float3 Normal = BlendNormal( staticSwitch246 , unpack148 );
				float3 Emission = ( SAMPLE_TEXTURE2D( _EmissionMap, sampler_BaseMap, uv_EmissionMap ) * _EmissiveColor ).rgb;
				float3 Specular = 0.5;
				float Metallic = ( _Metallic * tex2DNode150.g );
				float Smoothness = ( staticSwitch249 * _Smoothness );
				float Occlusion = ( 1.0 - ( _OcclusionStrength * ( 1.0 - SAMPLE_TEXTURE2D( _OcclusionMap, sampler_Linear_Repeat, uv_OcclusionMap ).g ) ) );
				float Alpha = tex2DNode145.a;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = ( _Thickness * SAMPLE_TEXTURE2D( _ThicknessMap, sampler_Linear_Repeat, uv_ThicknessMap ) * temp_output_203_0 ).rgb;
				float3 Translucency = ( _SubsurfaceMask * 0.5 * SAMPLE_TEXTURE2D( _SubsurfaceMaskMap, sampler_Linear_Repeat, uv_SubsurfaceMaskMap ) * temp_output_203_0 ).rgb;

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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);


			
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

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_BaseMap = IN.ase_texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				

				surfaceDescription.Alpha = tex2DNode145.a;
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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);


			
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

				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_BaseMap = IN.ase_texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				

				surfaceDescription.Alpha = tex2DNode145.a;
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
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
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
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float4 positionCSNoJitter : TEXCOORD0;
				float4 previousPositionCSNoJitter : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _BaseColor;
			half4 _WrinkleValueSet3L;
			half4 _WrinkleValueSet3R;
			half4 _BumpMap_ST;
			half4 _WrinkleNormalBlend1_ST;
			half4 _WrinkleNormalBlend2_ST;
			half4 _WrinkleNormalBlend3_ST;
			half4 _DetailNormalMap_ST;
			half4 _DetailMask_ST;
			half4 _EmissionMap_ST;
			half4 _EmissiveColor;
			half4 _MetallicGlossMap_ST;
			half4 _WrinkleSmoothnessPack_ST;
			half4 _OcclusionMap_ST;
			half4 _ThicknessMap_ST;
			half4 _SubsurfaceFalloff;
			half4 _WrinkleValueSet3DB;
			half4 _WrinkleValueSetBCCB;
			half4 _WrinkleMaskSet3_ST;
			half4 _WrinkleValueSet2R;
			half4 _BaseMap_ST;
			half4 _WrinkleDiffuseBlend1_ST;
			half4 _WrinkleFlowPack_ST;
			half4 _WrinkleValueSet12CL;
			half4 _WrinkleMaskSet123_ST;
			half4 _WrinkleValueSet1AL;
			half4 _WrinkleDiffuseBlend3_ST;
			half4 _WrinkleValueSet1BL;
			half4 _WrinkleMaskSet1A_ST;
			half4 _WrinkleValueSet1AR;
			half4 _WrinkleValueSet1BR;
			half4 _WrinkleValueSet12CR;
			half4 _WrinkleDiffuseBlend2_ST;
			half4 _WrinkleValueSet2L;
			half4 _WrinkleMaskSet2_ST;
			half4 _WrinkleMaskSet1B_ST;
			half4 _SubsurfaceMaskMap_ST;
			half _DetailNormalMapScale;
			half _Metallic;
			half _BumpScale;
			half _Smoothness;
			half _OcclusionStrength;
			half _Thickness;
			half _SubsurfaceMask;
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

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);


			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

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

				float2 uv_BaseMap = IN.ase_texcoord2.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				

				float Alpha = tex2DNode145.a;
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
Node;AmplifyShaderEditor.CommentaryNode;175;-2048.412,-1174.997;Inherit;False;1393.695;485.5302;Comment;10;243;242;244;245;187;205;145;173;200;174;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;145;-2020.05,-919.0184;Inherit;True;Property;_BaseMap;Base Map;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.WireNode;244;-1694.097,-735.3007;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;245;-1138.097,-738.3007;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;179;-1957.352,1265.129;Inherit;False;1317.193;315.5388;Comment;6;172;171;169;170;151;270;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;176;-2344.025,-646.5416;Inherit;False;1687.046;753.3652;Comment;13;267;266;146;153;260;247;246;206;148;156;154;147;155;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;178;-2089.727,686.485;Inherit;False;1442.611;509.4934;Comment;10;249;248;207;250;150;164;167;168;165;269;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;197;-1559.189,1656.15;Inherit;False;913.907;1038.226;Comment;11;271;195;192;194;190;202;204;203;193;196;189;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;177;-1520.374,146.5702;Inherit;False;867.2178;481.081;Comment;4;268;158;157;149;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;208;-5227.191,-362.0735;Inherit;False;2692.434;2067.956;;37;264;265;209;263;262;218;241;240;239;217;214;259;235;258;257;255;256;226;225;224;223;254;230;229;231;228;222;221;220;219;234;233;232;216;215;213;212;Wrinkle System;1,0.5137255,0.7779443,1;0;0
Node;AmplifyShaderEditor.WireNode;187;-700.4943,-757.2065;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;151;-1598.736,1343.848;Inherit;True;Property;_OcclusionMap;Occlusion Map;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;170;-1213.159,1462.129;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;169;-1286.159,1315.129;Inherit;False;Property;_OcclusionStrength;Occlusion Strength;8;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;171;-983.1591,1362.129;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;189;-1204.472,2201.485;Inherit;True;Property;_SubsurfaceMaskMap;Subsurface Mask Map;11;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;174;-1106.718,-959.6714;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;165;-1176.212,736.485;Inherit;False;Property;_Metallic;Metallic;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;149;-1225.574,196.5702;Inherit;True;Property;_EmissionMap;Emission Map;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;157;-1143.059,409.2514;Inherit;False;Property;_EmissiveColor;Emissive Color;10;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;172;-819.1592,1365.129;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;200;-873.5372,-915.8041;Inherit;False;baseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;196;-805.146,1767.444;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;168;-809.1151,939.4771;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;193;-795.4855,2096.271;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendNormalsNode;155;-884.9819,-486.3684;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;167;-809.7693,806.5468;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;158;-815.1556,326.2921;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;185;-148.3843,570.1794;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;183;-147.1609,632.9402;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;181;-146.0122,762.5016;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;180;-148.0205,826.4184;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;182;-148.0122,694.8321;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;199;-148.5999,1146.595;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;198;-147.6,1016.235;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;201;-146.3643,431.4894;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;184;-151.3843,503.1793;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;-990.6594,2406.68;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;204;-1189.659,2596.68;Inherit;False;200;baseColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;202;-1225.289,2401.942;Inherit;False;Property;_SubsurfaceFalloff;Subsurface Falloff;18;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;190;-1196.935,1821.459;Inherit;True;Property;_ThicknessMap;Transmission Map;13;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;194;-1187.487,2118.57;Inherit;False;Constant;_ConstTranslucencyWrap;Const Translucency Wrap;17;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;192;-1189.487,2033.771;Inherit;False;Property;_SubsurfaceMask;Subsurface Mask;12;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;195;-1176.749,1725.444;Inherit;False;Property;_Thickness;Transmission;14;0;Create;False;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;164;-1168.395,1048.658;Inherit;False;Property;_Smoothness;Smoothness;4;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;156;-1590.909,-183.6243;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;148;-1320.821,-160.8336;Inherit;True;Property;_DetailNormalMap;Detail Normal Map;16;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;212;-3633.453,-272.6874;Inherit;False;205;diffuseMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;213;-3664.157,-188.369;Inherit;False;207;smoothnessMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;215;-2820.068,-0.1314611;Inherit;False;diffuseWrinkle;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;216;-2840.068,113.8685;Inherit;False;smoothnessWrinkle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;173;-1447.125,-1126.06;Inherit;False;Property;_BaseColor;Base Color;1;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;243;-1702.559,-829.4495;Inherit;False;215;diffuseWrinkle;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;-1702.352,-918.171;Inherit;False;diffuseMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;206;-1554.783,-573.2359;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;150;-1796.198,841.0651;Inherit;True;Property;_MetallicGlossMap;Metallic Gloss Map;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.WireNode;250;-1366.734,831.6754;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;207;-1402.333,895.4883;Inherit;False;smoothnessMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;248;-1415.02,981.3398;Inherit;False;216;smoothnessWrinkle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;246;-1315.241,-538.8315;Inherit;False;Property;BOOLEAN_USE_WRINKLE1;Use Wrinkle;19;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Reference;242;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;242;-1483.33,-887.2023;Inherit;False;Property;BOOLEAN_USE_WRINKLE;Use Wrinkle;19;0;Create;False;0;0;0;False;0;False;1;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;249;-1164.089,921.2395;Inherit;False;Property;BOOLEAN_USE_WRINKLE2;Use Wrinkle;19;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Reference;242;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;232;-4774.097,177.4562;Inherit;True;Property;_WrinkleDiffuseBlend1;Wrinkle Diffuse Blend 1;25;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;233;-4472.926,251.5854;Inherit;True;Property;_WrinkleDiffuseBlend2;Wrinkle Diffuse Blend 2;26;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;234;-4165.393,343.3291;Inherit;True;Property;_WrinkleDiffuseBlend3;Wrinkle Diffuse Blend 3;27;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.Vector4Node;219;-4837.23,1378.069;Inherit;False;Property;_WrinkleValueSet2L;Wrinkle Value Set 2 Left;35;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;220;-4601.23,1444.069;Inherit;False;Property;_WrinkleValueSet3L;Wrinkle Value Set 3 Left;36;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;221;-4353.084,1376.926;Inherit;False;Property;_WrinkleValueSet2R;Wrinkle Value Set 2 Right;40;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;222;-4098.079,1429.926;Inherit;False;Property;_WrinkleValueSet3R;Wrinkle Value Set 3 Right;41;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;228;-4772.198,-244.6;Inherit;True;Property;_WrinkleMaskSet1A;Wrinkle Mask Set 1A;20;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;231;-4474.881,-151.9223;Inherit;True;Property;_WrinkleMaskSet1B;Wrinkle Mask Set 1B;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;229;-4780.048,-36.77882;Inherit;True;Property;_WrinkleMaskSet3;Wrinkle Mask Set 3;23;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;230;-4172.442,-72.15807;Inherit;True;Property;_WrinkleMaskSet2;Wrinkle Mask Set 2;22;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;254;-4476.941,49.68732;Inherit;True;Property;_WrinkleMaskSet123;Wrinkle Mask Set 123;24;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.Vector4Node;223;-4837.528,1195.359;Inherit;False;Property;_WrinkleValueSet1AL;Wrinkle Value Set 1A Left;33;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;224;-4602.528,1254.359;Inherit;False;Property;_WrinkleValueSet1BL;Wrinkle Value Set 1B Left;34;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;225;-4353.382,1194.214;Inherit;False;Property;_WrinkleValueSet1AR;Wrinkle Value Set 1A Right;38;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;226;-4097.377,1237.214;Inherit;False;Property;_WrinkleValueSet1BR;Wrinkle Value Set 1B Right;39;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;256;-3839.492,1157.241;Inherit;False;Property;_WrinkleValueSet12CL;Wrinkle Value Set 12C Left;37;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;255;-3838.751,1349.152;Inherit;False;Property;_WrinkleValueSet12CR;Wrinkle Value Set 12C Right;42;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;257;-3557.133,1236.652;Inherit;False;Property;_WrinkleValueSet3DB;Wrinkle Value Set 3D Both;43;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;258;-4164.708,548.8409;Inherit;True;Property;_WrinkleFlowPack;Wrinkle Flow Pack;29;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;235;-4478.629,464.2409;Inherit;True;Property;_WrinkleSmoothnessPack;Wrinkle Smoothness Pack;28;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;259;-3310.532,69.12341;Inherit;False;RL_Amplify_WrinkleMapSystem;-1;;35;d27d6ddfed52eb04ba4585a9fc285421;0;32;7;COLOR;0,0,0,0;False;8;FLOAT;0;False;9;FLOAT3;0,0,0;False;15;FLOAT4;0,0,0,0;False;16;FLOAT4;0,0,0,0;False;17;FLOAT4;0,0,0,0;False;18;FLOAT4;0,0,0,0;False;105;FLOAT4;0,0,0,0;False;67;COLOR;0,0,0,0;False;71;COLOR;0,0,0,0;False;76;COLOR;0,0,0,0;False;68;FLOAT;0;False;72;FLOAT;0;False;77;FLOAT;0;False;69;FLOAT3;0,0,0;False;73;FLOAT3;0,0,0;False;78;FLOAT3;0,0,0;False;151;FLOAT;0;False;155;FLOAT;0;False;156;FLOAT;0;False;19;FLOAT4;0,0,0,0;False;20;FLOAT4;0,0,0,0;False;23;FLOAT4;0,0,0,0;False;24;FLOAT4;0,0,0,0;False;103;FLOAT4;0,0,0,0;False;21;FLOAT4;0,0,0,0;False;22;FLOAT4;0,0,0,0;False;25;FLOAT4;0,0,0,0;False;26;FLOAT4;0,0,0,0;False;104;FLOAT4;0,0,0,0;False;106;FLOAT4;0,0,0,0;False;210;FLOAT4;0,0,0,0;False;3;FLOAT4;0;FLOAT;1;FLOAT3;6
Node;AmplifyShaderEditor.GetLocalVarNode;214;-3637.157,-105.3685;Inherit;False;206;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;217;-2825.068,223.8686;Inherit;False;normalWrinkle;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;247;-1552.476,-457.7025;Inherit;False;217;normalWrinkle;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;239;-4775.591,593.2079;Inherit;True;Property;_WrinkleNormalBlend1;Wrinkle Normal Blend 1;30;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;240;-4473.128,681.6926;Inherit;True;Property;_WrinkleNormalBlend2;Wrinkle Normal Blend 2;31;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;241;-4165.553,771.5837;Inherit;True;Property;_WrinkleNormalBlend3;Wrinkle Normal Blend 3;32;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;218;-5012.049,953.7258;Inherit;False;260;normalMapScale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;260;-2090.47,-349.2763;Inherit;False;normalMapScale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;153;-2319.361,-558.3536;Inherit;False;Property;_BumpScale;Bump Scale;6;0;Create;True;0;0;0;False;0;False;2;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;262;-3524.443,1423.349;Inherit;False;Property;_WrinkleValueSetBCCB;Wrinkle Value Set BCC Both;44;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;146;-1897.423,-570.9371;Inherit;True;Property;_BumpMap;Bump Map;5;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerStateNode;265;-5105.569,791.1652;Inherit;False;0;0;0;1;146;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.RangedFloatNode;154;-1961.9,-250.9704;Inherit;False;Property;_DetailNormalMapScale;Detail Normal Map Scale;17;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;147;-1974.621,-159.9799;Inherit;True;Property;_DetailMask;Detail Mask;15;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.WireNode;267;-1606.686,27.77925;Inherit;False;1;0;SAMPLERSTATE;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;266;-2252.554,1.739041;Inherit;False;0;0;0;1;146;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;268;-1490.765,407.1235;Inherit;False;0;0;0;1;145;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;269;-2051.663,953.273;Inherit;False;263;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;270;-1897.663,1393.273;Inherit;False;263;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;271;-1525.104,2060.805;Inherit;False;263;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;263;-5126.988,559.173;Inherit;False;mainSamplerState;-1;True;1;0;SAMPLERSTATE;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;264;-5167.798,353.022;Inherit;False;0;0;0;1;232;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;209;-5085.315,458.1609;Inherit;False;0;0;0;1;2;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-3.854388,596.494;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;299.4972,596.494;Half;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;Reallusion/Amplify/RL_HeadShaderWrinkle_Baked_URP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;44;Lighting Model;0;0;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;638577474875705968;Transmission;1;637781863003969542;  Transmission Shadow;0.5,False,;637782841107493989;Translucency;1;637781863019529545;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;Receive SSAO;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0,False,;0;  Type;0;0;  Tess;1,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;11;False;True;True;True;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;272;299.4972,676.494;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;273;299.4972,676.494;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;274;299.4972,696.494;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;244;0;145;4
WireConnection;245;0;244;0
WireConnection;187;0;245;0
WireConnection;151;7;270;0
WireConnection;170;0;151;2
WireConnection;171;0;169;0
WireConnection;171;1;170;0
WireConnection;189;7;271;0
WireConnection;174;0;173;0
WireConnection;174;1;242;0
WireConnection;149;7;268;0
WireConnection;172;0;171;0
WireConnection;200;0;174;0
WireConnection;196;0;195;0
WireConnection;196;1;190;0
WireConnection;196;2;203;0
WireConnection;168;0;249;0
WireConnection;168;1;164;0
WireConnection;193;0;192;0
WireConnection;193;1;194;0
WireConnection;193;2;189;0
WireConnection;193;3;203;0
WireConnection;155;0;246;0
WireConnection;155;1;148;0
WireConnection;167;0;165;0
WireConnection;167;1;250;0
WireConnection;158;0;149;0
WireConnection;158;1;157;0
WireConnection;185;0;187;0
WireConnection;183;0;158;0
WireConnection;181;0;168;0
WireConnection;180;0;172;0
WireConnection;182;0;167;0
WireConnection;199;0;193;0
WireConnection;198;0;196;0
WireConnection;201;0;200;0
WireConnection;184;0;155;0
WireConnection;203;0;202;0
WireConnection;203;1;204;0
WireConnection;190;7;271;0
WireConnection;156;0;154;0
WireConnection;156;1;147;2
WireConnection;148;5;156;0
WireConnection;148;7;267;0
WireConnection;215;0;259;0
WireConnection;216;0;259;1
WireConnection;205;0;145;0
WireConnection;206;0;146;0
WireConnection;150;7;269;0
WireConnection;250;0;150;2
WireConnection;207;0;150;4
WireConnection;246;1;206;0
WireConnection;246;0;247;0
WireConnection;242;1;205;0
WireConnection;242;0;243;0
WireConnection;249;1;207;0
WireConnection;249;0;248;0
WireConnection;232;7;264;0
WireConnection;233;7;264;0
WireConnection;234;7;264;0
WireConnection;228;7;209;0
WireConnection;231;7;209;0
WireConnection;229;7;209;0
WireConnection;230;7;209;0
WireConnection;254;7;209;0
WireConnection;258;7;209;0
WireConnection;235;7;209;0
WireConnection;259;7;212;0
WireConnection;259;8;213;0
WireConnection;259;9;214;0
WireConnection;259;15;228;0
WireConnection;259;16;231;0
WireConnection;259;17;230;0
WireConnection;259;18;229;0
WireConnection;259;105;254;0
WireConnection;259;67;232;0
WireConnection;259;71;233;0
WireConnection;259;76;234;0
WireConnection;259;68;235;1
WireConnection;259;72;235;2
WireConnection;259;77;235;3
WireConnection;259;69;239;0
WireConnection;259;73;240;0
WireConnection;259;78;241;0
WireConnection;259;151;258;1
WireConnection;259;155;258;2
WireConnection;259;156;258;3
WireConnection;259;19;223;0
WireConnection;259;20;224;0
WireConnection;259;23;219;0
WireConnection;259;24;220;0
WireConnection;259;103;256;0
WireConnection;259;21;225;0
WireConnection;259;22;226;0
WireConnection;259;25;221;0
WireConnection;259;26;222;0
WireConnection;259;104;255;0
WireConnection;259;106;257;0
WireConnection;259;210;262;0
WireConnection;217;0;259;6
WireConnection;239;5;218;0
WireConnection;239;7;265;0
WireConnection;240;5;218;0
WireConnection;240;7;265;0
WireConnection;241;5;218;0
WireConnection;241;7;265;0
WireConnection;260;0;153;0
WireConnection;146;5;260;0
WireConnection;147;7;266;0
WireConnection;267;0;266;0
WireConnection;263;0;209;0
WireConnection;1;0;201;0
WireConnection;1;1;184;0
WireConnection;1;2;183;0
WireConnection;1;3;182;0
WireConnection;1;4;181;0
WireConnection;1;5;180;0
WireConnection;1;6;185;0
WireConnection;1;14;198;0
WireConnection;1;15;199;0
ASEEND*/
//CHKSM=D001DA70AB12A24AB3AF9CC09F482FE3EDF371BD