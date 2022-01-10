// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Reallusion/Amplify/RL_SkinShader_Variants_URP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin]_DiffuseMap("Diffuse Map", 2D) = "white" {}
		_MaskMap("Mask Map", 2D) = "gray" {}
		_AOStrength("AO Strength", Range( 0 , 1)) = 0
		_SmoothnessPower("SmoothnessPower", Range( 0.1 , 2)) = 0.1
		_SmoothnessMin("SmoothnessMin", Range( 0 , 1)) = 0
		_SmoothnessMax("SmoothnessMax", Range( 0 , 1)) = 0
		[Normal]_NormalMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Range( 0 , 1)) = 1
		[Normal]_MicroNormalMap("Micro Normal Map", 2D) = "bump" {}
		_MicroNormalStrength("Micro Normal Strength", Range( 0 , 1)) = 0.5
		_MicroNormalTiling("Micro Normal Tiling", Range( 0 , 50)) = 25
		_ColorBlendMap("Color Blend Map (Head)", 2D) = "gray" {}
		_ColorBlendStrength("Color Blend Strength", Range( 0 , 1)) = 0
		[Normal]_NormalBlendMap("Normal Blend Map (Head)", 2D) = "bump" {}
		_NormalBlendStrength("Normal Blend Strength (Head)", Range( 0 , 1)) = 0
		_SSSMap("Subsurface Map", 2D) = "white" {}
		_SubsurfaceScale("Subsurface Scale", Range( 0 , 2)) = 1
		_SubsurfaceFalloff("Subsurface Falloff", Color) = (1,0.3686275,0.2980392,0)
		_ThicknessMap("Thickness Map", 2D) = "black" {}
		_ThicknessScale("Thickness Scale", Range( 0 , 1)) = 1
		_RGBAMask("RGBA Mask", 2D) = "black" {}
		_CFULCMask("CFULC Mask", 2D) = "black" {}		
		_EarNeckMask("EarNeckMask", 2D) = "black" {}		
		_MicroSmoothnessMod("Micro Smoothness Mod", Range(-1.5 , 1.5)) = 0
		_RSmoothnessMod("Nose/R Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_GSmoothnessMod("Mouth/G Smoothness Mod", Range( -1.5 , 1.5)) = 0		
		_BSmoothnessMod("Upper Lid/B Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_ASmoothnessMod("Inner Lid/A Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_EarSmoothnessMod("Ear Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_NeckSmoothnessMod("Neck Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_CheekSmoothnessMod("Cheek Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_ForeheadSmoothnessMod("Forehead Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_UpperLipSmoothnessMod("Upper Lip Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_ChinSmoothnessMod("Chin Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_UnmaskedSmoothnessMod("Unmasked Smoothness Mod", Range( -1.5 , 1.5)) = 0
		_RScatterScale("Nose/R Scatter Scale", Range( 0 , 2)) = 1
		_GScatterScale("Mouth/G Scatter Scale", Range( 0 , 2)) = 1
		_BScatterScale("Upper Lid/B Scatter Scale", Range( 0 , 2)) = 1
		_AScatterScale("Inner Lid/A Scatter Scale", Range( 0 , 2)) = 1
		_EarScatterScale("Ear Scatter Scale", Range( 0 , 2)) = 1
		_NeckScatterScale("Neck Scatter Scale", Range( 0 , 2)) = 1
		_CheekScatterScale("Cheek Scatter Scale", Range( 0 , 2)) = 1
		_ForeheadScatterScale("Forehead Scatter Scale", Range( 0 , 2)) = 1
		_UpperLipScatterScale("Upper Lip Scatter Scale", Range( 0 , 2)) = 1
		_ChinScatterScale("Chin Scatter Scale", Range( 0 , 2)) = 1
		_UnmaskedScatterScale("Unmasked Scatter Scale", Range( 0 , 2)) = 1
		[HideInInspector]_CSubsurfaceAmbient("CSubsurfaceAmbient", Range( 0 , 1)) = 0.1
		[HideInInspector]_CSubsurfaceNormalDistortion("CSubsurfaceNormalDistortion", Range( 0 , 1)) = 0.35
		[HideInInspector]_CSubsurfaceStrength("CSubsurfaceStrength", Range( 0 , 8)) = 1
		[HideInInspector]_CSubsurfaceScattering("CSubsurfaceScattering", Range( 0 , 12)) = 2
		[HideInInspector]_CTransmissionShadow("CTransmissionShadow", Range( 0 , 1)) = 0.5
		[HideInInspector]_CSubsurfaceShadow("CSubsurfaceShadow", Range(0 , 1)) = 0.5
		[HideInInspector]_CSubsurfaceDirect("CSubsurfaceDirect", Range(0 , 1)) = 0.9
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[ASEEnd][Toggle(BOOLEAN_IS_HEAD_ON)] BOOLEAN_IS_HEAD("Is Head", Float) = 1

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" }
		Cull Back
		AlphaToMask Off
		
		HLSLINCLUDE
		#pragma target 2.0

		#pragma prefer_hlslcc gles
		#pragma exclude_renderers d3d11_9x 

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
			#define _TRANSLUCENCY_ASE 1
			#define _TRANSMISSION_ASE 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100500

			
			#pragma multi_compile _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS _ADDITIONAL_OFF
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SSSMap_ST;
			float4 _RGBAMask_ST;
			float4 _EarNeckMask_ST;
			float4 _NormalBlendMap_ST;
			float4 _MaskMap_ST;
			float4 _NormalMap_ST;
			float4 _DiffuseMap_ST;
			float4 _ColorBlendMap_ST;
			float4 _SubsurfaceFalloff;
			float4 _ThicknessMap_ST;
			float4 _CFULCMask_ST;
			float _UpperLipScatterScale;
			float _CheekScatterScale;
			float _NeckSmoothnessMod;
			float _ChinSmoothnessMod;
			float _ForeheadScatterScale;
			float _EarSmoothnessMod;
			float _ChinScatterScale;
			float _MicroNormalTiling;
			float _EarScatterScale;
			float _MicroNormalStrength;
			float _SmoothnessMin;
			float _SmoothnessMax;
			float _SmoothnessPower;
			float _MicroSmoothnessMod;
			float _AOStrength;
			float _ThicknessScale;
			float _NeckScatterScale;
			float _UpperLipSmoothnessMod;
			float _UnmaskedScatterScale;
			float _CheekSmoothnessMod;
			float _CSubsurfaceScattering;
			float _CSubsurfaceDirect;
			float _CSubsurfaceNormalDistortion;
			float _CTransmissionShadow;
			float _CSubsurfaceAmbient;
			float _CSubsurfaceShadow;
			float _ColorBlendStrength;
			float _NormalStrength;
			float _NormalBlendStrength;
			float _SubsurfaceScale;
			float _RSmoothnessMod;
			float _GSmoothnessMod;
			float _BSmoothnessMod;
			float _ASmoothnessMod;
			float _RScatterScale;
			float _GScatterScale;
			float _BScatterScale;
			float _AScatterScale;
			float _UnmaskedSmoothnessMod;
			float _ForeheadSmoothnessMod;
			float _CSubsurfaceStrength;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _DiffuseMap;
			sampler2D _ColorBlendMap;
			sampler2D _NormalMap;
			sampler2D _NormalBlendMap;
			sampler2D _RGBAMask;
			sampler2D _CFULCMask;
			sampler2D _EarNeckMask;
			sampler2D _MicroNormalMap;
			sampler2D _MaskMap;
			sampler2D _ThicknessMap;
			sampler2D _SSSMap;


			void HeadMask179( float4 In1, float4 Mod1, float4 Scatter1, float UMMS, float UMSS, out float SmoothnessMod, out float ScatterMask )
			{
				float mask = saturate(In1.r + In1.g + In1.b + In1.a);
				float unmask = 1.0 - mask;
				SmoothnessMod = dot(In1, Mod1) + (UMMS * unmask);
				ScatterMask = dot(In1, Scatter1) + (UMSS * unmask);
				return;
			}
			
			void HeadMask156( float4 In1, float4 In2, float4 In3, float4 Mod1, float4 Mod2, float4 Mod3, float4 Scatter1, float4 Scatter2, float4 Scatter3, float UMMS, float UMSS, out float SmoothnessMod, out float ScatterMask )
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
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

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
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
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
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_DiffuseMap = IN.ase_texcoord7.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				float4 tex2DNode1 = tex2D( _DiffuseMap, uv_DiffuseMap );
				float2 uv_ColorBlendMap = IN.ase_texcoord7.xy * _ColorBlendMap_ST.xy + _ColorBlendMap_ST.zw;
				float4 blendOpSrc13 = tex2D( _ColorBlendMap, uv_ColorBlendMap );
				float4 blendOpDest13 = tex2DNode1;
				float4 lerpBlendMode13 = lerp(blendOpDest13,(( blendOpDest13 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest13 ) * ( 1.0 - blendOpSrc13 ) ) : ( 2.0 * blendOpDest13 * blendOpSrc13 ) ),_ColorBlendStrength);
				#ifdef BOOLEAN_IS_HEAD_ON
				float4 staticSwitch72 = ( saturate( lerpBlendMode13 ));
				#else
				float4 staticSwitch72 = tex2DNode1;
				#endif
				
				float2 uv_NormalMap = IN.ase_texcoord7.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack48 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalStrength );
				unpack48.z = lerp( 1, unpack48.z, saturate(_NormalStrength) );
				float3 tex2DNode48 = unpack48;
				float2 uv_NormalBlendMap = IN.ase_texcoord7.xy * _NormalBlendMap_ST.xy + _NormalBlendMap_ST.zw;
				float localHeadMask179 = ( 0.0 );
				float2 uv_RGBAMask = IN.ase_texcoord7.xy * _RGBAMask_ST.xy + _RGBAMask_ST.zw;
				float4 tex2DNode123 = tex2D( _RGBAMask, uv_RGBAMask );
				float4 In1179 = tex2DNode123;
				float4 appendResult150 = (float4(_RSmoothnessMod , _GSmoothnessMod , _BSmoothnessMod , _ASmoothnessMod));
				float4 Mod1179 = appendResult150;
				float4 appendResult153 = (float4(_RScatterScale , _GScatterScale , _BScatterScale , _AScatterScale));
				float4 Scatter1179 = appendResult153;
				float UMMS179 = _UnmaskedSmoothnessMod;
				float UMSS179 = _UnmaskedScatterScale;
				float SmoothnessMod179 = 0.0;
				float ScatterMask179 = 0.0;
				HeadMask179( In1179 , Mod1179 , Scatter1179 , UMMS179 , UMSS179 , SmoothnessMod179 , ScatterMask179 );
				float localHeadMask156 = ( 0.0 );
				float4 In1156 = tex2DNode123;
				float2 uv_CFULCMask = IN.ase_texcoord7.xy * _CFULCMask_ST.xy + _CFULCMask_ST.zw;
				float4 In2156 = tex2D( _CFULCMask, uv_CFULCMask );
				float2 uv_EarNeckMask = IN.ase_texcoord7.xy * _EarNeckMask_ST.xy + _EarNeckMask_ST.zw;
				float4 In3156 = tex2D( _EarNeckMask, uv_EarNeckMask );
				float4 Mod1156 = appendResult150;
				float4 appendResult151 = (float4(_CheekSmoothnessMod , _ForeheadSmoothnessMod , _UpperLipSmoothnessMod , _ChinSmoothnessMod));
				float4 Mod2156 = appendResult151;
				float4 appendResult152 = (float4(_NeckSmoothnessMod , _EarSmoothnessMod , 0.0 , 0.0));
				float4 Mod3156 = appendResult152;
				float4 Scatter1156 = appendResult153;
				float4 appendResult154 = (float4(_CheekScatterScale , _ForeheadScatterScale , _UpperLipScatterScale , _ChinScatterScale));
				float4 Scatter2156 = appendResult154;
				float4 appendResult155 = (float4(_NeckScatterScale , _EarScatterScale , 0.0 , 0.0));
				float4 Scatter3156 = appendResult155;
				float UMMS156 = _UnmaskedSmoothnessMod;
				float UMSS156 = _UnmaskedScatterScale;
				float SmoothnessMod156 = 0.0;
				float ScatterMask156 = 0.0;
				HeadMask156( In1156 , In2156 , In3156 , Mod1156 , Mod2156 , Mod3156 , Scatter1156 , Scatter2156 , Scatter3156 , UMMS156 , UMSS156 , SmoothnessMod156 , ScatterMask156 );
				#ifdef BOOLEAN_IS_HEAD_ON
				float staticSwitch169 = ScatterMask156;
				#else
				float staticSwitch169 = ScatterMask179;
				#endif
				float temp_output_172_0 = ( _SubsurfaceScale * staticSwitch169 );
				float lerpResult192 = lerp( 1.0 , 0.33 , saturate( ( temp_output_172_0 * 0.35 ) ));
				float3 unpack50 = UnpackNormalScale( tex2D( _NormalBlendMap, uv_NormalBlendMap ), ( _NormalBlendStrength * lerpResult192 ) );
				unpack50.z = lerp( 1, unpack50.z, saturate(( _NormalBlendStrength * lerpResult192 )) );
				#ifdef BOOLEAN_IS_HEAD_ON
				float3 staticSwitch71 = BlendNormal( tex2DNode48 , unpack50 );
				#else
				float3 staticSwitch71 = tex2DNode48;
				#endif
				float2 uv_MaskMap = IN.ase_texcoord7.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				float4 tex2DNode32 = tex2D( _MaskMap, uv_MaskMap );
				float3 unpack52 = UnpackNormalScale( tex2D( _MicroNormalMap, ( IN.ase_texcoord7.xy * _MicroNormalTiling ) ), ( lerpResult192 * _MicroNormalStrength * tex2DNode32.b ) );
				unpack52.z = lerp( 1, unpack52.z, saturate(( lerpResult192 * _MicroNormalStrength * tex2DNode32.b )) );
				
				float lerpResult41 = lerp( _SmoothnessMin , _SmoothnessMax , pow( tex2DNode32.a , _SmoothnessPower ));
				#ifdef BOOLEAN_IS_HEAD_ON
				float staticSwitch170 = SmoothnessMod156;
				#else
				float staticSwitch170 = SmoothnessMod179;
				#endif
				
				float2 uv_ThicknessMap = IN.ase_texcoord7.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				
				float2 uv_SSSMap = IN.ase_texcoord7.xy * _SSSMap_ST.xy + _SSSMap_ST.zw;
				float4 tex2DNode28 = tex2D( _SSSMap, uv_SSSMap );
				
				float3 Albedo = staticSwitch72.rgb;
				float3 Normal = BlendNormal( staticSwitch71 , unpack52 );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = tex2DNode32.r;
				float Smoothness = ( lerpResult41 + ( staticSwitch170 + _MicroSmoothnessMod ) );
				float Occlusion = ( 1.0 - ( ( 1.0 - tex2DNode32.g ) * _AOStrength ) );
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = ( tex2D( _ThicknessMap, uv_ThicknessMap ).g * _ThicknessScale * _SubsurfaceFalloff ).rgb;
				float3 Translucency = ( _SubsurfaceFalloff * ( tex2DNode28.g * tex2DNode28.g * temp_output_172_0 ) ).rgb;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
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
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _CTransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _CSubsurfaceShadow;
					float normal = _CSubsurfaceNormalDistortion;
					float scattering = _CSubsurfaceScattering;
					float direct = _CSubsurfaceDirect;
					float ambient = _CSubsurfaceAmbient;
					float strength = _CSubsurfaceStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

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
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
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
			#define _TRANSLUCENCY_ASE 1
			#define _TRANSMISSION_ASE 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag
#if ASE_SRP_VERSION >= 110000
			#pragma multi_compile _ _CASTING_PUNCTUAL_LIGHT_SHADOW
#endif
			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SSSMap_ST;
			float4 _RGBAMask_ST;
			float4 _EarNeckMask_ST;
			float4 _NormalBlendMap_ST;
			float4 _MaskMap_ST;
			float4 _NormalMap_ST;
			float4 _DiffuseMap_ST;
			float4 _ColorBlendMap_ST;
			float4 _SubsurfaceFalloff;
			float4 _ThicknessMap_ST;
			float4 _CFULCMask_ST;
			float _UpperLipScatterScale;
			float _CheekScatterScale;
			float _NeckSmoothnessMod;
			float _ChinSmoothnessMod;
			float _ForeheadScatterScale;
			float _EarSmoothnessMod;
			float _ChinScatterScale;
			float _MicroNormalTiling;
			float _EarScatterScale;
			float _MicroNormalStrength;
			float _SmoothnessMin;
			float _SmoothnessMax;
			float _SmoothnessPower;
			float _MicroSmoothnessMod;
			float _AOStrength;
			float _ThicknessScale;
			float _NeckScatterScale;
			float _UpperLipSmoothnessMod;
			float _UnmaskedScatterScale;
			float _CheekSmoothnessMod;
			float _CSubsurfaceScattering;
			float _CSubsurfaceDirect;
			float _CSubsurfaceNormalDistortion;
			float _CTransmissionShadow;
			float _CSubsurfaceAmbient;
			float _CSubsurfaceShadow;
			float _ColorBlendStrength;
			float _NormalStrength;
			float _NormalBlendStrength;
			float _SubsurfaceScale;
			float _RSmoothnessMod;
			float _GSmoothnessMod;
			float _BSmoothnessMod;
			float _ASmoothnessMod;
			float _RScatterScale;
			float _GScatterScale;
			float _BScatterScale;
			float _AScatterScale;
			float _UnmaskedSmoothnessMod;
			float _ForeheadSmoothnessMod;
			float _CSubsurfaceStrength;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			
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
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
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
				float DepthValue = 0;
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
			#define _TRANSLUCENCY_ASE 1
			#define _TRANSMISSION_ASE 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SSSMap_ST;
			float4 _RGBAMask_ST;
			float4 _EarNeckMask_ST;
			float4 _NormalBlendMap_ST;
			float4 _MaskMap_ST;
			float4 _NormalMap_ST;
			float4 _DiffuseMap_ST;
			float4 _ColorBlendMap_ST;
			float4 _SubsurfaceFalloff;
			float4 _ThicknessMap_ST;
			float4 _CFULCMask_ST;
			float _UpperLipScatterScale;
			float _CheekScatterScale;
			float _NeckSmoothnessMod;
			float _ChinSmoothnessMod;
			float _ForeheadScatterScale;
			float _EarSmoothnessMod;
			float _ChinScatterScale;
			float _MicroNormalTiling;
			float _EarScatterScale;
			float _MicroNormalStrength;
			float _SmoothnessMin;
			float _SmoothnessMax;
			float _SmoothnessPower;
			float _MicroSmoothnessMod;
			float _AOStrength;
			float _ThicknessScale;
			float _NeckScatterScale;
			float _UpperLipSmoothnessMod;
			float _UnmaskedScatterScale;
			float _CheekSmoothnessMod;
			float _CSubsurfaceScattering;
			float _CSubsurfaceDirect;
			float _CSubsurfaceNormalDistortion;
			float _CTransmissionShadow;
			float _CSubsurfaceAmbient;
			float _CSubsurfaceShadow;
			float _ColorBlendStrength;
			float _NormalStrength;
			float _NormalBlendStrength;
			float _SubsurfaceScale;
			float _RSmoothnessMod;
			float _GSmoothnessMod;
			float _BSmoothnessMod;
			float _ASmoothnessMod;
			float _RScatterScale;
			float _GScatterScale;
			float _BScatterScale;
			float _AScatterScale;
			float _UnmaskedSmoothnessMod;
			float _ForeheadSmoothnessMod;
			float _CSubsurfaceStrength;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
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

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
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
				float DepthValue = 0;
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
			#define _TRANSLUCENCY_ASE 1
			#define _TRANSMISSION_ASE 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

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
			float4 _SSSMap_ST;
			float4 _RGBAMask_ST;
			float4 _EarNeckMask_ST;
			float4 _NormalBlendMap_ST;
			float4 _MaskMap_ST;
			float4 _NormalMap_ST;
			float4 _DiffuseMap_ST;
			float4 _ColorBlendMap_ST;
			float4 _SubsurfaceFalloff;
			float4 _ThicknessMap_ST;
			float4 _CFULCMask_ST;
			float _UpperLipScatterScale;
			float _CheekScatterScale;
			float _NeckSmoothnessMod;
			float _ChinSmoothnessMod;
			float _ForeheadScatterScale;
			float _EarSmoothnessMod;
			float _ChinScatterScale;
			float _MicroNormalTiling;
			float _EarScatterScale;
			float _MicroNormalStrength;
			float _SmoothnessMin;
			float _SmoothnessMax;
			float _SmoothnessPower;
			float _MicroSmoothnessMod;
			float _AOStrength;
			float _ThicknessScale;
			float _NeckScatterScale;
			float _UpperLipSmoothnessMod;
			float _UnmaskedScatterScale;
			float _CheekSmoothnessMod;
			float _CSubsurfaceScattering;
			float _CSubsurfaceDirect;
			float _CSubsurfaceNormalDistortion;
			float _CTransmissionShadow;
			float _CSubsurfaceAmbient;
			float _CSubsurfaceShadow;
			float _ColorBlendStrength;
			float _NormalStrength;
			float _NormalBlendStrength;
			float _SubsurfaceScale;
			float _RSmoothnessMod;
			float _GSmoothnessMod;
			float _BSmoothnessMod;
			float _ASmoothnessMod;
			float _RScatterScale;
			float _GScatterScale;
			float _BScatterScale;
			float _AScatterScale;
			float _UnmaskedSmoothnessMod;
			float _ForeheadSmoothnessMod;
			float _CSubsurfaceStrength;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _DiffuseMap;
			sampler2D _ColorBlendMap;


			
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

			#if defined(TESSELLATION_ON)
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

				float2 uv_DiffuseMap = IN.ase_texcoord2.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				float4 tex2DNode1 = tex2D( _DiffuseMap, uv_DiffuseMap );
				float2 uv_ColorBlendMap = IN.ase_texcoord2.xy * _ColorBlendMap_ST.xy + _ColorBlendMap_ST.zw;
				float4 blendOpSrc13 = tex2D( _ColorBlendMap, uv_ColorBlendMap );
				float4 blendOpDest13 = tex2DNode1;
				float4 lerpBlendMode13 = lerp(blendOpDest13,(( blendOpDest13 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest13 ) * ( 1.0 - blendOpSrc13 ) ) : ( 2.0 * blendOpDest13 * blendOpSrc13 ) ),_ColorBlendStrength);
				#ifdef BOOLEAN_IS_HEAD_ON
				float4 staticSwitch72 = ( saturate( lerpBlendMode13 ));
				#else
				float4 staticSwitch72 = tex2DNode1;
				#endif
				
				
				float3 Albedo = staticSwitch72.rgb;
				float3 Emission = 0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
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
			#define _TRANSLUCENCY_ASE 1
			#define _TRANSMISSION_ASE 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

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
			float4 _SSSMap_ST;
			float4 _RGBAMask_ST;
			float4 _EarNeckMask_ST;
			float4 _NormalBlendMap_ST;
			float4 _MaskMap_ST;
			float4 _NormalMap_ST;
			float4 _DiffuseMap_ST;
			float4 _ColorBlendMap_ST;
			float4 _SubsurfaceFalloff;
			float4 _ThicknessMap_ST;
			float4 _CFULCMask_ST;
			float _UpperLipScatterScale;
			float _CheekScatterScale;
			float _NeckSmoothnessMod;
			float _ChinSmoothnessMod;
			float _ForeheadScatterScale;
			float _EarSmoothnessMod;
			float _ChinScatterScale;
			float _MicroNormalTiling;
			float _EarScatterScale;
			float _MicroNormalStrength;
			float _SmoothnessMin;
			float _SmoothnessMax;
			float _SmoothnessPower;
			float _MicroSmoothnessMod;
			float _AOStrength;
			float _ThicknessScale;
			float _NeckScatterScale;
			float _UpperLipSmoothnessMod;
			float _UnmaskedScatterScale;
			float _CheekSmoothnessMod;
			float _CSubsurfaceScattering;
			float _CSubsurfaceDirect;
			float _CSubsurfaceNormalDistortion;
			float _CTransmissionShadow;
			float _CSubsurfaceAmbient;
			float _CSubsurfaceShadow;
			float _ColorBlendStrength;
			float _NormalStrength;
			float _NormalBlendStrength;
			float _SubsurfaceScale;
			float _RSmoothnessMod;
			float _GSmoothnessMod;
			float _BSmoothnessMod;
			float _ASmoothnessMod;
			float _RScatterScale;
			float _GScatterScale;
			float _BScatterScale;
			float _AScatterScale;
			float _UnmaskedSmoothnessMod;
			float _ForeheadSmoothnessMod;
			float _CSubsurfaceStrength;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _DiffuseMap;
			sampler2D _ColorBlendMap;


			
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

			#if defined(TESSELLATION_ON)
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

				float2 uv_DiffuseMap = IN.ase_texcoord2.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				float4 tex2DNode1 = tex2D( _DiffuseMap, uv_DiffuseMap );
				float2 uv_ColorBlendMap = IN.ase_texcoord2.xy * _ColorBlendMap_ST.xy + _ColorBlendMap_ST.zw;
				float4 blendOpSrc13 = tex2D( _ColorBlendMap, uv_ColorBlendMap );
				float4 blendOpDest13 = tex2DNode1;
				float4 lerpBlendMode13 = lerp(blendOpDest13,(( blendOpDest13 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest13 ) * ( 1.0 - blendOpSrc13 ) ) : ( 2.0 * blendOpDest13 * blendOpSrc13 ) ),_ColorBlendStrength);
				#ifdef BOOLEAN_IS_HEAD_ON
				float4 staticSwitch72 = ( saturate( lerpBlendMode13 ));
				#else
				float4 staticSwitch72 = tex2DNode1;
				#endif
				
				
				float3 Albedo = staticSwitch72.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

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
			#define _TRANSLUCENCY_ASE 1
			#define _TRANSMISSION_ASE 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
				float3 worldNormal : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SSSMap_ST;
			float4 _RGBAMask_ST;
			float4 _EarNeckMask_ST;
			float4 _NormalBlendMap_ST;
			float4 _MaskMap_ST;
			float4 _NormalMap_ST;
			float4 _DiffuseMap_ST;
			float4 _ColorBlendMap_ST;
			float4 _SubsurfaceFalloff;
			float4 _ThicknessMap_ST;
			float4 _CFULCMask_ST;
			float _UpperLipScatterScale;
			float _CheekScatterScale;
			float _NeckSmoothnessMod;
			float _ChinSmoothnessMod;
			float _ForeheadScatterScale;
			float _EarSmoothnessMod;
			float _ChinScatterScale;
			float _MicroNormalTiling;
			float _EarScatterScale;
			float _MicroNormalStrength;
			float _SmoothnessMin;
			float _SmoothnessMax;
			float _SmoothnessPower;
			float _MicroSmoothnessMod;
			float _AOStrength;
			float _ThicknessScale;
			float _NeckScatterScale;
			float _UpperLipSmoothnessMod;
			float _UnmaskedScatterScale;
			float _CheekSmoothnessMod;
			float _CSubsurfaceScattering;
			float _CSubsurfaceDirect;
			float _CSubsurfaceNormalDistortion;
			float _CTransmissionShadow;
			float _CSubsurfaceAmbient;
			float _CSubsurfaceShadow;
			float _ColorBlendStrength;
			float _NormalStrength;
			float _NormalBlendStrength;
			float _SubsurfaceScale;
			float _RSmoothnessMod;
			float _GSmoothnessMod;
			float _BSmoothnessMod;
			float _ASmoothnessMod;
			float _RScatterScale;
			float _GScatterScale;
			float _BScatterScale;
			float _AScatterScale;
			float _UnmaskedSmoothnessMod;
			float _ForeheadSmoothnessMod;
			float _CSubsurfaceStrength;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
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
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
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
				float DepthValue = 0;
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
				
				return float4(PackNormalOctRectEncode(TransformWorldToViewDir(IN.worldNormal, true)), 0.0, 0.0);
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
			#define _TRANSLUCENCY_ASE 1
			#define _TRANSMISSION_ASE 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100500

			
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _GBUFFER_NORMALS_OCT
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#pragma shader_feature_local BOOLEAN_IS_HEAD_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SSSMap_ST;
			float4 _RGBAMask_ST;
			float4 _EarNeckMask_ST;
			float4 _NormalBlendMap_ST;
			float4 _MaskMap_ST;
			float4 _NormalMap_ST;
			float4 _DiffuseMap_ST;
			float4 _ColorBlendMap_ST;
			float4 _SubsurfaceFalloff;
			float4 _ThicknessMap_ST;
			float4 _CFULCMask_ST;
			float _UpperLipScatterScale;
			float _CheekScatterScale;
			float _NeckSmoothnessMod;
			float _ChinSmoothnessMod;
			float _ForeheadScatterScale;
			float _EarSmoothnessMod;
			float _ChinScatterScale;
			float _MicroNormalTiling;
			float _EarScatterScale;
			float _MicroNormalStrength;
			float _SmoothnessMin;
			float _SmoothnessMax;
			float _SmoothnessPower;
			float _MicroSmoothnessMod;
			float _AOStrength;
			float _ThicknessScale;
			float _NeckScatterScale;
			float _UpperLipSmoothnessMod;
			float _UnmaskedScatterScale;
			float _CheekSmoothnessMod;
			float _CSubsurfaceScattering;
			float _CSubsurfaceDirect;
			float _CSubsurfaceNormalDistortion;
			float _CTransmissionShadow;
			float _CSubsurfaceAmbient;
			float _CSubsurfaceShadow;
			float _ColorBlendStrength;
			float _NormalStrength;
			float _NormalBlendStrength;
			float _SubsurfaceScale;
			float _RSmoothnessMod;
			float _GSmoothnessMod;
			float _BSmoothnessMod;
			float _ASmoothnessMod;
			float _RScatterScale;
			float _GScatterScale;
			float _BScatterScale;
			float _AScatterScale;
			float _UnmaskedSmoothnessMod;
			float _ForeheadSmoothnessMod;
			float _CSubsurfaceStrength;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _DiffuseMap;
			sampler2D _ColorBlendMap;
			sampler2D _NormalMap;
			sampler2D _NormalBlendMap;
			sampler2D _RGBAMask;
			sampler2D _CFULCMask;
			sampler2D _EarNeckMask;
			sampler2D _MicroNormalMap;
			sampler2D _MaskMap;
			sampler2D _ThicknessMap;
			sampler2D _SSSMap;


			void HeadMask179( float4 In1, float4 Mod1, float4 Scatter1, float UMMS, float UMSS, out float SmoothnessMod, out float ScatterMask )
			{
				float mask = saturate(In1.r + In1.g + In1.b + In1.a);
				float unmask = 1.0 - mask;
				SmoothnessMod = dot(In1, Mod1) + (UMMS * unmask);
				ScatterMask = dot(In1, Scatter1) + (UMSS * unmask);
				return;
			}
			
			void HeadMask156( float4 In1, float4 In2, float4 In3, float4 Mod1, float4 Mod2, float4 Mod3, float4 Scatter1, float4 Scatter2, float4 Scatter3, float UMMS, float UMSS, out float SmoothnessMod, out float ScatterMask )
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
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

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
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
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
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_DiffuseMap = IN.ase_texcoord7.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				float4 tex2DNode1 = tex2D( _DiffuseMap, uv_DiffuseMap );
				float2 uv_ColorBlendMap = IN.ase_texcoord7.xy * _ColorBlendMap_ST.xy + _ColorBlendMap_ST.zw;
				float4 blendOpSrc13 = tex2D( _ColorBlendMap, uv_ColorBlendMap );
				float4 blendOpDest13 = tex2DNode1;
				float4 lerpBlendMode13 = lerp(blendOpDest13,(( blendOpDest13 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest13 ) * ( 1.0 - blendOpSrc13 ) ) : ( 2.0 * blendOpDest13 * blendOpSrc13 ) ),_ColorBlendStrength);
				#ifdef BOOLEAN_IS_HEAD_ON
				float4 staticSwitch72 = ( saturate( lerpBlendMode13 ));
				#else
				float4 staticSwitch72 = tex2DNode1;
				#endif
				
				float2 uv_NormalMap = IN.ase_texcoord7.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack48 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalStrength );
				unpack48.z = lerp( 1, unpack48.z, saturate(_NormalStrength) );
				float3 tex2DNode48 = unpack48;
				float2 uv_NormalBlendMap = IN.ase_texcoord7.xy * _NormalBlendMap_ST.xy + _NormalBlendMap_ST.zw;
				float localHeadMask179 = ( 0.0 );
				float2 uv_RGBAMask = IN.ase_texcoord7.xy * _RGBAMask_ST.xy + _RGBAMask_ST.zw;
				float4 tex2DNode123 = tex2D( _RGBAMask, uv_RGBAMask );
				float4 In1179 = tex2DNode123;
				float4 appendResult150 = (float4(_RSmoothnessMod , _GSmoothnessMod , _BSmoothnessMod , _ASmoothnessMod));
				float4 Mod1179 = appendResult150;
				float4 appendResult153 = (float4(_RScatterScale , _GScatterScale , _BScatterScale , _AScatterScale));
				float4 Scatter1179 = appendResult153;
				float UMMS179 = _UnmaskedSmoothnessMod;
				float UMSS179 = _UnmaskedScatterScale;
				float SmoothnessMod179 = 0.0;
				float ScatterMask179 = 0.0;
				HeadMask179( In1179 , Mod1179 , Scatter1179 , UMMS179 , UMSS179 , SmoothnessMod179 , ScatterMask179 );
				float localHeadMask156 = ( 0.0 );
				float4 In1156 = tex2DNode123;
				float2 uv_CFULCMask = IN.ase_texcoord7.xy * _CFULCMask_ST.xy + _CFULCMask_ST.zw;
				float4 In2156 = tex2D( _CFULCMask, uv_CFULCMask );
				float2 uv_EarNeckMask = IN.ase_texcoord7.xy * _EarNeckMask_ST.xy + _EarNeckMask_ST.zw;
				float4 In3156 = tex2D( _EarNeckMask, uv_EarNeckMask );
				float4 Mod1156 = appendResult150;
				float4 appendResult151 = (float4(_CheekSmoothnessMod , _ForeheadSmoothnessMod , _UpperLipSmoothnessMod , _ChinSmoothnessMod));
				float4 Mod2156 = appendResult151;
				float4 appendResult152 = (float4(_NeckSmoothnessMod , _EarSmoothnessMod , 0.0 , 0.0));
				float4 Mod3156 = appendResult152;
				float4 Scatter1156 = appendResult153;
				float4 appendResult154 = (float4(_CheekScatterScale , _ForeheadScatterScale , _UpperLipScatterScale , _ChinScatterScale));
				float4 Scatter2156 = appendResult154;
				float4 appendResult155 = (float4(_NeckScatterScale , _EarScatterScale , 0.0 , 0.0));
				float4 Scatter3156 = appendResult155;
				float UMMS156 = _UnmaskedSmoothnessMod;
				float UMSS156 = _UnmaskedScatterScale;
				float SmoothnessMod156 = 0.0;
				float ScatterMask156 = 0.0;
				HeadMask156( In1156 , In2156 , In3156 , Mod1156 , Mod2156 , Mod3156 , Scatter1156 , Scatter2156 , Scatter3156 , UMMS156 , UMSS156 , SmoothnessMod156 , ScatterMask156 );
				#ifdef BOOLEAN_IS_HEAD_ON
				float staticSwitch169 = ScatterMask156;
				#else
				float staticSwitch169 = ScatterMask179;
				#endif
				float temp_output_172_0 = ( _SubsurfaceScale * staticSwitch169 );
				float lerpResult192 = lerp( 1.0 , 0.33 , saturate( ( temp_output_172_0 * 0.35 ) ));
				float3 unpack50 = UnpackNormalScale( tex2D( _NormalBlendMap, uv_NormalBlendMap ), ( _NormalBlendStrength * lerpResult192 ) );
				unpack50.z = lerp( 1, unpack50.z, saturate(( _NormalBlendStrength * lerpResult192 )) );
				#ifdef BOOLEAN_IS_HEAD_ON
				float3 staticSwitch71 = BlendNormal( tex2DNode48 , unpack50 );
				#else
				float3 staticSwitch71 = tex2DNode48;
				#endif
				float2 uv_MaskMap = IN.ase_texcoord7.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				float4 tex2DNode32 = tex2D( _MaskMap, uv_MaskMap );
				float3 unpack52 = UnpackNormalScale( tex2D( _MicroNormalMap, ( IN.ase_texcoord7.xy * _MicroNormalTiling ) ), ( lerpResult192 * _MicroNormalStrength * tex2DNode32.b ) );
				unpack52.z = lerp( 1, unpack52.z, saturate(( lerpResult192 * _MicroNormalStrength * tex2DNode32.b )) );
				
				float lerpResult41 = lerp( _SmoothnessMin , _SmoothnessMax , pow( tex2DNode32.a , _SmoothnessPower ));
				#ifdef BOOLEAN_IS_HEAD_ON
				float staticSwitch170 = SmoothnessMod156;
				#else
				float staticSwitch170 = SmoothnessMod179;
				#endif
				
				float2 uv_ThicknessMap = IN.ase_texcoord7.xy * _ThicknessMap_ST.xy + _ThicknessMap_ST.zw;
				
				float2 uv_SSSMap = IN.ase_texcoord7.xy * _SSSMap_ST.xy + _SSSMap_ST.zw;
				float4 tex2DNode28 = tex2D( _SSSMap, uv_SSSMap );
				
				float3 Albedo = staticSwitch72.rgb;
				float3 Normal = BlendNormal( staticSwitch71 , unpack52 );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = tex2DNode32.r;
				float Smoothness = ( lerpResult41 + ( staticSwitch170 + _MicroSmoothnessMod ) );
				float Occlusion = ( 1.0 - ( ( 1.0 - tex2DNode32.g ) * _AOStrength ) );
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = ( tex2D( _ThicknessMap, uv_ThicknessMap ).g * _ThicknessScale * _SubsurfaceFalloff ).rgb;
				float3 Translucency = ( _SubsurfaceFalloff * ( tex2DNode28.g * tex2DNode28.g * temp_output_172_0 ) ).rgb;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
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
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				BRDFData brdfData;
				InitializeBRDFData( Albedo, Metallic, Specular, Smoothness, Alpha, brdfData);
				half4 color;
				color.rgb = GlobalIllumination( brdfData, inputData.bakedGI, Occlusion, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _CTransmissionShadow;
				
					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;
				
					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );
				
							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif
				
				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _CSubsurfaceShadow;
					float normal = _CSubsurfaceNormalDistortion;
					float scattering = _CSubsurfaceScattering;
					float direct = _CSubsurfaceDirect;
					float ambient = _CSubsurfaceAmbient;
					float strength = _CSubsurfaceStrength;
				
					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
				
					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;
				
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
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif
				
				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal, 0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
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
				
				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb);
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18933
259;120;1129;791;1994.501;-1960.983;1.408552;True;False
Node;AmplifyShaderEditor.RangedFloatNode;126;-6099.428,1537.883;Inherit;False;Property;_RSmoothnessMod;Nose/R Smoothness Mod;26;0;Create;False;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-6099.428,1611.75;Inherit;False;Property;_GSmoothnessMod;Mouth/G Smoothness Mod;27;0;Create;False;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-6099.435,1767.675;Inherit;False;Property;_ASmoothnessMod;Inner Lid/A Smoothness Mod;29;0;Create;False;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;128;-6098.447,1687.706;Inherit;False;Property;_BSmoothnessMod;Upper Lid/B Smoothness Mod;28;0;Create;False;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;143;-5444.633,2520.471;Inherit;False;Property;_ChinScatterScale;Chin Scatter Scale;46;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-6098.568,1928.366;Inherit;False;Property;_ForeheadSmoothnessMod;Forehead Smoothness Mod;33;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;145;-5444.333,2680.471;Inherit;False;Property;_EarScatterScale;Ear Scatter Scale;41;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-5448.734,2363.871;Inherit;False;Property;_ForeheadScatterScale;Forehead Scatter Scale;44;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;130;-6098.498,1849.372;Inherit;False;Property;_CheekSmoothnessMod;Cheek Smoothness Mod;32;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;137;-5448.335,2057.372;Inherit;False;Property;_GScatterScale;Mouth/G Scatter Scale;38;0;Create;False;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;135;-6092.627,2233.231;Inherit;False;Property;_EarSmoothnessMod;Ear Smoothness Mod;30;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;139;-5447.335,2204.372;Inherit;False;Property;_AScatterScale;Inner Lid/A Scatter Scale;40;0;Create;False;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-6095.918,2155.163;Inherit;False;Property;_NeckSmoothnessMod;Neck Smoothness Mod;31;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;142;-5443.734,2444.171;Inherit;False;Property;_UpperLipScatterScale;Upper Lip Scatter Scale;45;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;150;-5710.346,1669.043;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-5450.636,2289.371;Inherit;False;Property;_CheekScatterScale;Cheek Scatter Scale;43;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;121;-5495.797,1251.577;Inherit;True;Property;_CFULCMask;CFULCMask;21;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;120;-5506.856,1029.434;Inherit;True;Property;_RGBAMask;RGBAMask;20;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;144;-5444.133,2598.071;Inherit;False;Property;_NeckScatterScale;Neck Scatter Scale;42;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;133;-6098.625,2078.423;Inherit;False;Property;_ChinSmoothnessMod;Chin Smoothness Mod;35;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;122;-5492.797,1472.577;Inherit;True;Property;_EarNeckMask;EarNeckMask;23;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;138;-5446.335,2133.372;Inherit;False;Property;_BScatterScale;Upper Lid/B Scatter Scale;39;0;Create;False;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-6096.586,2004.423;Inherit;False;Property;_UpperLipSmoothnessMod;Upper Lip Smoothness Mod;34;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;148;-5447.89,1988.817;Inherit;False;Property;_RScatterScale;Nose/R Scatter Scale;37;0;Create;False;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;183;-5071.12,1713.9;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;155;-5040.556,2473.665;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;151;-5713.212,1825.232;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;123;-5189.154,1016.543;Inherit;True;Property;_TextureSample8;Texture Sample 8;32;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;125;-5196.033,1473.452;Inherit;True;Property;_TextureSample10;Texture Sample 10;32;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;124;-5193.033,1248.452;Inherit;True;Property;_TextureSample9;Texture Sample 9;32;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;153;-5050.521,2144.89;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;154;-5045.476,2312.309;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;152;-5706.731,1994.686;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;164;-4716.797,1746.446;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;167;-5156.462,1758.049;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;182;-4523.058,2185.996;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;147;-5031.238,2702.141;Inherit;False;Property;_UnmaskedScatterScale;Unmasked Scatter Scale;47;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;168;-5154.572,1793.955;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;166;-5156.461,1725.922;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;157;-4713.391,2218.882;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;161;-4709.159,2298.792;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;181;-4510.739,1783.689;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;146;-5032.838,2638.641;Inherit;False;Property;_UnmaskedSmoothnessMod;Unmasked Smoothness Mod;36;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;180;-4505.386,2172.352;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;159;-4711.223,2261.879;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WireNode;163;-4711.667,1672.914;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;165;-4726.218,1811.228;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomExpressionNode;156;-4344.713,2007.539;Inherit;False;In3.zw = 0@$float4 m = In1 + In2 + In3@$float mask = saturate(m.x + m.y + m.z + m.w)@$float unmask = 1.0 - mask@$$SmoothnessMod = dot(In1, Mod1) + dot(In2, Mod2) + dot(In3, Mod3) + (UMMS * unmask)@$ScatterMask = dot(In1, Scatter1) + dot(In2, Scatter2) + dot(In3, Scatter3) + (UMSS * unmask)@$return@;7;Create;13;True;In1;FLOAT4;0,0,0,0;In;;Inherit;False;True;In2;FLOAT4;0,0,0,0;In;;Inherit;False;True;In3;FLOAT4;0,0,0,0;In;;Inherit;False;True;Mod1;FLOAT4;0,0,0,0;In;;Inherit;False;True;Mod2;FLOAT4;0,0,0,0;In;;Inherit;False;True;Mod3;FLOAT4;0,0,0,0;In;;Inherit;False;True;Scatter1;FLOAT4;0,0,0,0;In;;Inherit;False;True;Scatter2;FLOAT4;0,0,0,0;In;;Inherit;False;True;Scatter3;FLOAT4;0,0,0,0;In;;Inherit;False;True;UMMS;FLOAT;0;In;;Inherit;False;True;UMSS;FLOAT;0;In;;Inherit;False;True;SmoothnessMod;FLOAT;0;Out;;Inherit;False;True;ScatterMask;FLOAT;0;Out;;Inherit;False;HeadMask;True;False;0;;False;14;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;9;FLOAT4;0,0,0,0;False;10;FLOAT;0;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;3;FLOAT;0;FLOAT;13;FLOAT;14
Node;AmplifyShaderEditor.CustomExpressionNode;179;-4351.38,2431.541;Inherit;False;float mask = saturate(In1.r + In1.g + In1.b + In1.a)@$float unmask = 1.0 - mask@$$SmoothnessMod = dot(In1, Mod1) + (UMMS * unmask)@$ScatterMask = dot(In1, Scatter1) + (UMSS * unmask)@$return@;7;Create;7;True;In1;FLOAT4;0,0,0,0;In;;Inherit;False;True;Mod1;FLOAT4;0,0,0,0;In;;Inherit;False;True;Scatter1;FLOAT4;0,0,0,0;In;;Inherit;False;True;UMMS;FLOAT;0;In;;Inherit;False;True;UMSS;FLOAT;0;In;;Inherit;False;True;SmoothnessMod;FLOAT;0;Out;;Inherit;False;True;ScatterMask;FLOAT;0;Out;;Inherit;False;HeadMask;True;False;0;;False;8;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;3;FLOAT;0;FLOAT;7;FLOAT;8
Node;AmplifyShaderEditor.StaticSwitch;169;-3759.808,2793.934;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;53;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-3788.435,2706.43;Inherit;False;Property;_SubsurfaceScale;Subsurface Scale;16;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;172;-3418.749,2751.462;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;190;-3035.399,1159.63;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;188;-2299.23,642.5725;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.35;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;100;-2993.003,1258.994;Inherit;False;732.5173;282.1577;Mask Map;2;31;32;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;193;-2175.877,530.4085;Inherit;False;Constant;_ScatterNormalMin;Scatter Normal Min;57;0;Create;True;0;0;0;False;0;False;0.33;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;87;-1893.167,-142.6834;Inherit;False;2054.687;1356.737;Normals;19;51;60;49;59;50;62;58;48;63;57;53;54;64;52;71;61;97;191;192;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;31;-2943.003,1308.994;Inherit;True;Property;_MaskMap;Mask Map;1;0;Create;False;0;0;0;False;0;False;None;None;False;gray;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SaturateNode;189;-2118.805,667.1779;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;194;-2175.877,447.4085;Inherit;False;Constant;_ScatterNormalMax;Scatter Normal Max;57;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;171;-3776.225,2569.818;Inherit;False;Property;_MicroSmoothnessMod;Micro Smoothness Mod;22;0;Create;True;0;0;0;False;0;False;0;0;-1.5;1.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;32;-2580.485,1311.152;Inherit;True;Property;_TextureSample4;Texture Sample 4;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;170;-3771.397,2445.429;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;27;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-1859.907,380.9896;Inherit;False;Property;_NormalBlendStrength;Normal Blend Strength (Head);14;0;Create;False;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;192;-1808.877,614.4085;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0.5;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;51;-1406.194,220.3766;Inherit;True;Property;_NormalBlendMap;Normal Blend Map (Head);13;1;[Normal];Create;False;0;0;0;False;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;84;-693.2025,1266.113;Inherit;False;837.1055;430.2394;Smoothness;7;39;41;40;83;42;43;177;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-1452.059,113.5525;Inherit;False;Property;_NormalStrength;Normal Strength;7;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;49;-1405.378,-92.68341;Inherit;True;Property;_NormalMap;Normal Map;6;1;[Normal];Create;True;0;0;0;False;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode;81;-1146.735,-807.9669;Inherit;False;1309.346;572.5706;Base Color;8;2;11;14;12;1;13;72;19;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;174;-3405.611,2479.909;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;98;-1834.994,1501.292;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;191;-1544.889,438.0512;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;85;-883.7467,2084.131;Inherit;False;1521.876;688.6932;Subsurface;9;27;28;66;69;29;30;114;115;119;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WireNode;187;-1962.631,908.4498;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;82;-623.0448,1753.033;Inherit;False;769.907;271.7939;Ambient Occlusion;4;35;37;33;36;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;50;-1050.894,300.1779;Inherit;True;Property;_TextureSample6;Texture Sample 6;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;27;-856.2399,2380.534;Inherit;True;Property;_SSSMap;Subsurface Map;15;0;Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;2;-1094.266,-736.967;Inherit;True;Property;_DiffuseMap;Diffuse Map;0;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.WireNode;99;-1854.808,1790.576;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;178;-2705.708,1766.485;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-1843.167,912.7005;Inherit;False;Property;_MicroNormalStrength;Micro Normal Strength;9;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;83;-643.2025,1528.255;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;97;-1652.197,857.1995;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;48;-1059.078,-12.88401;Inherit;True;Property;_TextureSample5;Texture Sample 5;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;62;-1594.547,1099.054;Inherit;False;Property;_MicroNormalTiling;Micro Normal Tiling;10;0;Create;True;0;0;0;False;0;False;25;25;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;11;-1096.735,-523.7128;Inherit;True;Property;_ColorBlendMap;Color Blend Map (Head);11;0;Create;False;0;0;0;False;0;False;None;None;False;gray;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexCoordVertexDataNode;63;-1516.511,964.5913;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;40;-622.7395,1580.352;Inherit;False;Property;_SmoothnessPower;SmoothnessPower;3;0;Create;True;0;0;0;False;0;False;0.1;1.2;0.1;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;54;-628.6493,178.5062;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;12;-780.7324,-560.7128;Inherit;True;Property;_TextureSample1;Texture Sample 1;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;42;-626.7378,1316.113;Inherit;False;Property;_SmoothnessMin;SmoothnessMin;4;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-784.9949,-351.3967;Inherit;False;Property;_ColorBlendStrength;Color Blend Strength;12;0;Create;True;0;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;33;-426.6792,1809.369;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;177;-659.0246,1662.769;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;29;-859.7467,2171.832;Inherit;True;Property;_ThicknessMap;Thickness Map;18;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.WireNode;173;-1413.126,2904.083;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-573.0449,1908.826;Inherit;False;Property;_AOStrength;AO Strength;2;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-779.2638,-757.9669;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;96;-1901.965,1229.609;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;-1268.467,1001.51;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;53;-1414.41,519.8492;Inherit;True;Property;_MicroNormalMap;Micro Normal Map;8;1;[Normal];Create;True;0;0;0;False;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;57;-1517.81,827.0089;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;39;-307.6243,1501.067;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;28;-598.6399,2428.237;Inherit;True;Property;_TextureSample2;Texture Sample 2;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;43;-625.866,1414.842;Inherit;False;Property;_SmoothnessMax;SmoothnessMax;5;0;Create;True;0;0;0;False;0;False;0;0.8;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;176;32.96705,1637.906;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;114;-566.7524,2335.098;Inherit;False;Property;_ThicknessScale;ThicknessScale;19;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;-100.0335,2579.876;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;41;-38.09634,1391.625;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;66;-240.2849,2371.334;Inherit;False;Property;_SubsurfaceFalloff;Subsurface Falloff;17;0;Create;True;0;0;0;False;0;False;1,0.3686275,0.2980392,0;1,0.3686274,0.2980391,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;30;-582.3665,2135.771;Inherit;True;Property;_TextureSample3;Texture Sample 3;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;38;-789.9224,1221.61;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;52;-1052.99,670.548;Inherit;True;Property;_TextureSample7;Texture Sample 7;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;71;-368.9363,-4.255128;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;22;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-206.0965,1803.032;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;13;-352.5551,-565.5213;Inherit;True;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;72;-84.38638,-663.7923;Inherit;False;Property;BOOLEAN_IS_HEAD;Is Head;27;0;Create;False;0;0;0;False;0;False;0;1;1;True;BOOLEAN_IS_HEAD_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;458.4008,2401.425;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;175;255.0187,1495.047;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-1238.585,2734.209;Inherit;False;Property;_CSubsurfaceShadow;CSubsurfaceShadow;24;1;[HideInInspector];Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-1241.585,2644.617;Inherit;False;Property;_CSubsurfaceAmbient;CSubsurfaceAmbient;48;1;[HideInInspector];Create;True;0;0;0;True;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;36.49043,2143.139;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendNormalsNode;61;-66.47966,192.2602;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;102;-1238.585,2187.209;Inherit;False;Property;_CTransmissionShadow;CTransmissionShadow;52;1;[HideInInspector];Create;True;0;0;0;True;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-1243.585,2282.209;Inherit;False;Property;_CSubsurfaceStrength;CSubsurfaceStrength;50;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;104;-1240.585,2374.617;Inherit;False;Property;_CSubsurfaceNormalDistortion;CSubsurfaceNormalDistortion;49;1;[HideInInspector];Create;True;0;0;0;True;0;False;0.35;0.35;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;105;-1240.585,2553.209;Inherit;False;Property;_CSubsurfaceDirect;CSubsurfaceDirect;25;1;[HideInInspector];Create;True;0;0;0;True;0;False;0.9;0.9;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;45;276.6889,1201.214;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;37;-32.13735,1810.991;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;108;-1242.585,2462.209;Inherit;False;Property;_CSubsurfaceScattering;CSubsurfaceScattering;51;1;[HideInInspector];Create;True;0;0;0;True;0;False;2;2;0;12;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;19;53.56691,-419.5222;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;25;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;20;1398.347,820.2733;Half;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;Reallusion/Amplify/RL_SkinShader_Variants_URP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;38;Workflow;1;637772825850121632;Surface;0;637772825868519660;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Transmission;1;637772850612646128;  Transmission Shadow;0.5,True,102;637773357636102416;Translucency;1;637772840223650237;  Translucency Strength;1,True,103;637773357632710318;  Normal Distortion;0.5,True,104;637773357630359836;  Scattering;4,True,108;637773351715186210;  Direct;0.9,True,105;637773357642900345;  Ambient;0.1,True,106;637773357645610437;  Shadow;0.5,True,107;637773357647560343;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;637772870354882285;  Phong;0;637772870352635162;  Strength;0,False,-1;637772870307115194;  Type;0;0;  Tess;1,False,-1;637772870321916518;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;0;8;False;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;21;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;24;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;22;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;26;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;23;525,305;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;150;0;126;0
WireConnection;150;1;127;0
WireConnection;150;2;128;0
WireConnection;150;3;129;0
WireConnection;183;0;150;0
WireConnection;155;0;144;0
WireConnection;155;1;145;0
WireConnection;151;0;130;0
WireConnection;151;1;131;0
WireConnection;151;2;132;0
WireConnection;151;3;133;0
WireConnection;123;0;120;0
WireConnection;125;0;122;0
WireConnection;124;0;121;0
WireConnection;153;0;148;0
WireConnection;153;1;137;0
WireConnection;153;2;138;0
WireConnection;153;3;139;0
WireConnection;154;0;140;0
WireConnection;154;1;141;0
WireConnection;154;2;142;0
WireConnection;154;3;143;0
WireConnection;152;0;134;0
WireConnection;152;1;135;0
WireConnection;164;0;124;0
WireConnection;167;0;151;0
WireConnection;182;0;153;0
WireConnection;168;0;152;0
WireConnection;166;0;150;0
WireConnection;157;0;153;0
WireConnection;161;0;155;0
WireConnection;181;0;123;0
WireConnection;180;0;183;0
WireConnection;159;0;154;0
WireConnection;163;0;123;0
WireConnection;165;0;125;0
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
WireConnection;179;1;181;0
WireConnection;179;2;180;0
WireConnection;179;3;182;0
WireConnection;179;4;146;0
WireConnection;179;5;147;0
WireConnection;169;1;179;8
WireConnection;169;0;156;14
WireConnection;172;0;68;0
WireConnection;172;1;169;0
WireConnection;190;0;172;0
WireConnection;188;0;190;0
WireConnection;189;0;188;0
WireConnection;32;0;31;0
WireConnection;170;1;179;7
WireConnection;170;0;156;13
WireConnection;192;0;194;0
WireConnection;192;1;193;0
WireConnection;192;2;189;0
WireConnection;174;0;170;0
WireConnection;174;1;171;0
WireConnection;98;0;32;4
WireConnection;191;0;59;0
WireConnection;191;1;192;0
WireConnection;187;0;32;3
WireConnection;50;0;51;0
WireConnection;50;5;191;0
WireConnection;99;0;32;2
WireConnection;178;0;174;0
WireConnection;83;0;98;0
WireConnection;97;0;187;0
WireConnection;48;0;49;0
WireConnection;48;5;60;0
WireConnection;54;0;48;0
WireConnection;54;1;50;0
WireConnection;12;0;11;0
WireConnection;33;0;99;0
WireConnection;177;0;178;0
WireConnection;173;0;172;0
WireConnection;1;0;2;0
WireConnection;96;0;32;1
WireConnection;64;0;63;0
WireConnection;64;1;62;0
WireConnection;57;0;192;0
WireConnection;57;1;58;0
WireConnection;57;2;97;0
WireConnection;39;0;83;0
WireConnection;39;1;40;0
WireConnection;28;0;27;0
WireConnection;176;0;177;0
WireConnection;69;0;28;2
WireConnection;69;1;28;2
WireConnection;69;2;173;0
WireConnection;41;0;42;0
WireConnection;41;1;43;0
WireConnection;41;2;39;0
WireConnection;30;0;29;0
WireConnection;38;0;96;0
WireConnection;52;0;53;0
WireConnection;52;1;64;0
WireConnection;52;5;57;0
WireConnection;71;1;48;0
WireConnection;71;0;54;0
WireConnection;35;0;33;0
WireConnection;35;1;36;0
WireConnection;13;0;12;0
WireConnection;13;1;1;0
WireConnection;13;2;14;0
WireConnection;72;1;1;0
WireConnection;72;0;13;0
WireConnection;119;0;66;0
WireConnection;119;1;69;0
WireConnection;175;0;41;0
WireConnection;175;1;176;0
WireConnection;115;0;30;2
WireConnection;115;1;114;0
WireConnection;115;2;66;0
WireConnection;61;0;71;0
WireConnection;61;1;52;0
WireConnection;45;0;38;0
WireConnection;37;0;35;0
WireConnection;20;0;72;0
WireConnection;20;1;61;0
WireConnection;20;3;45;0
WireConnection;20;4;175;0
WireConnection;20;5;37;0
WireConnection;20;14;115;0
WireConnection;20;15;119;0
ASEEND*/
//CHKSM=1B2DBDF24172EA35BB9AFE1BA89CB0AF25B15F89