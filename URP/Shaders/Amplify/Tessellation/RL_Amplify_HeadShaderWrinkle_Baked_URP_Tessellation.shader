// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Reallusion/Amplify/RL_HeadShaderWrinkle_Baked_URP_Tessellation"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin]_BaseMap("Base Map", 2D) = "white" {}
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
		_WrinkleFlowPack("Wrinkle Flow Pack", 2D) = "gray" {}
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
		[ASEEnd]_WrinkleValueSetBCCB("Wrinkle Value Set BCC Both", Vector) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		_TessEdgeLength ( "Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0
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
		#pragma target 4.6
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_LENGTH_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 101001
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
		

			

			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

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
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
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

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
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


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			half4 MinMaxDeltaBlend4181_g1( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half3 MinMaxDeltaBlend3183_g1( half3 In, half3 In1, half3 In2, half3 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half MinMaxDeltaBlend1182_g1( half In, half In1, half In2, half In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				
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
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				
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
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
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
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
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

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_BaseMap = IN.ase_texcoord7.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				half4 diffuseMap205 = tex2DNode145;
				half4 diffuse184_g1 = diffuseMap205;
				half4 In181_g1 = diffuse184_g1;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord7.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowPack = IN.ase_texcoord7.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g1 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g15 = 0.49;
				half leftMask27_g1 = saturate( ( ( texCoord10_g1.x - temp_output_1_0_g15 ) / ( 0.51 - temp_output_1_0_g15 ) ) );
				half4 break107_g1 = _WrinkleValueSet12CL;
				half2 appendResult112_g1 = (half2(break107_g1.x , break107_g1.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord7.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g1 = (half2(break109_g1.x , break109_g1.y));
				half dotResult121_g1 = dot( appendResult112_g1 , appendResult115_g1 );
				half value1CLeft135_g1 = dotResult121_g1;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord7.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g1 = dot( _WrinkleValueSet1AL , maskSet1A214_g1 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord7.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g1 = dot( _WrinkleValueSet1BL , temp_output_16_0_g1 );
				half dotResult30_g1 = dot( maskSet1A214_g1 , _WrinkleValueSet1AR );
				half dotResult36_g1 = dot( temp_output_16_0_g1 , _WrinkleValueSet1BR );
				half4 break108_g1 = _WrinkleValueSet12CR;
				half2 appendResult117_g1 = (half2(break108_g1.x , break108_g1.y));
				half dotResult122_g1 = dot( appendResult115_g1 , appendResult117_g1 );
				half value1CRight136_g1 = dotResult122_g1;
				half temp_output_1_0_g14 = 0.51;
				half rightMask28_g1 = saturate( ( ( texCoord10_g1.x - temp_output_1_0_g14 ) / ( 0.49 - temp_output_1_0_g14 ) ) );
				half temp_output_16_0_g70 = ( ( leftMask27_g1 * ( value1CLeft135_g1 + dotResult29_g1 + dotResult35_g1 ) ) + ( ( dotResult30_g1 + dotResult36_g1 + value1CRight136_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g70 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g70 ) ) * temp_output_16_0_g70 );
				half4 In1181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g1 ) * temp_output_23_0_g70 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord7.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				half2 appendResult113_g1 = (half2(break107_g1.z , break107_g1.w));
				half2 appendResult114_g1 = (half2(break109_g1.z , break109_g1.w));
				half dotResult123_g1 = dot( appendResult113_g1 , appendResult114_g1 );
				half value2CLeft137_g1 = dotResult123_g1;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord7.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g1 = dot( _WrinkleValueSet2L , temp_output_17_0_g1 );
				half dotResult42_g1 = dot( temp_output_17_0_g1 , _WrinkleValueSet2R );
				half2 appendResult116_g1 = (half2(break108_g1.z , break108_g1.w));
				half dotResult124_g1 = dot( appendResult114_g1 , appendResult116_g1 );
				half value2CRight138_g1 = dotResult124_g1;
				half temp_output_16_0_g71 = ( ( leftMask27_g1 * ( value2CLeft137_g1 + dotResult41_g1 ) ) + ( ( dotResult42_g1 + value2CRight138_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g71 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g71 ) ) * temp_output_16_0_g71 );
				half4 In2181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g1 ) * temp_output_23_0_g71 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord7.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				half4 break211_g1 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g1 = ( break211_g1.x * maskSet1A214_g1.y );
				half4 break118_g1 = _WrinkleValueSet3DB;
				half2 appendResult120_g1 = (half2(break118_g1.x , break118_g1.y));
				half dotResult127_g1 = dot( appendResult120_g1 , appendResult115_g1 );
				half value3DLeft129_g1 = dotResult127_g1;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord7.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g1 = dot( _WrinkleValueSet3L , temp_output_18_0_g1 );
				half dotResult48_g1 = dot( temp_output_18_0_g1 , _WrinkleValueSet3R );
				half2 appendResult119_g1 = (half2(break118_g1.z , break118_g1.w));
				half dotResult128_g1 = dot( appendResult115_g1 , appendResult119_g1 );
				half value3DRight130_g1 = dotResult128_g1;
				half valueBCCRight219_g1 = ( maskSet1A214_g1.y * break211_g1.y );
				half temp_output_16_0_g69 = ( ( leftMask27_g1 * ( valueBCCLeft217_g1 + value3DLeft129_g1 + dotResult47_g1 ) ) + ( ( dotResult48_g1 + value3DRight130_g1 + valueBCCRight219_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g69 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g69 ) ) * temp_output_16_0_g69 );
				half4 In3181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g1 ) * temp_output_23_0_g69 );
				half4 localMinMaxDeltaBlend4181_g1 = MinMaxDeltaBlend4181_g1( In181_g1 , In1181_g1 , In2181_g1 , In3181_g1 );
				half4 diffuseWrinkle215 = localMinMaxDeltaBlend4181_g1;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch242 = diffuseWrinkle215;
				#else
				half4 staticSwitch242 = diffuseMap205;
				#endif
				half4 baseColor200 = ( _BaseColor * staticSwitch242 );
				
				float2 uv_BumpMap = IN.ase_texcoord7.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				half normalMapScale259 = _BumpScale;
				half3 unpack146 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, uv_BumpMap ), normalMapScale259 );
				unpack146.z = lerp( 1, unpack146.z, saturate(normalMapScale259) );
				half3 normalMap206 = unpack146;
				half3 normal186_g1 = normalMap206;
				half3 In183_g1 = normal186_g1;
				float2 uv_WrinkleNormalBlend1 = IN.ase_texcoord7.xy * _WrinkleNormalBlend1_ST.xy + _WrinkleNormalBlend1_ST.zw;
				half3 unpack239 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend1, sampler_BumpMap, uv_WrinkleNormalBlend1 ), normalMapScale259 );
				unpack239.z = lerp( 1, unpack239.z, saturate(normalMapScale259) );
				half3 In1183_g1 = ( ( unpack239 - normal186_g1 ) * temp_output_23_0_g70 );
				float2 uv_WrinkleNormalBlend2 = IN.ase_texcoord7.xy * _WrinkleNormalBlend2_ST.xy + _WrinkleNormalBlend2_ST.zw;
				half3 unpack240 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend2, sampler_BumpMap, uv_WrinkleNormalBlend2 ), normalMapScale259 );
				unpack240.z = lerp( 1, unpack240.z, saturate(normalMapScale259) );
				half3 In2183_g1 = ( ( unpack240 - normal186_g1 ) * temp_output_23_0_g71 );
				float2 uv_WrinkleNormalBlend3 = IN.ase_texcoord7.xy * _WrinkleNormalBlend3_ST.xy + _WrinkleNormalBlend3_ST.zw;
				half3 unpack241 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend3, sampler_BumpMap, uv_WrinkleNormalBlend3 ), normalMapScale259 );
				unpack241.z = lerp( 1, unpack241.z, saturate(normalMapScale259) );
				half3 In3183_g1 = ( ( unpack241 - normal186_g1 ) * temp_output_23_0_g69 );
				half3 localMinMaxDeltaBlend3183_g1 = MinMaxDeltaBlend3183_g1( In183_g1 , In1183_g1 , In2183_g1 , In3183_g1 );
				half3 normalWrinkle217 = localMinMaxDeltaBlend3183_g1;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half3 staticSwitch246 = normalWrinkle217;
				#else
				half3 staticSwitch246 = normalMap206;
				#endif
				float2 uv_DetailNormalMap = IN.ase_texcoord7.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
				float2 uv_DetailMask = IN.ase_texcoord7.xy * _DetailMask_ST.xy + _DetailMask_ST.zw;
				half3 unpack148 = UnpackNormalScale( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_BumpMap, uv_DetailNormalMap ), ( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g ) );
				unpack148.z = lerp( 1, unpack148.z, saturate(( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g )) );
				
				float2 uv_EmissionMap = IN.ase_texcoord7.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				float2 uv_MetallicGlossMap = IN.ase_texcoord7.xy * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
				half4 tex2DNode150 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_Linear_Repeat, uv_MetallicGlossMap );
				
				half smoothnessMap207 = tex2DNode150.a;
				half smoothness185_g1 = smoothnessMap207;
				half In182_g1 = smoothness185_g1;
				float2 uv_WrinkleSmoothnessPack = IN.ase_texcoord7.xy * _WrinkleSmoothnessPack_ST.xy + _WrinkleSmoothnessPack_ST.zw;
				half4 tex2DNode235 = SAMPLE_TEXTURE2D( _WrinkleSmoothnessPack, sampler_Linear_Repeat, uv_WrinkleSmoothnessPack );
				half In1182_g1 = ( ( tex2DNode235.r - smoothness185_g1 ) * temp_output_23_0_g70 );
				half In2182_g1 = ( ( tex2DNode235.g - smoothness185_g1 ) * temp_output_23_0_g71 );
				half In3182_g1 = ( ( tex2DNode235.b - smoothness185_g1 ) * temp_output_23_0_g69 );
				half localMinMaxDeltaBlend1182_g1 = MinMaxDeltaBlend1182_g1( In182_g1 , In1182_g1 , In2182_g1 , In3182_g1 );
				half smoothnessWrinkle216 = localMinMaxDeltaBlend1182_g1;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half staticSwitch249 = smoothnessWrinkle216;
				#else
				half staticSwitch249 = smoothnessMap207;
				#endif
				
				float2 uv_OcclusionMap = IN.ase_texcoord7.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				
				float2 uv_ThicknessMap = IN.ase_texcoord7.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				half4 temp_output_203_0 = ( _SubsurfaceFalloff * baseColor200 );
				
				float2 uv_SubsurfaceMaskMap = IN.ase_texcoord7.xy * _SubsurfaceMaskMap_ST.xy + _SubsurfaceMaskMap_ST.zw;
				

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
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

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

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				half4 color = UniversalFragmentPBR(
					inputData,
					BaseColor,
					Metallic,
					Specular,
					Smoothness,
					Occlusion,
					Emission,
					Alpha);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += BaseColor * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += BaseColor * transmission;
						}
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

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += BaseColor * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += BaseColor * translucency * strength;
						}
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
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_LENGTH_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 101001
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD1;
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

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			TEXTURE2D(_BaseMap);
			SAMPLER(sampler_BaseMap);


			
			float3 _LightDirection;
			#if ASE_SRP_VERSION >= 110000
				float3 _LightPosition;
			#endif

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
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				#if ASE_SRP_VERSION >= 110000
					#if _CASTING_PUNCTUAL_LIGHT_SHADOW
						float3 lightDirectionWS = normalize(_LightPosition - positionWS);
					#else
						float3 lightDirectionWS = _LightDirection;
					#endif

					float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

					#if UNITY_REVERSED_Z
						clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
					#else
						clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
					#endif
				#else
					float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, _LightDirection));
					#if UNITY_REVERSED_Z
						clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
					#else
						clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
					#endif
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = clipPos;
				o.clipPosV = clipPos;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
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
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
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
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
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
					float3 WorldPosition = IN.worldPos;
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
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
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
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_LENGTH_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 101001
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD1;
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

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
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
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
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
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
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
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
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
				float3 WorldPosition = IN.worldPos;
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
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_LENGTH_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 101001
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"

			#pragma multi_compile_local __ BOOLEAN_USE_WRINKLE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
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

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
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


			half4 MinMaxDeltaBlend4181_g1( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			

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
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
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
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
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
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
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
					float3 WorldPosition = IN.worldPos;
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
				half4 diffuse184_g1 = diffuseMap205;
				half4 In181_g1 = diffuse184_g1;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowPack = IN.ase_texcoord2.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g1 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g15 = 0.49;
				half leftMask27_g1 = saturate( ( ( texCoord10_g1.x - temp_output_1_0_g15 ) / ( 0.51 - temp_output_1_0_g15 ) ) );
				half4 break107_g1 = _WrinkleValueSet12CL;
				half2 appendResult112_g1 = (half2(break107_g1.x , break107_g1.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord2.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g1 = (half2(break109_g1.x , break109_g1.y));
				half dotResult121_g1 = dot( appendResult112_g1 , appendResult115_g1 );
				half value1CLeft135_g1 = dotResult121_g1;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord2.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g1 = dot( _WrinkleValueSet1AL , maskSet1A214_g1 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord2.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g1 = dot( _WrinkleValueSet1BL , temp_output_16_0_g1 );
				half dotResult30_g1 = dot( maskSet1A214_g1 , _WrinkleValueSet1AR );
				half dotResult36_g1 = dot( temp_output_16_0_g1 , _WrinkleValueSet1BR );
				half4 break108_g1 = _WrinkleValueSet12CR;
				half2 appendResult117_g1 = (half2(break108_g1.x , break108_g1.y));
				half dotResult122_g1 = dot( appendResult115_g1 , appendResult117_g1 );
				half value1CRight136_g1 = dotResult122_g1;
				half temp_output_1_0_g14 = 0.51;
				half rightMask28_g1 = saturate( ( ( texCoord10_g1.x - temp_output_1_0_g14 ) / ( 0.49 - temp_output_1_0_g14 ) ) );
				half temp_output_16_0_g70 = ( ( leftMask27_g1 * ( value1CLeft135_g1 + dotResult29_g1 + dotResult35_g1 ) ) + ( ( dotResult30_g1 + dotResult36_g1 + value1CRight136_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g70 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g70 ) ) * temp_output_16_0_g70 );
				half4 In1181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g1 ) * temp_output_23_0_g70 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				half2 appendResult113_g1 = (half2(break107_g1.z , break107_g1.w));
				half2 appendResult114_g1 = (half2(break109_g1.z , break109_g1.w));
				half dotResult123_g1 = dot( appendResult113_g1 , appendResult114_g1 );
				half value2CLeft137_g1 = dotResult123_g1;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord2.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g1 = dot( _WrinkleValueSet2L , temp_output_17_0_g1 );
				half dotResult42_g1 = dot( temp_output_17_0_g1 , _WrinkleValueSet2R );
				half2 appendResult116_g1 = (half2(break108_g1.z , break108_g1.w));
				half dotResult124_g1 = dot( appendResult114_g1 , appendResult116_g1 );
				half value2CRight138_g1 = dotResult124_g1;
				half temp_output_16_0_g71 = ( ( leftMask27_g1 * ( value2CLeft137_g1 + dotResult41_g1 ) ) + ( ( dotResult42_g1 + value2CRight138_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g71 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g71 ) ) * temp_output_16_0_g71 );
				half4 In2181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g1 ) * temp_output_23_0_g71 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				half4 break211_g1 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g1 = ( break211_g1.x * maskSet1A214_g1.y );
				half4 break118_g1 = _WrinkleValueSet3DB;
				half2 appendResult120_g1 = (half2(break118_g1.x , break118_g1.y));
				half dotResult127_g1 = dot( appendResult120_g1 , appendResult115_g1 );
				half value3DLeft129_g1 = dotResult127_g1;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord2.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g1 = dot( _WrinkleValueSet3L , temp_output_18_0_g1 );
				half dotResult48_g1 = dot( temp_output_18_0_g1 , _WrinkleValueSet3R );
				half2 appendResult119_g1 = (half2(break118_g1.z , break118_g1.w));
				half dotResult128_g1 = dot( appendResult115_g1 , appendResult119_g1 );
				half value3DRight130_g1 = dotResult128_g1;
				half valueBCCRight219_g1 = ( maskSet1A214_g1.y * break211_g1.y );
				half temp_output_16_0_g69 = ( ( leftMask27_g1 * ( valueBCCLeft217_g1 + value3DLeft129_g1 + dotResult47_g1 ) ) + ( ( dotResult48_g1 + value3DRight130_g1 + valueBCCRight219_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g69 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g69 ) ) * temp_output_16_0_g69 );
				half4 In3181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g1 ) * temp_output_23_0_g69 );
				half4 localMinMaxDeltaBlend4181_g1 = MinMaxDeltaBlend4181_g1( In181_g1 , In1181_g1 , In2181_g1 , In3181_g1 );
				half4 diffuseWrinkle215 = localMinMaxDeltaBlend4181_g1;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch242 = diffuseWrinkle215;
				#else
				half4 staticSwitch242 = diffuseMap205;
				#endif
				half4 baseColor200 = ( _BaseColor * staticSwitch242 );
				
				float2 uv_EmissionMap = IN.ase_texcoord2.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				

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

				return MetaFragment(metaInput);
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_LENGTH_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 101001
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#pragma multi_compile_local __ BOOLEAN_USE_WRINKLE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
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

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
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


			half4 MinMaxDeltaBlend4181_g1( half4 In, half4 In1, half4 In2, half4 In3 )
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
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
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
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
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
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
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
					float3 WorldPosition = IN.worldPos;
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
				half4 diffuse184_g1 = diffuseMap205;
				half4 In181_g1 = diffuse184_g1;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowPack = IN.ase_texcoord2.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g1 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g15 = 0.49;
				half leftMask27_g1 = saturate( ( ( texCoord10_g1.x - temp_output_1_0_g15 ) / ( 0.51 - temp_output_1_0_g15 ) ) );
				half4 break107_g1 = _WrinkleValueSet12CL;
				half2 appendResult112_g1 = (half2(break107_g1.x , break107_g1.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord2.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g1 = (half2(break109_g1.x , break109_g1.y));
				half dotResult121_g1 = dot( appendResult112_g1 , appendResult115_g1 );
				half value1CLeft135_g1 = dotResult121_g1;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord2.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g1 = dot( _WrinkleValueSet1AL , maskSet1A214_g1 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord2.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g1 = dot( _WrinkleValueSet1BL , temp_output_16_0_g1 );
				half dotResult30_g1 = dot( maskSet1A214_g1 , _WrinkleValueSet1AR );
				half dotResult36_g1 = dot( temp_output_16_0_g1 , _WrinkleValueSet1BR );
				half4 break108_g1 = _WrinkleValueSet12CR;
				half2 appendResult117_g1 = (half2(break108_g1.x , break108_g1.y));
				half dotResult122_g1 = dot( appendResult115_g1 , appendResult117_g1 );
				half value1CRight136_g1 = dotResult122_g1;
				half temp_output_1_0_g14 = 0.51;
				half rightMask28_g1 = saturate( ( ( texCoord10_g1.x - temp_output_1_0_g14 ) / ( 0.49 - temp_output_1_0_g14 ) ) );
				half temp_output_16_0_g70 = ( ( leftMask27_g1 * ( value1CLeft135_g1 + dotResult29_g1 + dotResult35_g1 ) ) + ( ( dotResult30_g1 + dotResult36_g1 + value1CRight136_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g70 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g70 ) ) * temp_output_16_0_g70 );
				half4 In1181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g1 ) * temp_output_23_0_g70 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				half2 appendResult113_g1 = (half2(break107_g1.z , break107_g1.w));
				half2 appendResult114_g1 = (half2(break109_g1.z , break109_g1.w));
				half dotResult123_g1 = dot( appendResult113_g1 , appendResult114_g1 );
				half value2CLeft137_g1 = dotResult123_g1;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord2.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g1 = dot( _WrinkleValueSet2L , temp_output_17_0_g1 );
				half dotResult42_g1 = dot( temp_output_17_0_g1 , _WrinkleValueSet2R );
				half2 appendResult116_g1 = (half2(break108_g1.z , break108_g1.w));
				half dotResult124_g1 = dot( appendResult114_g1 , appendResult116_g1 );
				half value2CRight138_g1 = dotResult124_g1;
				half temp_output_16_0_g71 = ( ( leftMask27_g1 * ( value2CLeft137_g1 + dotResult41_g1 ) ) + ( ( dotResult42_g1 + value2CRight138_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g71 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g71 ) ) * temp_output_16_0_g71 );
				half4 In2181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g1 ) * temp_output_23_0_g71 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord2.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				half4 break211_g1 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g1 = ( break211_g1.x * maskSet1A214_g1.y );
				half4 break118_g1 = _WrinkleValueSet3DB;
				half2 appendResult120_g1 = (half2(break118_g1.x , break118_g1.y));
				half dotResult127_g1 = dot( appendResult120_g1 , appendResult115_g1 );
				half value3DLeft129_g1 = dotResult127_g1;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord2.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g1 = dot( _WrinkleValueSet3L , temp_output_18_0_g1 );
				half dotResult48_g1 = dot( temp_output_18_0_g1 , _WrinkleValueSet3R );
				half2 appendResult119_g1 = (half2(break118_g1.z , break118_g1.w));
				half dotResult128_g1 = dot( appendResult115_g1 , appendResult119_g1 );
				half value3DRight130_g1 = dotResult128_g1;
				half valueBCCRight219_g1 = ( maskSet1A214_g1.y * break211_g1.y );
				half temp_output_16_0_g69 = ( ( leftMask27_g1 * ( valueBCCLeft217_g1 + value3DLeft129_g1 + dotResult47_g1 ) ) + ( ( dotResult48_g1 + value3DRight130_g1 + valueBCCRight219_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g69 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g69 ) ) * temp_output_16_0_g69 );
				half4 In3181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g1 ) * temp_output_23_0_g69 );
				half4 localMinMaxDeltaBlend4181_g1 = MinMaxDeltaBlend4181_g1( In181_g1 , In1181_g1 , In2181_g1 , In3181_g1 );
				half4 diffuseWrinkle215 = localMinMaxDeltaBlend4181_g1;
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
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_LENGTH_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 101001
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD2;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD3;
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

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
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

				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
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
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
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
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
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
					float3 WorldPosition = IN.worldPos;
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

				float2 uv_BaseMap = IN.ase_texcoord4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				

				float Alpha = tex2DNode145.a;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if ASE_SRP_VERSION >= 110000
					return float4(PackNormalOctRectEncode(TransformWorldToViewDir(IN.worldNormal, true)), 0.0, 0.0);
				#elif ASE_SRP_VERSION >= 100900
					return float4(PackNormalOctRectEncode(normalize(IN.worldNormal)), 0.0, 0.0);
				#else
					return float4(PackNormalOctRectEncode(TransformWorldToViewDir(IN.worldNormal, true)), 0.0, 0.0);
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
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_LENGTH_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 101001
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
		

			

			#pragma multi_compile_fragment _ _SHADOWS_SOFT

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

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
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
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

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
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

			half4 MinMaxDeltaBlend4181_g1( half4 In, half4 In1, half4 In2, half4 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half3 MinMaxDeltaBlend3183_g1( half3 In, half3 In1, half3 In2, half3 In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			
			half MinMaxDeltaBlend1182_g1( half In, half In1, half In2, half In3 )
			{
				return max(max(In1, In2), In3) + min(min(In1, In2), In3) + In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				
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
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				
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
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
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

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
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

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_BaseMap = IN.ase_texcoord7.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				half4 tex2DNode145 = SAMPLE_TEXTURE2D( _BaseMap, sampler_BaseMap, uv_BaseMap );
				half4 diffuseMap205 = tex2DNode145;
				half4 diffuse184_g1 = diffuseMap205;
				half4 In181_g1 = diffuse184_g1;
				float2 uv_WrinkleDiffuseBlend1 = IN.ase_texcoord7.xy * _WrinkleDiffuseBlend1_ST.xy + _WrinkleDiffuseBlend1_ST.zw;
				float2 uv_WrinkleFlowPack = IN.ase_texcoord7.xy * _WrinkleFlowPack_ST.xy + _WrinkleFlowPack_ST.zw;
				half4 tex2DNode258 = SAMPLE_TEXTURE2D( _WrinkleFlowPack, sampler_Linear_Repeat, uv_WrinkleFlowPack );
				half2 texCoord10_g1 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g15 = 0.49;
				half leftMask27_g1 = saturate( ( ( texCoord10_g1.x - temp_output_1_0_g15 ) / ( 0.51 - temp_output_1_0_g15 ) ) );
				half4 break107_g1 = _WrinkleValueSet12CL;
				half2 appendResult112_g1 = (half2(break107_g1.x , break107_g1.y));
				float2 uv_WrinkleMaskSet123 = IN.ase_texcoord7.xy * _WrinkleMaskSet123_ST.xy + _WrinkleMaskSet123_ST.zw;
				half4 break109_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet123, sampler_Linear_Repeat, uv_WrinkleMaskSet123 );
				half2 appendResult115_g1 = (half2(break109_g1.x , break109_g1.y));
				half dotResult121_g1 = dot( appendResult112_g1 , appendResult115_g1 );
				half value1CLeft135_g1 = dotResult121_g1;
				float2 uv_WrinkleMaskSet1A = IN.ase_texcoord7.xy * _WrinkleMaskSet1A_ST.xy + _WrinkleMaskSet1A_ST.zw;
				half4 maskSet1A214_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1A, sampler_Linear_Repeat, uv_WrinkleMaskSet1A );
				half dotResult29_g1 = dot( _WrinkleValueSet1AL , maskSet1A214_g1 );
				float2 uv_WrinkleMaskSet1B = IN.ase_texcoord7.xy * _WrinkleMaskSet1B_ST.xy + _WrinkleMaskSet1B_ST.zw;
				half4 temp_output_16_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet1B, sampler_Linear_Repeat, uv_WrinkleMaskSet1B );
				half dotResult35_g1 = dot( _WrinkleValueSet1BL , temp_output_16_0_g1 );
				half dotResult30_g1 = dot( maskSet1A214_g1 , _WrinkleValueSet1AR );
				half dotResult36_g1 = dot( temp_output_16_0_g1 , _WrinkleValueSet1BR );
				half4 break108_g1 = _WrinkleValueSet12CR;
				half2 appendResult117_g1 = (half2(break108_g1.x , break108_g1.y));
				half dotResult122_g1 = dot( appendResult115_g1 , appendResult117_g1 );
				half value1CRight136_g1 = dotResult122_g1;
				half temp_output_1_0_g14 = 0.51;
				half rightMask28_g1 = saturate( ( ( texCoord10_g1.x - temp_output_1_0_g14 ) / ( 0.49 - temp_output_1_0_g14 ) ) );
				half temp_output_16_0_g70 = ( ( leftMask27_g1 * ( value1CLeft135_g1 + dotResult29_g1 + dotResult35_g1 ) ) + ( ( dotResult30_g1 + dotResult36_g1 + value1CRight136_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g70 = ( saturate( ( tex2DNode258.r + temp_output_16_0_g70 ) ) * temp_output_16_0_g70 );
				half4 In1181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend1, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend1 ) - diffuse184_g1 ) * temp_output_23_0_g70 );
				float2 uv_WrinkleDiffuseBlend2 = IN.ase_texcoord7.xy * _WrinkleDiffuseBlend2_ST.xy + _WrinkleDiffuseBlend2_ST.zw;
				half2 appendResult113_g1 = (half2(break107_g1.z , break107_g1.w));
				half2 appendResult114_g1 = (half2(break109_g1.z , break109_g1.w));
				half dotResult123_g1 = dot( appendResult113_g1 , appendResult114_g1 );
				half value2CLeft137_g1 = dotResult123_g1;
				float2 uv_WrinkleMaskSet2 = IN.ase_texcoord7.xy * _WrinkleMaskSet2_ST.xy + _WrinkleMaskSet2_ST.zw;
				half4 temp_output_17_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet2, sampler_Linear_Repeat, uv_WrinkleMaskSet2 );
				half dotResult41_g1 = dot( _WrinkleValueSet2L , temp_output_17_0_g1 );
				half dotResult42_g1 = dot( temp_output_17_0_g1 , _WrinkleValueSet2R );
				half2 appendResult116_g1 = (half2(break108_g1.z , break108_g1.w));
				half dotResult124_g1 = dot( appendResult114_g1 , appendResult116_g1 );
				half value2CRight138_g1 = dotResult124_g1;
				half temp_output_16_0_g71 = ( ( leftMask27_g1 * ( value2CLeft137_g1 + dotResult41_g1 ) ) + ( ( dotResult42_g1 + value2CRight138_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g71 = ( saturate( ( tex2DNode258.g + temp_output_16_0_g71 ) ) * temp_output_16_0_g71 );
				half4 In2181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend2, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend2 ) - diffuse184_g1 ) * temp_output_23_0_g71 );
				float2 uv_WrinkleDiffuseBlend3 = IN.ase_texcoord7.xy * _WrinkleDiffuseBlend3_ST.xy + _WrinkleDiffuseBlend3_ST.zw;
				half4 break211_g1 = _WrinkleValueSetBCCB;
				half valueBCCLeft217_g1 = ( break211_g1.x * maskSet1A214_g1.y );
				half4 break118_g1 = _WrinkleValueSet3DB;
				half2 appendResult120_g1 = (half2(break118_g1.x , break118_g1.y));
				half dotResult127_g1 = dot( appendResult120_g1 , appendResult115_g1 );
				half value3DLeft129_g1 = dotResult127_g1;
				float2 uv_WrinkleMaskSet3 = IN.ase_texcoord7.xy * _WrinkleMaskSet3_ST.xy + _WrinkleMaskSet3_ST.zw;
				half4 temp_output_18_0_g1 = SAMPLE_TEXTURE2D( _WrinkleMaskSet3, sampler_Linear_Repeat, uv_WrinkleMaskSet3 );
				half dotResult47_g1 = dot( _WrinkleValueSet3L , temp_output_18_0_g1 );
				half dotResult48_g1 = dot( temp_output_18_0_g1 , _WrinkleValueSet3R );
				half2 appendResult119_g1 = (half2(break118_g1.z , break118_g1.w));
				half dotResult128_g1 = dot( appendResult115_g1 , appendResult119_g1 );
				half value3DRight130_g1 = dotResult128_g1;
				half valueBCCRight219_g1 = ( maskSet1A214_g1.y * break211_g1.y );
				half temp_output_16_0_g69 = ( ( leftMask27_g1 * ( valueBCCLeft217_g1 + value3DLeft129_g1 + dotResult47_g1 ) ) + ( ( dotResult48_g1 + value3DRight130_g1 + valueBCCRight219_g1 ) * rightMask28_g1 ) );
				half temp_output_23_0_g69 = ( saturate( ( tex2DNode258.b + temp_output_16_0_g69 ) ) * temp_output_16_0_g69 );
				half4 In3181_g1 = ( ( SAMPLE_TEXTURE2D( _WrinkleDiffuseBlend3, sampler_WrinkleDiffuseBlend1, uv_WrinkleDiffuseBlend3 ) - diffuse184_g1 ) * temp_output_23_0_g69 );
				half4 localMinMaxDeltaBlend4181_g1 = MinMaxDeltaBlend4181_g1( In181_g1 , In1181_g1 , In2181_g1 , In3181_g1 );
				half4 diffuseWrinkle215 = localMinMaxDeltaBlend4181_g1;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half4 staticSwitch242 = diffuseWrinkle215;
				#else
				half4 staticSwitch242 = diffuseMap205;
				#endif
				half4 baseColor200 = ( _BaseColor * staticSwitch242 );
				
				float2 uv_BumpMap = IN.ase_texcoord7.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				half normalMapScale259 = _BumpScale;
				half3 unpack146 = UnpackNormalScale( SAMPLE_TEXTURE2D( _BumpMap, sampler_BumpMap, uv_BumpMap ), normalMapScale259 );
				unpack146.z = lerp( 1, unpack146.z, saturate(normalMapScale259) );
				half3 normalMap206 = unpack146;
				half3 normal186_g1 = normalMap206;
				half3 In183_g1 = normal186_g1;
				float2 uv_WrinkleNormalBlend1 = IN.ase_texcoord7.xy * _WrinkleNormalBlend1_ST.xy + _WrinkleNormalBlend1_ST.zw;
				half3 unpack239 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend1, sampler_BumpMap, uv_WrinkleNormalBlend1 ), normalMapScale259 );
				unpack239.z = lerp( 1, unpack239.z, saturate(normalMapScale259) );
				half3 In1183_g1 = ( ( unpack239 - normal186_g1 ) * temp_output_23_0_g70 );
				float2 uv_WrinkleNormalBlend2 = IN.ase_texcoord7.xy * _WrinkleNormalBlend2_ST.xy + _WrinkleNormalBlend2_ST.zw;
				half3 unpack240 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend2, sampler_BumpMap, uv_WrinkleNormalBlend2 ), normalMapScale259 );
				unpack240.z = lerp( 1, unpack240.z, saturate(normalMapScale259) );
				half3 In2183_g1 = ( ( unpack240 - normal186_g1 ) * temp_output_23_0_g71 );
				float2 uv_WrinkleNormalBlend3 = IN.ase_texcoord7.xy * _WrinkleNormalBlend3_ST.xy + _WrinkleNormalBlend3_ST.zw;
				half3 unpack241 = UnpackNormalScale( SAMPLE_TEXTURE2D( _WrinkleNormalBlend3, sampler_BumpMap, uv_WrinkleNormalBlend3 ), normalMapScale259 );
				unpack241.z = lerp( 1, unpack241.z, saturate(normalMapScale259) );
				half3 In3183_g1 = ( ( unpack241 - normal186_g1 ) * temp_output_23_0_g69 );
				half3 localMinMaxDeltaBlend3183_g1 = MinMaxDeltaBlend3183_g1( In183_g1 , In1183_g1 , In2183_g1 , In3183_g1 );
				half3 normalWrinkle217 = localMinMaxDeltaBlend3183_g1;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half3 staticSwitch246 = normalWrinkle217;
				#else
				half3 staticSwitch246 = normalMap206;
				#endif
				float2 uv_DetailNormalMap = IN.ase_texcoord7.xy * _DetailNormalMap_ST.xy + _DetailNormalMap_ST.zw;
				float2 uv_DetailMask = IN.ase_texcoord7.xy * _DetailMask_ST.xy + _DetailMask_ST.zw;
				half3 unpack148 = UnpackNormalScale( SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_BumpMap, uv_DetailNormalMap ), ( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g ) );
				unpack148.z = lerp( 1, unpack148.z, saturate(( _DetailNormalMapScale * SAMPLE_TEXTURE2D( _DetailMask, sampler_BumpMap, uv_DetailMask ).g )) );
				
				float2 uv_EmissionMap = IN.ase_texcoord7.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				float2 uv_MetallicGlossMap = IN.ase_texcoord7.xy * _MetallicGlossMap_ST.xy + _MetallicGlossMap_ST.zw;
				half4 tex2DNode150 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_Linear_Repeat, uv_MetallicGlossMap );
				
				half smoothnessMap207 = tex2DNode150.a;
				half smoothness185_g1 = smoothnessMap207;
				half In182_g1 = smoothness185_g1;
				float2 uv_WrinkleSmoothnessPack = IN.ase_texcoord7.xy * _WrinkleSmoothnessPack_ST.xy + _WrinkleSmoothnessPack_ST.zw;
				half4 tex2DNode235 = SAMPLE_TEXTURE2D( _WrinkleSmoothnessPack, sampler_Linear_Repeat, uv_WrinkleSmoothnessPack );
				half In1182_g1 = ( ( tex2DNode235.r - smoothness185_g1 ) * temp_output_23_0_g70 );
				half In2182_g1 = ( ( tex2DNode235.g - smoothness185_g1 ) * temp_output_23_0_g71 );
				half In3182_g1 = ( ( tex2DNode235.b - smoothness185_g1 ) * temp_output_23_0_g69 );
				half localMinMaxDeltaBlend1182_g1 = MinMaxDeltaBlend1182_g1( In182_g1 , In1182_g1 , In2182_g1 , In3182_g1 );
				half smoothnessWrinkle216 = localMinMaxDeltaBlend1182_g1;
				#ifdef BOOLEAN_USE_WRINKLE_ON
				half staticSwitch249 = smoothnessWrinkle216;
				#else
				half staticSwitch249 = smoothnessMap207;
				#endif
				
				float2 uv_OcclusionMap = IN.ase_texcoord7.xy * _OcclusionMap_ST.xy + _OcclusionMap_ST.zw;
				
				float2 uv_ThicknessMap = IN.ase_texcoord7.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				half4 temp_output_203_0 = ( _SubsurfaceFalloff * baseColor200 );
				
				float2 uv_SubsurfaceMaskMap = IN.ase_texcoord7.xy * _SubsurfaceMaskMap_ST.xy + _SubsurfaceMaskMap_ST.zw;
				

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
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = 0; // we don't apply fog in the gbuffer pass
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				BRDFData brdfData;
				InitializeBRDFData( BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);
				half4 color;
				color.rgb = GlobalIllumination( brdfData, inputData.bakedGI, Occlusion, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

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

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb);
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.CommentaryNode;179;-1986.736,1265.129;Inherit;False;1346.577;305.7186;Comment;6;269;172;171;169;170;151;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;176;-2397.158,-653.998;Inherit;False;1737.49;786.1425;Comment;13;265;259;153;246;247;206;146;148;156;154;147;155;266;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;175;-2056.478,-1166.93;Inherit;False;1393.695;485.5302;Comment;10;243;242;244;245;187;205;145;173;200;174;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;151;-1598.736,1343.848;Inherit;True;Property;_OcclusionMap;Occlusion Map;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;178;-2103.736,686.485;Inherit;False;1456.62;500.9769;Comment;10;268;249;248;207;250;150;164;167;168;165;;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;170;-1213.159,1462.129;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;197;-1603.26,1656.15;Inherit;False;957.9785;1070.225;Comment;11;270;195;192;194;190;202;204;203;193;196;189;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;169;-1286.159,1315.129;Inherit;False;Property;_OcclusionStrength;Occlusion Strength;8;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;177;-1536.347,161.9798;Inherit;False;881.4177;477.6811;Comment;4;158;157;149;267;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;171;-983.1591,1362.129;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;189;-1204.472,2201.485;Inherit;True;Property;_SubsurfaceMaskMap;Subsurface Mask Map;11;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;174;-1114.784,-951.6051;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;165;-1176.212,736.485;Inherit;False;Property;_Metallic;Metallic;3;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;149;-1227.347,211.9798;Inherit;True;Property;_EmissionMap;Emission Map;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;157;-1144.832,424.6609;Inherit;False;Property;_EmissiveColor;Emissive Color;10;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;172;-819.1592,1365.129;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;200;-881.6036,-907.7378;Inherit;False;baseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;196;-805.146,1767.444;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;168;-809.1151,939.4771;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;193;-795.4855,2096.271;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendNormalsNode;155;-887.6707,-493.8247;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;167;-809.7693,806.5468;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;158;-816.9294,341.7015;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;185;-148.3843,570.1794;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;183;-147.1609,632.9402;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;181;-146.0122,762.5016;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;180;-148.0205,826.4184;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;182;-148.0122,694.8321;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;199;-148.5999,1146.595;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;198;-147.6,1016.235;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;201;-146.3643,431.4894;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;184;-151.3843,503.1793;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-3.854388,393.1342;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;299.4972,596.494;Half;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;12;Reallusion/Amplify/RL_HeadShaderWrinkle_Baked_URP_Tessellation;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;6;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;38;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Transmission;1;637781863003969542;  Transmission Shadow;0.5,False,;637782841107493989;Translucency;1;637781863019529545;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;1;638117996572301516;  Phong;1;638117996593601803;  Strength;0,False,;0;  Type;2;638117996636268057;  Tess;1,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;0;8;False;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;-990.6594,2406.68;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;204;-1189.659,2596.68;Inherit;False;200;baseColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;202;-1225.289,2401.942;Inherit;False;Property;_SubsurfaceFalloff;Subsurface Falloff;18;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;190;-1196.935,1821.459;Inherit;True;Property;_ThicknessMap;Transmission Map;13;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;194;-1187.487,2118.57;Inherit;False;Constant;_ConstTranslucencyWrap;Const Translucency Wrap;17;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;192;-1189.487,2033.771;Inherit;False;Property;_SubsurfaceMask;Subsurface Mask;12;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;195;-1176.749,1725.444;Inherit;False;Property;_Thickness;Transmission;14;0;Create;False;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;164;-1168.395,1048.658;Inherit;False;Property;_Smoothness;Smoothness;4;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;147;-1989.301,-145.1674;Inherit;True;Property;_DetailMask;Detail Mask;15;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;154;-1962.876,-249.8618;Inherit;False;Property;_DetailNormalMapScale;Detail Normal Map Scale;17;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;156;-1593.598,-191.0806;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;148;-1323.51,-168.2899;Inherit;True;Property;_DetailNormalMap;Detail Normal Map;16;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;208;-5148.247,-362.0735;Inherit;False;2613.49;2063.022;;37;230;228;235;209;241;240;239;234;233;232;231;229;226;225;224;223;222;221;220;219;218;253;217;216;215;214;213;212;254;255;256;257;258;260;261;262;263;Wrinkle System;1,0.5137255,0.7779443,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;212;-3633.453,-272.6874;Inherit;False;205;diffuseMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;213;-3664.157,-188.369;Inherit;False;207;smoothnessMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;214;-3637.157,-105.3685;Inherit;False;206;normalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;215;-2820.068,-0.1314611;Inherit;False;diffuseWrinkle;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;216;-2840.068,113.8685;Inherit;False;smoothnessWrinkle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;217;-2825.068,223.8686;Inherit;False;normalWrinkle;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;173;-1455.191,-1117.993;Inherit;False;Property;_BaseColor;Base Color;1;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;145;-2028.117,-910.952;Inherit;True;Property;_BaseMap;Base Map;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;187;-708.5606,-749.1402;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;245;-1146.164,-730.2344;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;244;-1702.164,-727.2344;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;243;-1710.626,-821.3831;Inherit;False;215;diffuseWrinkle;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;-1710.419,-910.1047;Inherit;False;diffuseMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;146;-1900.112,-578.3935;Inherit;True;Property;_BumpMap;Bump Map;5;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;206;-1557.472,-580.6923;Inherit;False;normalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;247;-1558.165,-496.1588;Inherit;False;217;normalWrinkle;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;150;-1796.198,841.0651;Inherit;True;Property;_MetallicGlossMap;Metallic Gloss Map;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;250;-1366.734,831.6754;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;207;-1402.333,895.4883;Inherit;False;smoothnessMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;248;-1415.02,981.3398;Inherit;False;216;smoothnessWrinkle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;246;-1317.93,-546.2879;Inherit;False;Property;BOOLEAN_USE_WRINKLE1;Use Wrinkle;19;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Reference;242;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;242;-1491.397,-879.1359;Inherit;False;Property;BOOLEAN_USE_WRINKLE;Use Wrinkle;19;0;Create;False;0;0;0;False;0;False;1;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;249;-1164.089,921.2395;Inherit;False;Property;BOOLEAN_USE_WRINKLE2;Use Wrinkle;19;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_USE_WRINKLE_ON;Toggle;2;Key0;Key1;Reference;242;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;232;-4774.097,177.4562;Inherit;True;Property;_WrinkleDiffuseBlend1;Wrinkle Diffuse Blend 1;25;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;233;-4472.926,251.5854;Inherit;True;Property;_WrinkleDiffuseBlend2;Wrinkle Diffuse Blend 2;26;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;234;-4165.393,343.3291;Inherit;True;Property;_WrinkleDiffuseBlend3;Wrinkle Diffuse Blend 3;27;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;241;-4165.553,771.5837;Inherit;True;Property;_WrinkleNormalBlend3;Wrinkle Normal Blend 3;32;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;240;-4473.128,681.6926;Inherit;True;Property;_WrinkleNormalBlend2;Wrinkle Normal Blend 2;31;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;239;-4775.591,593.2079;Inherit;True;Property;_WrinkleNormalBlend1;Wrinkle Normal Blend 1;30;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;219;-4837.23,1378.069;Inherit;False;Property;_WrinkleValueSet2L;Wrinkle Value Set 2 Left;35;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;220;-4601.23,1444.069;Inherit;False;Property;_WrinkleValueSet3L;Wrinkle Value Set 3 Left;36;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;221;-4353.084,1376.926;Inherit;False;Property;_WrinkleValueSet2R;Wrinkle Value Set 2 Right;40;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;222;-4098.079,1429.926;Inherit;False;Property;_WrinkleValueSet3R;Wrinkle Value Set 3 Right;41;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;228;-4772.198,-244.6;Inherit;True;Property;_WrinkleMaskSet1A;Wrinkle Mask Set 1A;20;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;231;-4474.881,-151.9223;Inherit;True;Property;_WrinkleMaskSet1B;Wrinkle Mask Set 1B;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;229;-4780.048,-36.77882;Inherit;True;Property;_WrinkleMaskSet3;Wrinkle Mask Set 3;23;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;230;-4172.442,-72.15807;Inherit;True;Property;_WrinkleMaskSet2;Wrinkle Mask Set 2;22;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;253;-3310.532,69.12341;Inherit;False;RL_Amplify_WrinkleMapSystem;-1;;1;d27d6ddfed52eb04ba4585a9fc285421;0;32;7;COLOR;0,0,0,0;False;8;FLOAT;0;False;9;FLOAT3;0,0,0;False;15;FLOAT4;0,0,0,0;False;16;FLOAT4;0,0,0,0;False;17;FLOAT4;0,0,0,0;False;18;FLOAT4;0,0,0,0;False;105;FLOAT4;0,0,0,0;False;67;COLOR;0,0,0,0;False;71;COLOR;0,0,0,0;False;76;COLOR;0,0,0,0;False;68;FLOAT;0;False;72;FLOAT;0;False;77;FLOAT;0;False;69;FLOAT3;0,0,0;False;73;FLOAT3;0,0,0;False;78;FLOAT3;0,0,0;False;151;FLOAT;0;False;155;FLOAT;0;False;156;FLOAT;0;False;19;FLOAT4;0,0,0,0;False;20;FLOAT4;0,0,0,0;False;23;FLOAT4;0,0,0,0;False;24;FLOAT4;0,0,0,0;False;103;FLOAT4;0,0,0,0;False;21;FLOAT4;0,0,0,0;False;22;FLOAT4;0,0,0,0;False;25;FLOAT4;0,0,0,0;False;26;FLOAT4;0,0,0,0;False;104;FLOAT4;0,0,0,0;False;106;FLOAT4;0,0,0,0;False;210;FLOAT4;0,0,0,0;False;3;FLOAT4;0;FLOAT;1;FLOAT3;6
Node;AmplifyShaderEditor.SamplerNode;254;-4476.941,49.68732;Inherit;True;Property;_WrinkleMaskSet123;Wrinkle Mask Set 123;24;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;223;-4837.528,1195.359;Inherit;False;Property;_WrinkleValueSet1AL;Wrinkle Value Set 1A Left;33;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;224;-4602.528,1254.359;Inherit;False;Property;_WrinkleValueSet1BL;Wrinkle Value Set 1B Left;34;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;225;-4353.382,1194.214;Inherit;False;Property;_WrinkleValueSet1AR;Wrinkle Value Set 1A Right;38;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;226;-4097.377,1237.214;Inherit;False;Property;_WrinkleValueSet1BR;Wrinkle Value Set 1B Right;39;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;256;-3839.492,1157.241;Inherit;False;Property;_WrinkleValueSet12CL;Wrinkle Value Set 12C Left;37;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;255;-3838.751,1349.152;Inherit;False;Property;_WrinkleValueSet12CR;Wrinkle Value Set 12C Right;42;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;257;-3557.133,1236.652;Inherit;False;Property;_WrinkleValueSet3DB;Wrinkle Value Set 3D Both;43;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;235;-4477.63,458.7407;Inherit;True;Property;_WrinkleSmoothnessPack;Wrinkle Smoothness Pack;28;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;258;-4163.868,552.4858;Inherit;True;Property;_WrinkleFlowPack;Wrinkle Flow Pack;29;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;153;-2372.25,-573.977;Inherit;False;Property;_BumpScale;Bump Scale;6;0;Create;True;0;0;0;False;0;False;2;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;259;-2093.285,-364.1438;Inherit;False;normalMapScale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;260;-3506.412,1421.573;Inherit;False;Property;_WrinkleValueSetBCCB;Wrinkle Value Set BCC Both;44;0;Create;False;0;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;261;-5102.083,497.8569;Inherit;False;mainSamplerState;-1;True;1;0;SAMPLERSTATE;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;209;-5089.492,374.4471;Inherit;False;0;0;0;1;2;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;262;-5114.881,253.1569;Inherit;False;0;0;0;1;232;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;263;-5094.083,786.8569;Inherit;False;0;0;0;1;146;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;218;-5044.049,958.7258;Inherit;False;259;normalMapScale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;266;-1623.593,33.05239;Inherit;False;1;0;SAMPLERSTATE;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;265;-2238.015,15.98533;Inherit;False;0;0;0;1;146;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.SamplerStateNode;267;-1480.235,336.2092;Inherit;False;0;0;0;1;145;None;1;0;SAMPLER2D;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;268;-2043.931,1044.67;Inherit;False;261;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;269;-1905.816,1405.196;Inherit;False;261;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
Node;AmplifyShaderEditor.GetLocalVarNode;270;-1536.61,2091.736;Inherit;False;261;mainSamplerState;1;0;OBJECT;;False;1;SAMPLERSTATE;0
WireConnection;151;7;269;0
WireConnection;170;0;151;2
WireConnection;171;0;169;0
WireConnection;171;1;170;0
WireConnection;189;7;270;0
WireConnection;174;0;173;0
WireConnection;174;1;242;0
WireConnection;149;7;267;0
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
WireConnection;1;0;201;0
WireConnection;1;1;184;0
WireConnection;1;2;183;0
WireConnection;1;3;182;0
WireConnection;1;4;181;0
WireConnection;1;5;180;0
WireConnection;1;6;185;0
WireConnection;1;14;198;0
WireConnection;1;15;199;0
WireConnection;203;0;202;0
WireConnection;203;1;204;0
WireConnection;190;7;270;0
WireConnection;147;7;265;0
WireConnection;156;0;154;0
WireConnection;156;1;147;2
WireConnection;148;5;156;0
WireConnection;148;7;266;0
WireConnection;215;0;253;0
WireConnection;216;0;253;1
WireConnection;217;0;253;6
WireConnection;187;0;245;0
WireConnection;245;0;244;0
WireConnection;244;0;145;4
WireConnection;205;0;145;0
WireConnection;146;5;259;0
WireConnection;206;0;146;0
WireConnection;150;7;268;0
WireConnection;250;0;150;2
WireConnection;207;0;150;4
WireConnection;246;1;206;0
WireConnection;246;0;247;0
WireConnection;242;1;205;0
WireConnection;242;0;243;0
WireConnection;249;1;207;0
WireConnection;249;0;248;0
WireConnection;232;7;262;0
WireConnection;233;7;262;0
WireConnection;234;7;262;0
WireConnection;241;5;218;0
WireConnection;241;7;263;0
WireConnection;240;5;218;0
WireConnection;240;7;263;0
WireConnection;239;5;218;0
WireConnection;239;7;263;0
WireConnection;228;7;209;0
WireConnection;231;7;209;0
WireConnection;229;7;209;0
WireConnection;230;7;209;0
WireConnection;253;7;212;0
WireConnection;253;8;213;0
WireConnection;253;9;214;0
WireConnection;253;15;228;0
WireConnection;253;16;231;0
WireConnection;253;17;230;0
WireConnection;253;18;229;0
WireConnection;253;105;254;0
WireConnection;253;67;232;0
WireConnection;253;71;233;0
WireConnection;253;76;234;0
WireConnection;253;68;235;1
WireConnection;253;72;235;2
WireConnection;253;77;235;3
WireConnection;253;69;239;0
WireConnection;253;73;240;0
WireConnection;253;78;241;0
WireConnection;253;151;258;1
WireConnection;253;155;258;2
WireConnection;253;156;258;3
WireConnection;253;19;223;0
WireConnection;253;20;224;0
WireConnection;253;23;219;0
WireConnection;253;24;220;0
WireConnection;253;103;256;0
WireConnection;253;21;225;0
WireConnection;253;22;226;0
WireConnection;253;25;221;0
WireConnection;253;26;222;0
WireConnection;253;104;255;0
WireConnection;253;106;257;0
WireConnection;253;210;260;0
WireConnection;254;7;209;0
WireConnection;235;7;209;0
WireConnection;258;7;209;0
WireConnection;259;0;153;0
WireConnection;261;0;209;0
WireConnection;266;0;265;0
ASEEND*/
//CHKSM=260654652895650EF8729C8C37C82BF7EF916ACF