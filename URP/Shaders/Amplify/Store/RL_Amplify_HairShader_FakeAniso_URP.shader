// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Reallusion/Amplify/RL_HairShader_FakeAniso_URP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin]_DiffuseMap("Diffuse Map", 2D) = "white" {}
		_DiffuseStrength("Diffuse Strength", Range( 0 , 2)) = 1
		_VertexBaseColor("Vertex Base Color", Color) = (0,0,0,0)
		_VertexColorStrength("Vertex Color Strength", Range( 0 , 1)) = 0.5
		_BaseColorStrength("Base Color Strength", Range( 0 , 1)) = 1
		_AlphaPower("Alpha Power", Range( 0.01 , 2)) = 1
		_AlphaRemap("Alpha Remap", Range( 0.5 , 1)) = 0.5
		_AlphaClip2("Alpha Clip", Range( 0 , 1)) = 0.15
		_MaskMap("Mask Map", 2D) = "white" {}
		_AOStrength("Ambient Occlusion Strength", Range( 0 , 1)) = 1
		_AOOccludeAll("AO Occlude All", Range( 0 , 1)) = 0
		_SmoothnessPower("Smoothness Power", Range( 0.5 , 2)) = 1.25
		_SmoothnessMin("Smoothness Min", Range( 0 , 1)) = 0
		_SmoothnessMax("Smoothness Max", Range( 0 , 1)) = 1
		_NormalMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Range( 0 , 2)) = 1
		_BlendMap("Blend Map", 2D) = "white" {}
		_BlendStrength("Blend Strength", Range( 0 , 1)) = 1
		_RootMap("Root Map", 2D) = "gray" {}
		_GlobalStrength("Global Strength", Range( 0 , 1)) = 1
		_RootColorStrength("Root Color Strength", Range( 0 , 1)) = 1
		_EndColorStrength("End Color Strength", Range( 0 , 1)) = 1
		_InvertRootMap("Invert Root Map", Range( 0 , 1)) = 0
		_RootColor("Root Color", Color) = (0.3294118,0.1411765,0.05098039,0)
		_EndColor("End Color", Color) = (0.6039216,0.454902,0.2862745,0)
		_IDMap("ID Map", 2D) = "gray" {}
		_HighlightAStrength("Highlight A Strength", Range( 0 , 1)) = 1
		_HighlightAColor("Highlight A Color", Color) = (0.9137255,0.7803922,0.6352941,0)
		_HighlightADistribution("Highlight A Distribution", Vector) = (0.1,0.2,0.3,0)
		_HighlightAOverlapEnd("Highlight A Overlap End", Range( 0 , 1)) = 1
		_HighlightAOverlapInvert("Highlight A Overlap Invert", Range( 0 , 1)) = 1
		_HighlightBStrength("Highlight B Strength", Range( 0 , 1)) = 1
		_HighlightBColor("Highlight B Color", Color) = (1,1,1,0)
		_HighlightBDistribution("Highlight B Distribution", Vector) = (0.1,0.2,0.3,0)
		_HighlightBOverlapEnd("Highlight B Overlap End", Range( 0 , 1)) = 1
		_HighlightBOverlapInvert("Highlight B Overlap Invert", Range( 0 , 1)) = 1
		_EmissionMap("Emission Map", 2D) = "white" {}
		_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[Toggle(BOOLEAN_ENABLECOLOR_ON)] BOOLEAN_ENABLECOLOR("Enable Color", Float) = 0
		_FlowMap("Flow Map", 2D) = "gray" {}
		_FlowMapInvertG("Flow Map Invert G", Float) = 0
		_HighlightColor1("Highlight Color 1", Color) = (0.4509804,0.3058824,0.2313726,0)
		_Multiplier1("Multiplier1", Range( 0 , 1)) = 3
		_Multiplier2("Multiplier2", Range( 0 , 1)) = 3
		_Shift1("Shift1", Range( -1 , 1)) = -0.04
		_Shift2("Shift2", Range( -1 , 1)) = 0.2
		_Pow1("Pow1", Range( 0.01 , 20)) = 3
		_Pow2("Pow2", Range( 0.01 , 20)) = 6
		_RImPower("RIm Power", Range( 0 , 8)) = 4
		_RImMultiplier("RIm Multiplier", Range( 0 , 4)) = 1
		[ASEEnd]_RimColor("Rim Color", Color) = (0.8,0.5686275,0.427451,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
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
		Cull Off
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_TANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local BOOLEAN_ENABLECOLOR_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				half4 ase_color : COLOR;
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
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NormalMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _FlowMap_ST;
			half4 _HighlightColor1;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightAColor;
			half4 _RootMap_ST;
			half4 _EndColor;
			half4 _RootColor;
			half4 _HighlightBColor;
			half4 _DiffuseMap_ST;
			half4 _MaskMap_ST;
			half4 _BlendMap_ST;
			half4 _RimColor;
			half3 _HighlightADistribution;
			half3 _HighlightBDistribution;
			half _SmoothnessMin;
			half _NormalStrength;
			half _SmoothnessPower;
			half _AlphaRemap;
			half _RImMultiplier;
			half _Multiplier2;
			half _Pow2;
			half _Shift2;
			half _Multiplier1;
			half _Pow1;
			half _Shift1;
			half _FlowMapInvertG;
			half _SmoothnessMax;
			half _RImPower;
			half _AOOccludeAll;
			half _AOStrength;
			half _DiffuseStrength;
			half _InvertRootMap;
			half _GlobalStrength;
			half _RootColorStrength;
			half _EndColorStrength;
			half _HighlightAStrength;
			half _VertexColorStrength;
			half _HighlightAOverlapEnd;
			half _AlphaPower;
			half _HighlightBStrength;
			half _HighlightBOverlapEnd;
			half _HighlightBOverlapInvert;
			half _BlendStrength;
			half _BaseColorStrength;
			half _HighlightAOverlapInvert;
			half _AlphaClip2;
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
			sampler2D _NormalMap;
			sampler2D _MaskMap;
			sampler2D _BlendMap;
			sampler2D _DiffuseMap;
			sampler2D _RootMap;
			sampler2D _IDMap;
			sampler2D _FlowMap;
			sampler2D _EmissionMap;


			half3 TangentToWorld13_g15( half3 NormalTS, half3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			half ThreePointDistribution( half3 From, half ID, half Fac )
			{
				float lower = smoothstep(From.x, From.y, ID);
				float upper = 1.0 - smoothstep(From.y, From.z, ID);
				return Fac * lerp(lower, upper, step(From.y, ID));
			}
			
			half3 TangentToWorld13_g14( half3 NormalTS, half3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			half UnityDither175( half In, half2 ScreenPosition )
			{
				half2 uv = ScreenPosition.xy * _ScreenParams.xy;
				half DITHER_THRESHOLDS[16] =
				{
				                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,
				                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,
				                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,
				                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0
				};
				uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
				return In - DITHER_THRESHOLDS[index];
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				
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
				half4 ase_color : COLOR;

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
				o.ase_color = v.ase_color;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 uv_NormalMap = IN.ase_texcoord7.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				half3 unpack139 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalStrength );
				unpack139.z = lerp( 1, unpack139.z, saturate(_NormalStrength) );
				half3 tex2DNode139 = unpack139;
				half3 NormalTS13_g15 = tex2DNode139;
				half3 Binormal5_g15 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( WorldNormal , WorldTangent ) );
				half3x3 TBN1_g15 = float3x3(WorldTangent, Binormal5_g15, WorldNormal);
				half3x3 TBN13_g15 = TBN1_g15;
				half3 localTangentToWorld13_g15 = TangentToWorld13_g15( NormalTS13_g15 , TBN13_g15 );
				half dotResult262 = dot( WorldViewDirection , localTangentToWorld13_g15 );
				half saferPower267 = abs( ( 1.0 - abs( dotResult262 ) ) );
				float2 uv_MaskMap = IN.ase_texcoord7.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				half4 tex2DNode115 = tex2D( _MaskMap, uv_MaskMap );
				half temp_output_119_0 = ( 1.0 - ( _AOStrength * ( 1.0 - tex2DNode115.g ) ) );
				half4 temp_cast_0 = (temp_output_119_0).xxxx;
				float2 uv_BlendMap = IN.ase_texcoord7.xy * _BlendMap_ST.xy + _BlendMap_ST.zw;
				float2 uv_DiffuseMap = IN.ase_texcoord7.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half4 color46 = IsGammaSpace() ? half4(1,1,1,0) : half4(1,1,1,0);
				half4 lerpResult45 = lerp( color46 , tex2DNode19 , _BaseColorStrength);
				float2 uv_RootMap = IN.ase_texcoord7.xy * _RootMap_ST.xy + _RootMap_ST.zw;
				half4 tex2DNode26 = tex2D( _RootMap, uv_RootMap );
				half lerpResult40 = lerp( tex2DNode26.r , ( 1.0 - tex2DNode26.r ) , _InvertRootMap);
				half4 lerpResult43 = lerp( _RootColor , _EndColor , lerpResult40);
				half4 lerpResult48 = lerp( lerpResult45 , lerpResult43 , ( _GlobalStrength * ( ( ( 1.0 - tex2DNode26.r ) * _RootColorStrength ) + ( tex2DNode26.r * _EndColorStrength ) ) ));
				half3 From56 = _HighlightADistribution;
				float2 uv_IDMap = IN.ase_texcoord7.xy * _IDMap_ST.xy + _IDMap_ST.zw;
				half4 tex2DNode50 = tex2D( _IDMap, uv_IDMap );
				half ID56 = tex2DNode50.r;
				half Fac56 = _HighlightAStrength;
				half localThreePointDistribution56 = ThreePointDistribution( From56 , ID56 , Fac56 );
				half root58 = tex2DNode26.r;
				half lerpResult61 = lerp( ( 1.0 - root58 ) , root58 , _HighlightAOverlapInvert);
				half4 lerpResult68 = lerp( lerpResult48 , _HighlightAColor , saturate( ( localThreePointDistribution56 * ( 1.0 - ( _HighlightAOverlapEnd * ( 1.0 - lerpResult61 ) ) ) ) ));
				half3 From156 = _HighlightBDistribution;
				half ID156 = tex2DNode50.r;
				half Fac156 = _HighlightBStrength;
				half localThreePointDistribution156 = ThreePointDistribution( From156 , ID156 , Fac156 );
				half lerpResult83 = lerp( ( 1.0 - root58 ) , root58 , _HighlightBOverlapInvert);
				half4 lerpResult80 = lerp( lerpResult68 , _HighlightBColor , saturate( ( localThreePointDistribution156 * ( 1.0 - ( _HighlightBOverlapEnd * ( 1.0 - lerpResult83 ) ) ) ) ));
				#ifdef BOOLEAN_ENABLECOLOR_ON
				half4 staticSwitch95 = lerpResult80;
				#else
				half4 staticSwitch95 = tex2DNode19;
				#endif
				half4 blendOpSrc101 = tex2D( _BlendMap, uv_BlendMap );
				half4 blendOpDest101 = ( _DiffuseStrength * staticSwitch95 );
				half4 lerpBlendMode101 = lerp(blendOpDest101,( blendOpSrc101 * blendOpDest101 ),_BlendStrength);
				half4 blendOpSrc111 = temp_cast_0;
				half4 blendOpDest111 = ( saturate( lerpBlendMode101 ));
				half4 lerpBlendMode111 = lerp(blendOpDest111,( blendOpSrc111 * blendOpDest111 ),( _AOOccludeAll * 0.5 ));
				half4 lerpResult112 = lerp( ( saturate( lerpBlendMode111 )) , _VertexBaseColor , ( ( 1.0 - IN.ase_color.r ) * _VertexColorStrength ));
				float2 uv_FlowMap = IN.ase_texcoord7.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
				half4 tex2DNode177 = tex2D( _FlowMap, uv_FlowMap );
				half3 appendResult183 = (half3(tex2DNode177.r , ( ( _FlowMapInvertG * ( ( 1.0 - tex2DNode177.g ) - tex2DNode177.g ) ) + tex2DNode177.g ) , tex2DNode177.b));
				half3 NormalTS13_g14 = ( ( appendResult183 * float3( 2,2,2 ) ) - float3( 1,1,1 ) );
				half3 Binormal5_g14 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( WorldNormal , WorldTangent ) );
				half3x3 TBN1_g14 = float3x3(WorldTangent, Binormal5_g14, WorldNormal);
				half3x3 TBN13_g14 = TBN1_g14;
				half3 localTangentToWorld13_g14 = TangentToWorld13_g14( NormalTS13_g14 , TBN13_g14 );
				half dotResult231 = dot( localTangentToWorld13_g14 , WorldViewDirection );
				half saferPower236 = abs( ( 1.0 - abs( ( dotResult231 + _Shift1 ) ) ) );
				half saferPower246 = abs( ( 1.0 - abs( ( dotResult231 + _Shift2 ) ) ) );
				
				float2 uv_EmissionMap = IN.ase_texcoord7.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				half saferPower126 = abs( tex2DNode115.a );
				half lerpResult128 = lerp( _SmoothnessMin , _SmoothnessMax , pow( saferPower126 , _SmoothnessPower ));
				
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				half In175 = _AlphaClip2;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				half2 ScreenPosition175 = ase_screenPosNorm.xy;
				half localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				float3 Albedo = ( ( ( pow( saferPower267 , _RImPower ) * _RImMultiplier ) * _RimColor ) + ( lerpResult112 + ( _HighlightColor1 * pow( saferPower236 , _Pow1 ) * _Multiplier1 ) + ( _HighlightColor1 * pow( saferPower246 , _Pow2 ) * _Multiplier2 ) ) ).rgb;
				float3 Normal = tex2DNode139;
				float3 Emission = ( tex2D( _EmissionMap, uv_EmissionMap ) * _EmissiveColor ).rgb;
				float3 Specular = 0.5;
				float Metallic = tex2DNode115.r;
				float Smoothness = lerpResult128;
				float Occlusion = temp_output_119_0;
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
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
					float shadow = _TransmissionShadow;

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
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NormalMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _FlowMap_ST;
			half4 _HighlightColor1;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightAColor;
			half4 _RootMap_ST;
			half4 _EndColor;
			half4 _RootColor;
			half4 _HighlightBColor;
			half4 _DiffuseMap_ST;
			half4 _MaskMap_ST;
			half4 _BlendMap_ST;
			half4 _RimColor;
			half3 _HighlightADistribution;
			half3 _HighlightBDistribution;
			half _SmoothnessMin;
			half _NormalStrength;
			half _SmoothnessPower;
			half _AlphaRemap;
			half _RImMultiplier;
			half _Multiplier2;
			half _Pow2;
			half _Shift2;
			half _Multiplier1;
			half _Pow1;
			half _Shift1;
			half _FlowMapInvertG;
			half _SmoothnessMax;
			half _RImPower;
			half _AOOccludeAll;
			half _AOStrength;
			half _DiffuseStrength;
			half _InvertRootMap;
			half _GlobalStrength;
			half _RootColorStrength;
			half _EndColorStrength;
			half _HighlightAStrength;
			half _VertexColorStrength;
			half _HighlightAOverlapEnd;
			half _AlphaPower;
			half _HighlightBStrength;
			half _HighlightBOverlapEnd;
			half _HighlightBOverlapInvert;
			half _BlendStrength;
			half _BaseColorStrength;
			half _HighlightAOverlapInvert;
			half _AlphaClip2;
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


			half UnityDither175( half In, half2 ScreenPosition )
			{
				half2 uv = ScreenPosition.xy * _ScreenParams.xy;
				half DITHER_THRESHOLDS[16] =
				{
				                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,
				                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,
				                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,
				                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0
				};
				uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
				return In - DITHER_THRESHOLDS[index];
			}
			

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

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
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

				float2 uv_DiffuseMap = IN.ase_texcoord2.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				half In175 = _AlphaClip2;
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				half2 ScreenPosition175 = ase_screenPosNorm.xy;
				half localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NormalMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _FlowMap_ST;
			half4 _HighlightColor1;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightAColor;
			half4 _RootMap_ST;
			half4 _EndColor;
			half4 _RootColor;
			half4 _HighlightBColor;
			half4 _DiffuseMap_ST;
			half4 _MaskMap_ST;
			half4 _BlendMap_ST;
			half4 _RimColor;
			half3 _HighlightADistribution;
			half3 _HighlightBDistribution;
			half _SmoothnessMin;
			half _NormalStrength;
			half _SmoothnessPower;
			half _AlphaRemap;
			half _RImMultiplier;
			half _Multiplier2;
			half _Pow2;
			half _Shift2;
			half _Multiplier1;
			half _Pow1;
			half _Shift1;
			half _FlowMapInvertG;
			half _SmoothnessMax;
			half _RImPower;
			half _AOOccludeAll;
			half _AOStrength;
			half _DiffuseStrength;
			half _InvertRootMap;
			half _GlobalStrength;
			half _RootColorStrength;
			half _EndColorStrength;
			half _HighlightAStrength;
			half _VertexColorStrength;
			half _HighlightAOverlapEnd;
			half _AlphaPower;
			half _HighlightBStrength;
			half _HighlightBOverlapEnd;
			half _HighlightBOverlapInvert;
			half _BlendStrength;
			half _BaseColorStrength;
			half _HighlightAOverlapInvert;
			half _AlphaClip2;
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


			half UnityDither175( half In, half2 ScreenPosition )
			{
				half2 uv = ScreenPosition.xy * _ScreenParams.xy;
				half DITHER_THRESHOLDS[16] =
				{
				                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,
				                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,
				                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,
				                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0
				};
				uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
				return In - DITHER_THRESHOLDS[index];
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				
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

				float2 uv_DiffuseMap = IN.ase_texcoord2.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				half In175 = _AlphaClip2;
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				half2 ScreenPosition175 = ase_screenPosNorm.xy;
				half localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_TANGENT
			#pragma shader_feature_local BOOLEAN_ENABLECOLOR_ON


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				half4 ase_tangent : TANGENT;
				half4 ase_color : COLOR;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NormalMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _FlowMap_ST;
			half4 _HighlightColor1;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightAColor;
			half4 _RootMap_ST;
			half4 _EndColor;
			half4 _RootColor;
			half4 _HighlightBColor;
			half4 _DiffuseMap_ST;
			half4 _MaskMap_ST;
			half4 _BlendMap_ST;
			half4 _RimColor;
			half3 _HighlightADistribution;
			half3 _HighlightBDistribution;
			half _SmoothnessMin;
			half _NormalStrength;
			half _SmoothnessPower;
			half _AlphaRemap;
			half _RImMultiplier;
			half _Multiplier2;
			half _Pow2;
			half _Shift2;
			half _Multiplier1;
			half _Pow1;
			half _Shift1;
			half _FlowMapInvertG;
			half _SmoothnessMax;
			half _RImPower;
			half _AOOccludeAll;
			half _AOStrength;
			half _DiffuseStrength;
			half _InvertRootMap;
			half _GlobalStrength;
			half _RootColorStrength;
			half _EndColorStrength;
			half _HighlightAStrength;
			half _VertexColorStrength;
			half _HighlightAOverlapEnd;
			half _AlphaPower;
			half _HighlightBStrength;
			half _HighlightBOverlapEnd;
			half _HighlightBOverlapInvert;
			half _BlendStrength;
			half _BaseColorStrength;
			half _HighlightAOverlapInvert;
			half _AlphaClip2;
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
			sampler2D _NormalMap;
			sampler2D _MaskMap;
			sampler2D _BlendMap;
			sampler2D _DiffuseMap;
			sampler2D _RootMap;
			sampler2D _IDMap;
			sampler2D _FlowMap;
			sampler2D _EmissionMap;


			half3 TangentToWorld13_g15( half3 NormalTS, half3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			half ThreePointDistribution( half3 From, half ID, half Fac )
			{
				float lower = smoothstep(From.x, From.y, ID);
				float upper = 1.0 - smoothstep(From.y, From.z, ID);
				return Fac * lerp(lower, upper, step(From.y, ID));
			}
			
			half3 TangentToWorld13_g14( half3 NormalTS, half3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			half UnityDither175( half In, half2 ScreenPosition )
			{
				half2 uv = ScreenPosition.xy * _ScreenParams.xy;
				half DITHER_THRESHOLDS[16] =
				{
				                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,
				                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,
				                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,
				                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0
				};
				uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
				return In - DITHER_THRESHOLDS[index];
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				half3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				half3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				
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
				half4 ase_tangent : TANGENT;
				half4 ase_color : COLOR;

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
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float2 uv_NormalMap = IN.ase_texcoord2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				half3 unpack139 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalStrength );
				unpack139.z = lerp( 1, unpack139.z, saturate(_NormalStrength) );
				half3 tex2DNode139 = unpack139;
				half3 NormalTS13_g15 = tex2DNode139;
				half3 ase_worldTangent = IN.ase_texcoord3.xyz;
				half3 ase_worldNormal = IN.ase_texcoord4.xyz;
				half3 Binormal5_g15 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( ase_worldNormal , ase_worldTangent ) );
				half3x3 TBN1_g15 = float3x3(ase_worldTangent, Binormal5_g15, ase_worldNormal);
				half3x3 TBN13_g15 = TBN1_g15;
				half3 localTangentToWorld13_g15 = TangentToWorld13_g15( NormalTS13_g15 , TBN13_g15 );
				half dotResult262 = dot( ase_worldViewDir , localTangentToWorld13_g15 );
				half saferPower267 = abs( ( 1.0 - abs( dotResult262 ) ) );
				float2 uv_MaskMap = IN.ase_texcoord2.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				half4 tex2DNode115 = tex2D( _MaskMap, uv_MaskMap );
				half temp_output_119_0 = ( 1.0 - ( _AOStrength * ( 1.0 - tex2DNode115.g ) ) );
				half4 temp_cast_0 = (temp_output_119_0).xxxx;
				float2 uv_BlendMap = IN.ase_texcoord2.xy * _BlendMap_ST.xy + _BlendMap_ST.zw;
				float2 uv_DiffuseMap = IN.ase_texcoord2.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half4 color46 = IsGammaSpace() ? half4(1,1,1,0) : half4(1,1,1,0);
				half4 lerpResult45 = lerp( color46 , tex2DNode19 , _BaseColorStrength);
				float2 uv_RootMap = IN.ase_texcoord2.xy * _RootMap_ST.xy + _RootMap_ST.zw;
				half4 tex2DNode26 = tex2D( _RootMap, uv_RootMap );
				half lerpResult40 = lerp( tex2DNode26.r , ( 1.0 - tex2DNode26.r ) , _InvertRootMap);
				half4 lerpResult43 = lerp( _RootColor , _EndColor , lerpResult40);
				half4 lerpResult48 = lerp( lerpResult45 , lerpResult43 , ( _GlobalStrength * ( ( ( 1.0 - tex2DNode26.r ) * _RootColorStrength ) + ( tex2DNode26.r * _EndColorStrength ) ) ));
				half3 From56 = _HighlightADistribution;
				float2 uv_IDMap = IN.ase_texcoord2.xy * _IDMap_ST.xy + _IDMap_ST.zw;
				half4 tex2DNode50 = tex2D( _IDMap, uv_IDMap );
				half ID56 = tex2DNode50.r;
				half Fac56 = _HighlightAStrength;
				half localThreePointDistribution56 = ThreePointDistribution( From56 , ID56 , Fac56 );
				half root58 = tex2DNode26.r;
				half lerpResult61 = lerp( ( 1.0 - root58 ) , root58 , _HighlightAOverlapInvert);
				half4 lerpResult68 = lerp( lerpResult48 , _HighlightAColor , saturate( ( localThreePointDistribution56 * ( 1.0 - ( _HighlightAOverlapEnd * ( 1.0 - lerpResult61 ) ) ) ) ));
				half3 From156 = _HighlightBDistribution;
				half ID156 = tex2DNode50.r;
				half Fac156 = _HighlightBStrength;
				half localThreePointDistribution156 = ThreePointDistribution( From156 , ID156 , Fac156 );
				half lerpResult83 = lerp( ( 1.0 - root58 ) , root58 , _HighlightBOverlapInvert);
				half4 lerpResult80 = lerp( lerpResult68 , _HighlightBColor , saturate( ( localThreePointDistribution156 * ( 1.0 - ( _HighlightBOverlapEnd * ( 1.0 - lerpResult83 ) ) ) ) ));
				#ifdef BOOLEAN_ENABLECOLOR_ON
				half4 staticSwitch95 = lerpResult80;
				#else
				half4 staticSwitch95 = tex2DNode19;
				#endif
				half4 blendOpSrc101 = tex2D( _BlendMap, uv_BlendMap );
				half4 blendOpDest101 = ( _DiffuseStrength * staticSwitch95 );
				half4 lerpBlendMode101 = lerp(blendOpDest101,( blendOpSrc101 * blendOpDest101 ),_BlendStrength);
				half4 blendOpSrc111 = temp_cast_0;
				half4 blendOpDest111 = ( saturate( lerpBlendMode101 ));
				half4 lerpBlendMode111 = lerp(blendOpDest111,( blendOpSrc111 * blendOpDest111 ),( _AOOccludeAll * 0.5 ));
				half4 lerpResult112 = lerp( ( saturate( lerpBlendMode111 )) , _VertexBaseColor , ( ( 1.0 - IN.ase_color.r ) * _VertexColorStrength ));
				float2 uv_FlowMap = IN.ase_texcoord2.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
				half4 tex2DNode177 = tex2D( _FlowMap, uv_FlowMap );
				half3 appendResult183 = (half3(tex2DNode177.r , ( ( _FlowMapInvertG * ( ( 1.0 - tex2DNode177.g ) - tex2DNode177.g ) ) + tex2DNode177.g ) , tex2DNode177.b));
				half3 NormalTS13_g14 = ( ( appendResult183 * float3( 2,2,2 ) ) - float3( 1,1,1 ) );
				half3 Binormal5_g14 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( ase_worldNormal , ase_worldTangent ) );
				half3x3 TBN1_g14 = float3x3(ase_worldTangent, Binormal5_g14, ase_worldNormal);
				half3x3 TBN13_g14 = TBN1_g14;
				half3 localTangentToWorld13_g14 = TangentToWorld13_g14( NormalTS13_g14 , TBN13_g14 );
				half dotResult231 = dot( localTangentToWorld13_g14 , ase_worldViewDir );
				half saferPower236 = abs( ( 1.0 - abs( ( dotResult231 + _Shift1 ) ) ) );
				half saferPower246 = abs( ( 1.0 - abs( ( dotResult231 + _Shift2 ) ) ) );
				
				float2 uv_EmissionMap = IN.ase_texcoord2.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				half In175 = _AlphaClip2;
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				half2 ScreenPosition175 = ase_screenPosNorm.xy;
				half localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				
				float3 Albedo = ( ( ( pow( saferPower267 , _RImPower ) * _RImMultiplier ) * _RimColor ) + ( lerpResult112 + ( _HighlightColor1 * pow( saferPower236 , _Pow1 ) * _Multiplier1 ) + ( _HighlightColor1 * pow( saferPower246 , _Pow2 ) * _Multiplier2 ) ) ).rgb;
				float3 Emission = ( tex2D( _EmissionMap, uv_EmissionMap ) * _EmissiveColor ).rgb;
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;

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
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
			
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_TANGENT
			#pragma shader_feature_local BOOLEAN_ENABLECOLOR_ON


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				half4 ase_tangent : TANGENT;
				half4 ase_color : COLOR;
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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NormalMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _FlowMap_ST;
			half4 _HighlightColor1;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightAColor;
			half4 _RootMap_ST;
			half4 _EndColor;
			half4 _RootColor;
			half4 _HighlightBColor;
			half4 _DiffuseMap_ST;
			half4 _MaskMap_ST;
			half4 _BlendMap_ST;
			half4 _RimColor;
			half3 _HighlightADistribution;
			half3 _HighlightBDistribution;
			half _SmoothnessMin;
			half _NormalStrength;
			half _SmoothnessPower;
			half _AlphaRemap;
			half _RImMultiplier;
			half _Multiplier2;
			half _Pow2;
			half _Shift2;
			half _Multiplier1;
			half _Pow1;
			half _Shift1;
			half _FlowMapInvertG;
			half _SmoothnessMax;
			half _RImPower;
			half _AOOccludeAll;
			half _AOStrength;
			half _DiffuseStrength;
			half _InvertRootMap;
			half _GlobalStrength;
			half _RootColorStrength;
			half _EndColorStrength;
			half _HighlightAStrength;
			half _VertexColorStrength;
			half _HighlightAOverlapEnd;
			half _AlphaPower;
			half _HighlightBStrength;
			half _HighlightBOverlapEnd;
			half _HighlightBOverlapInvert;
			half _BlendStrength;
			half _BaseColorStrength;
			half _HighlightAOverlapInvert;
			half _AlphaClip2;
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
			sampler2D _NormalMap;
			sampler2D _MaskMap;
			sampler2D _BlendMap;
			sampler2D _DiffuseMap;
			sampler2D _RootMap;
			sampler2D _IDMap;
			sampler2D _FlowMap;


			half3 TangentToWorld13_g15( half3 NormalTS, half3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			half ThreePointDistribution( half3 From, half ID, half Fac )
			{
				float lower = smoothstep(From.x, From.y, ID);
				float upper = 1.0 - smoothstep(From.y, From.z, ID);
				return Fac * lerp(lower, upper, step(From.y, ID));
			}
			
			half3 TangentToWorld13_g14( half3 NormalTS, half3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			half UnityDither175( half In, half2 ScreenPosition )
			{
				half2 uv = ScreenPosition.xy * _ScreenParams.xy;
				half DITHER_THRESHOLDS[16] =
				{
				                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,
				                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,
				                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,
				                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0
				};
				uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
				return In - DITHER_THRESHOLDS[index];
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				half3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				half3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				
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
				half4 ase_tangent : TANGENT;
				half4 ase_color : COLOR;

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
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float2 uv_NormalMap = IN.ase_texcoord2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				half3 unpack139 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalStrength );
				unpack139.z = lerp( 1, unpack139.z, saturate(_NormalStrength) );
				half3 tex2DNode139 = unpack139;
				half3 NormalTS13_g15 = tex2DNode139;
				half3 ase_worldTangent = IN.ase_texcoord3.xyz;
				half3 ase_worldNormal = IN.ase_texcoord4.xyz;
				half3 Binormal5_g15 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( ase_worldNormal , ase_worldTangent ) );
				half3x3 TBN1_g15 = float3x3(ase_worldTangent, Binormal5_g15, ase_worldNormal);
				half3x3 TBN13_g15 = TBN1_g15;
				half3 localTangentToWorld13_g15 = TangentToWorld13_g15( NormalTS13_g15 , TBN13_g15 );
				half dotResult262 = dot( ase_worldViewDir , localTangentToWorld13_g15 );
				half saferPower267 = abs( ( 1.0 - abs( dotResult262 ) ) );
				float2 uv_MaskMap = IN.ase_texcoord2.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				half4 tex2DNode115 = tex2D( _MaskMap, uv_MaskMap );
				half temp_output_119_0 = ( 1.0 - ( _AOStrength * ( 1.0 - tex2DNode115.g ) ) );
				half4 temp_cast_0 = (temp_output_119_0).xxxx;
				float2 uv_BlendMap = IN.ase_texcoord2.xy * _BlendMap_ST.xy + _BlendMap_ST.zw;
				float2 uv_DiffuseMap = IN.ase_texcoord2.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half4 color46 = IsGammaSpace() ? half4(1,1,1,0) : half4(1,1,1,0);
				half4 lerpResult45 = lerp( color46 , tex2DNode19 , _BaseColorStrength);
				float2 uv_RootMap = IN.ase_texcoord2.xy * _RootMap_ST.xy + _RootMap_ST.zw;
				half4 tex2DNode26 = tex2D( _RootMap, uv_RootMap );
				half lerpResult40 = lerp( tex2DNode26.r , ( 1.0 - tex2DNode26.r ) , _InvertRootMap);
				half4 lerpResult43 = lerp( _RootColor , _EndColor , lerpResult40);
				half4 lerpResult48 = lerp( lerpResult45 , lerpResult43 , ( _GlobalStrength * ( ( ( 1.0 - tex2DNode26.r ) * _RootColorStrength ) + ( tex2DNode26.r * _EndColorStrength ) ) ));
				half3 From56 = _HighlightADistribution;
				float2 uv_IDMap = IN.ase_texcoord2.xy * _IDMap_ST.xy + _IDMap_ST.zw;
				half4 tex2DNode50 = tex2D( _IDMap, uv_IDMap );
				half ID56 = tex2DNode50.r;
				half Fac56 = _HighlightAStrength;
				half localThreePointDistribution56 = ThreePointDistribution( From56 , ID56 , Fac56 );
				half root58 = tex2DNode26.r;
				half lerpResult61 = lerp( ( 1.0 - root58 ) , root58 , _HighlightAOverlapInvert);
				half4 lerpResult68 = lerp( lerpResult48 , _HighlightAColor , saturate( ( localThreePointDistribution56 * ( 1.0 - ( _HighlightAOverlapEnd * ( 1.0 - lerpResult61 ) ) ) ) ));
				half3 From156 = _HighlightBDistribution;
				half ID156 = tex2DNode50.r;
				half Fac156 = _HighlightBStrength;
				half localThreePointDistribution156 = ThreePointDistribution( From156 , ID156 , Fac156 );
				half lerpResult83 = lerp( ( 1.0 - root58 ) , root58 , _HighlightBOverlapInvert);
				half4 lerpResult80 = lerp( lerpResult68 , _HighlightBColor , saturate( ( localThreePointDistribution156 * ( 1.0 - ( _HighlightBOverlapEnd * ( 1.0 - lerpResult83 ) ) ) ) ));
				#ifdef BOOLEAN_ENABLECOLOR_ON
				half4 staticSwitch95 = lerpResult80;
				#else
				half4 staticSwitch95 = tex2DNode19;
				#endif
				half4 blendOpSrc101 = tex2D( _BlendMap, uv_BlendMap );
				half4 blendOpDest101 = ( _DiffuseStrength * staticSwitch95 );
				half4 lerpBlendMode101 = lerp(blendOpDest101,( blendOpSrc101 * blendOpDest101 ),_BlendStrength);
				half4 blendOpSrc111 = temp_cast_0;
				half4 blendOpDest111 = ( saturate( lerpBlendMode101 ));
				half4 lerpBlendMode111 = lerp(blendOpDest111,( blendOpSrc111 * blendOpDest111 ),( _AOOccludeAll * 0.5 ));
				half4 lerpResult112 = lerp( ( saturate( lerpBlendMode111 )) , _VertexBaseColor , ( ( 1.0 - IN.ase_color.r ) * _VertexColorStrength ));
				float2 uv_FlowMap = IN.ase_texcoord2.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
				half4 tex2DNode177 = tex2D( _FlowMap, uv_FlowMap );
				half3 appendResult183 = (half3(tex2DNode177.r , ( ( _FlowMapInvertG * ( ( 1.0 - tex2DNode177.g ) - tex2DNode177.g ) ) + tex2DNode177.g ) , tex2DNode177.b));
				half3 NormalTS13_g14 = ( ( appendResult183 * float3( 2,2,2 ) ) - float3( 1,1,1 ) );
				half3 Binormal5_g14 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( ase_worldNormal , ase_worldTangent ) );
				half3x3 TBN1_g14 = float3x3(ase_worldTangent, Binormal5_g14, ase_worldNormal);
				half3x3 TBN13_g14 = TBN1_g14;
				half3 localTangentToWorld13_g14 = TangentToWorld13_g14( NormalTS13_g14 , TBN13_g14 );
				half dotResult231 = dot( localTangentToWorld13_g14 , ase_worldViewDir );
				half saferPower236 = abs( ( 1.0 - abs( ( dotResult231 + _Shift1 ) ) ) );
				half saferPower246 = abs( ( 1.0 - abs( ( dotResult231 + _Shift2 ) ) ) );
				
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				half In175 = _AlphaClip2;
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				half2 ScreenPosition175 = ase_screenPosNorm.xy;
				half localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				
				float3 Albedo = ( ( ( pow( saferPower267 , _RImPower ) * _RImMultiplier ) * _RimColor ) + ( lerpResult112 + ( _HighlightColor1 * pow( saferPower236 , _Pow1 ) * _Multiplier1 ) + ( _HighlightColor1 * pow( saferPower246 , _Pow2 ) * _Multiplier2 ) ) ).rgb;
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;

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
			#define _EMISSION
			#define _ALPHATEST_ON 1
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
				float3 worldNormal : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NormalMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _FlowMap_ST;
			half4 _HighlightColor1;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightAColor;
			half4 _RootMap_ST;
			half4 _EndColor;
			half4 _RootColor;
			half4 _HighlightBColor;
			half4 _DiffuseMap_ST;
			half4 _MaskMap_ST;
			half4 _BlendMap_ST;
			half4 _RimColor;
			half3 _HighlightADistribution;
			half3 _HighlightBDistribution;
			half _SmoothnessMin;
			half _NormalStrength;
			half _SmoothnessPower;
			half _AlphaRemap;
			half _RImMultiplier;
			half _Multiplier2;
			half _Pow2;
			half _Shift2;
			half _Multiplier1;
			half _Pow1;
			half _Shift1;
			half _FlowMapInvertG;
			half _SmoothnessMax;
			half _RImPower;
			half _AOOccludeAll;
			half _AOStrength;
			half _DiffuseStrength;
			half _InvertRootMap;
			half _GlobalStrength;
			half _RootColorStrength;
			half _EndColorStrength;
			half _HighlightAStrength;
			half _VertexColorStrength;
			half _HighlightAOverlapEnd;
			half _AlphaPower;
			half _HighlightBStrength;
			half _HighlightBOverlapEnd;
			half _HighlightBOverlapInvert;
			half _BlendStrength;
			half _BaseColorStrength;
			half _HighlightAOverlapInvert;
			half _AlphaClip2;
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


			half UnityDither175( half In, half2 ScreenPosition )
			{
				half2 uv = ScreenPosition.xy * _ScreenParams.xy;
				half DITHER_THRESHOLDS[16] =
				{
				                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,
				                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,
				                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,
				                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0
				};
				uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
				return In - DITHER_THRESHOLDS[index];
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				
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

				float2 uv_DiffuseMap = IN.ase_texcoord3.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				half In175 = _AlphaClip2;
				float4 screenPos = IN.ase_texcoord4;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				half2 ScreenPosition175 = ase_screenPosNorm.xy;
				half localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;
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
			#define _EMISSION
			#define _ALPHATEST_ON 1
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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_TANGENT
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local BOOLEAN_ENABLECOLOR_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				half4 ase_color : COLOR;
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
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _NormalMap_ST;
			half4 _EmissiveColor;
			half4 _EmissionMap_ST;
			half4 _FlowMap_ST;
			half4 _HighlightColor1;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightAColor;
			half4 _RootMap_ST;
			half4 _EndColor;
			half4 _RootColor;
			half4 _HighlightBColor;
			half4 _DiffuseMap_ST;
			half4 _MaskMap_ST;
			half4 _BlendMap_ST;
			half4 _RimColor;
			half3 _HighlightADistribution;
			half3 _HighlightBDistribution;
			half _SmoothnessMin;
			half _NormalStrength;
			half _SmoothnessPower;
			half _AlphaRemap;
			half _RImMultiplier;
			half _Multiplier2;
			half _Pow2;
			half _Shift2;
			half _Multiplier1;
			half _Pow1;
			half _Shift1;
			half _FlowMapInvertG;
			half _SmoothnessMax;
			half _RImPower;
			half _AOOccludeAll;
			half _AOStrength;
			half _DiffuseStrength;
			half _InvertRootMap;
			half _GlobalStrength;
			half _RootColorStrength;
			half _EndColorStrength;
			half _HighlightAStrength;
			half _VertexColorStrength;
			half _HighlightAOverlapEnd;
			half _AlphaPower;
			half _HighlightBStrength;
			half _HighlightBOverlapEnd;
			half _HighlightBOverlapInvert;
			half _BlendStrength;
			half _BaseColorStrength;
			half _HighlightAOverlapInvert;
			half _AlphaClip2;
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
			sampler2D _NormalMap;
			sampler2D _MaskMap;
			sampler2D _BlendMap;
			sampler2D _DiffuseMap;
			sampler2D _RootMap;
			sampler2D _IDMap;
			sampler2D _FlowMap;
			sampler2D _EmissionMap;


			half3 TangentToWorld13_g15( half3 NormalTS, half3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			half ThreePointDistribution( half3 From, half ID, half Fac )
			{
				float lower = smoothstep(From.x, From.y, ID);
				float upper = 1.0 - smoothstep(From.y, From.z, ID);
				return Fac * lerp(lower, upper, step(From.y, ID));
			}
			
			half3 TangentToWorld13_g14( half3 NormalTS, half3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			half UnityDither175( half In, half2 ScreenPosition )
			{
				half2 uv = ScreenPosition.xy * _ScreenParams.xy;
				half DITHER_THRESHOLDS[16] =
				{
				                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,
				                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,
				                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,
				                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0
				};
				uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
				return In - DITHER_THRESHOLDS[index];
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				
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
				half4 ase_color : COLOR;

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
				o.ase_color = v.ase_color;
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
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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

				float2 uv_NormalMap = IN.ase_texcoord7.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				half3 unpack139 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalStrength );
				unpack139.z = lerp( 1, unpack139.z, saturate(_NormalStrength) );
				half3 tex2DNode139 = unpack139;
				half3 NormalTS13_g15 = tex2DNode139;
				half3 Binormal5_g15 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( WorldNormal , WorldTangent ) );
				half3x3 TBN1_g15 = float3x3(WorldTangent, Binormal5_g15, WorldNormal);
				half3x3 TBN13_g15 = TBN1_g15;
				half3 localTangentToWorld13_g15 = TangentToWorld13_g15( NormalTS13_g15 , TBN13_g15 );
				half dotResult262 = dot( WorldViewDirection , localTangentToWorld13_g15 );
				half saferPower267 = abs( ( 1.0 - abs( dotResult262 ) ) );
				float2 uv_MaskMap = IN.ase_texcoord7.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				half4 tex2DNode115 = tex2D( _MaskMap, uv_MaskMap );
				half temp_output_119_0 = ( 1.0 - ( _AOStrength * ( 1.0 - tex2DNode115.g ) ) );
				half4 temp_cast_0 = (temp_output_119_0).xxxx;
				float2 uv_BlendMap = IN.ase_texcoord7.xy * _BlendMap_ST.xy + _BlendMap_ST.zw;
				float2 uv_DiffuseMap = IN.ase_texcoord7.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half4 color46 = IsGammaSpace() ? half4(1,1,1,0) : half4(1,1,1,0);
				half4 lerpResult45 = lerp( color46 , tex2DNode19 , _BaseColorStrength);
				float2 uv_RootMap = IN.ase_texcoord7.xy * _RootMap_ST.xy + _RootMap_ST.zw;
				half4 tex2DNode26 = tex2D( _RootMap, uv_RootMap );
				half lerpResult40 = lerp( tex2DNode26.r , ( 1.0 - tex2DNode26.r ) , _InvertRootMap);
				half4 lerpResult43 = lerp( _RootColor , _EndColor , lerpResult40);
				half4 lerpResult48 = lerp( lerpResult45 , lerpResult43 , ( _GlobalStrength * ( ( ( 1.0 - tex2DNode26.r ) * _RootColorStrength ) + ( tex2DNode26.r * _EndColorStrength ) ) ));
				half3 From56 = _HighlightADistribution;
				float2 uv_IDMap = IN.ase_texcoord7.xy * _IDMap_ST.xy + _IDMap_ST.zw;
				half4 tex2DNode50 = tex2D( _IDMap, uv_IDMap );
				half ID56 = tex2DNode50.r;
				half Fac56 = _HighlightAStrength;
				half localThreePointDistribution56 = ThreePointDistribution( From56 , ID56 , Fac56 );
				half root58 = tex2DNode26.r;
				half lerpResult61 = lerp( ( 1.0 - root58 ) , root58 , _HighlightAOverlapInvert);
				half4 lerpResult68 = lerp( lerpResult48 , _HighlightAColor , saturate( ( localThreePointDistribution56 * ( 1.0 - ( _HighlightAOverlapEnd * ( 1.0 - lerpResult61 ) ) ) ) ));
				half3 From156 = _HighlightBDistribution;
				half ID156 = tex2DNode50.r;
				half Fac156 = _HighlightBStrength;
				half localThreePointDistribution156 = ThreePointDistribution( From156 , ID156 , Fac156 );
				half lerpResult83 = lerp( ( 1.0 - root58 ) , root58 , _HighlightBOverlapInvert);
				half4 lerpResult80 = lerp( lerpResult68 , _HighlightBColor , saturate( ( localThreePointDistribution156 * ( 1.0 - ( _HighlightBOverlapEnd * ( 1.0 - lerpResult83 ) ) ) ) ));
				#ifdef BOOLEAN_ENABLECOLOR_ON
				half4 staticSwitch95 = lerpResult80;
				#else
				half4 staticSwitch95 = tex2DNode19;
				#endif
				half4 blendOpSrc101 = tex2D( _BlendMap, uv_BlendMap );
				half4 blendOpDest101 = ( _DiffuseStrength * staticSwitch95 );
				half4 lerpBlendMode101 = lerp(blendOpDest101,( blendOpSrc101 * blendOpDest101 ),_BlendStrength);
				half4 blendOpSrc111 = temp_cast_0;
				half4 blendOpDest111 = ( saturate( lerpBlendMode101 ));
				half4 lerpBlendMode111 = lerp(blendOpDest111,( blendOpSrc111 * blendOpDest111 ),( _AOOccludeAll * 0.5 ));
				half4 lerpResult112 = lerp( ( saturate( lerpBlendMode111 )) , _VertexBaseColor , ( ( 1.0 - IN.ase_color.r ) * _VertexColorStrength ));
				float2 uv_FlowMap = IN.ase_texcoord7.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
				half4 tex2DNode177 = tex2D( _FlowMap, uv_FlowMap );
				half3 appendResult183 = (half3(tex2DNode177.r , ( ( _FlowMapInvertG * ( ( 1.0 - tex2DNode177.g ) - tex2DNode177.g ) ) + tex2DNode177.g ) , tex2DNode177.b));
				half3 NormalTS13_g14 = ( ( appendResult183 * float3( 2,2,2 ) ) - float3( 1,1,1 ) );
				half3 Binormal5_g14 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( WorldNormal , WorldTangent ) );
				half3x3 TBN1_g14 = float3x3(WorldTangent, Binormal5_g14, WorldNormal);
				half3x3 TBN13_g14 = TBN1_g14;
				half3 localTangentToWorld13_g14 = TangentToWorld13_g14( NormalTS13_g14 , TBN13_g14 );
				half dotResult231 = dot( localTangentToWorld13_g14 , WorldViewDirection );
				half saferPower236 = abs( ( 1.0 - abs( ( dotResult231 + _Shift1 ) ) ) );
				half saferPower246 = abs( ( 1.0 - abs( ( dotResult231 + _Shift2 ) ) ) );
				
				float2 uv_EmissionMap = IN.ase_texcoord7.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				half saferPower126 = abs( tex2DNode115.a );
				half lerpResult128 = lerp( _SmoothnessMin , _SmoothnessMax , pow( saferPower126 , _SmoothnessPower ));
				
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				half In175 = _AlphaClip2;
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				half2 ScreenPosition175 = ase_screenPosNorm.xy;
				half localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				float3 Albedo = ( ( ( pow( saferPower267 , _RImPower ) * _RImMultiplier ) * _RimColor ) + ( lerpResult112 + ( _HighlightColor1 * pow( saferPower236 , _Pow1 ) * _Multiplier1 ) + ( _HighlightColor1 * pow( saferPower246 , _Pow2 ) * _Multiplier2 ) ) ).rgb;
				float3 Normal = tex2DNode139;
				float3 Emission = ( tex2D( _EmissionMap, uv_EmissionMap ) * _EmissiveColor ).rgb;
				float3 Specular = 0.5;
				float Metallic = tex2DNode115.r;
				float Smoothness = lerpResult128;
				float Occlusion = temp_output_119_0;
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
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
					float shadow = _TransmissionShadow;
				
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
Version=18934
1913;47;1920;969;1910.365;789.4383;2.135767;True;False
Node;AmplifyShaderEditor.CommentaryNode;256;-2613.907,-2112.483;Inherit;False;1686.956;620.6965;;16;253;252;254;251;250;183;185;184;182;186;181;187;180;179;178;177;Flow Map;0,0.0816164,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;49;-7940.442,-2644.624;Inherit;False;2080.23;986.8006;;24;45;47;33;46;38;34;36;35;37;43;41;26;30;39;44;40;28;48;42;27;29;31;32;58;Root / End Blending;0,1,0.2533042,1;0;0
Node;AmplifyShaderEditor.SamplerNode;177;-2469.724,-1878.741;Inherit;True;Property;_FlowMap;Flow Map;39;0;Create;True;0;0;0;False;0;False;-1;cc37af08370d26540b0e6725a8b8879e;f31dfb87d347aa64d8a826f975304ba2;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;26;-7890.442,-2379.623;Inherit;True;Property;_RootMap;Root Map;18;0;Create;True;0;0;0;False;0;False;-1;None;2b9a5778cbf3e534f8790e88f06e76af;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;72;-5480.216,-2235.42;Inherit;False;1717.083;890.5963;;18;55;67;64;65;63;71;70;56;53;69;66;52;54;61;59;60;68;57;Highlight A;0,1,0.2131615,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;58;-7572.616,-2073.293;Inherit;False;root;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;178;-2105.454,-1974.788;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;42;-7357.494,-2191.375;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;73;-4857.816,-968.7963;Inherit;False;1716.951;892.6089;;16;157;156;80;74;92;86;77;91;87;78;84;76;83;85;88;81;Highlight B;0,1,0.1391485,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;180;-2104.155,-2062.483;Inherit;False;Property;_FlowMapInvertG;Flow Map Invert G;40;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;179;-1955.154,-1931.087;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;59;-5441.216,-1553.194;Inherit;False;58;root;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;186;-2096.454,-1731.788;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;60;-5221.217,-1600.194;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;39;-7236.494,-2127.375;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;81;-4804.949,-288.5695;Inherit;False;58;root;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;181;-1799.255,-2006.187;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-7314.442,-2421.623;Inherit;False;Property;_RootColorStrength;Root Color Strength;20;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-7310.442,-2271.623;Inherit;False;Property;_EndColorStrength;End Color Strength;21;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-7297.442,-2040.624;Inherit;False;Property;_InvertRootMap;Invert Root Map;22;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;25;-8113.595,-607.3702;Inherit;False;931.0713;575.9611;;6;19;21;22;23;20;24;Diffuse & Alpha;0,1,0.2258735,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-5442.353,-1454.824;Inherit;False;Property;_HighlightAOverlapInvert;Highlight A Overlap Invert;30;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;34;-7255.494,-2535.376;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;41;-7136.494,-2176.375;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;187;-2093.454,-1759.788;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;61;-5031.216,-1572.194;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-6970.495,-2363.375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;40;-6982.495,-2151.375;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;115;-2586.726,2657.764;Inherit;True;Property;_MaskMap;Mask Map;8;0;Create;True;0;0;0;False;0;False;-1;None;444d0c817d0a7bc428463ac8655842b2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;19;-8063.595,-557.3702;Inherit;True;Property;_DiffuseMap;Diffuse Map;0;0;Create;True;0;0;0;False;0;False;-1;None;3fbc99f6243d08943aa80607f4fa6dec;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;85;-4591.949,-331.5695;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;184;-1583.456,-1759.788;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-6972.495,-2468.375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-4745.085,-188.2001;Inherit;False;Property;_HighlightBOverlapInvert;Highlight B Overlap Invert;35;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;185;-1584.456,-1728.788;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;182;-1646.669,-1872.442;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;47;-6878.233,-1753.476;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;54;-5359.353,-1756.824;Inherit;False;Property;_HighlightAOverlapEnd;Highlight A Overlap End;29;0;Create;True;0;0;0;False;0;False;1;0.753;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;31;-6643.443,-2346.113;Inherit;False;Property;_RootColor;Root Color;23;0;Create;True;0;0;0;False;0;False;0.3294118,0.1411765,0.05098039,0;0.3391081,0.2690152,0.0849447,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;155;-2037.84,3182.767;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-6694.63,-1773.823;Inherit;False;Property;_BaseColorStrength;Base Color Strength;4;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;46;-6916.459,-1996.865;Inherit;False;Constant;_DefaultBaseColor;Default Base Color;11;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;50;-6150.171,-1259.694;Inherit;True;Property;_IDMap;ID Map;25;0;Create;True;0;0;0;False;0;False;-1;None;fd90b191f6d70424c88a473d176d575a;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;183;-1506.334,-1800.317;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-6949.443,-2594.624;Inherit;False;Property;_GlobalStrength;Global Strength;19;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-6800.495,-2422.375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;63;-4843.216,-1615.194;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;44;-6671.495,-2166.375;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;122;-1450.725,3110.2;Inherit;False;721.7638;249.5405;;5;120;116;117;118;119;Ambient Occlusion;0,1,0.9515676,1;0;0
Node;AmplifyShaderEditor.ColorNode;32;-6640.932,-2125.878;Inherit;False;Property;_EndColor;End Color;24;0;Create;True;0;0;0;False;0;False;0.6039216,0.454902,0.2862745,0;1,0.8160401,0.5494938,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;83;-4408.948,-305.5696;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;52;-5336.153,-2079.217;Inherit;False;Property;_HighlightADistribution;Highlight A Distribution;28;0;Create;True;0;0;0;False;0;False;0.1,0.2,0.3;0.2823,0.8031,0.9103001;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;45;-6359.132,-1948.475;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;250;-1367.906,-1743.516;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;43;-6363.495,-2251.375;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-6614.495,-2493.375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;120;-1400.725,3257.127;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;57;-5413.66,-1864.789;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;84;-4737.085,-490.1994;Inherit;False;Property;_HighlightBOverlapEnd;Highlight B Overlap End;34;0;Create;True;0;0;0;False;0;False;1;0.258;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-5358.338,-1846.507;Inherit;False;Property;_HighlightAStrength;Highlight A Strength;26;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;-4663.326,-1744.405;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;76;-4225.948,-364.5695;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;87;-4713.885,-812.5936;Inherit;False;Property;_HighlightBDistribution;Highlight B Distribution;33;0;Create;True;0;0;0;False;0;False;0.1,0.2,0.3;0.7637001,0.9175001,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-4041.058,-477.7805;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;65;-4501.104,-1802.937;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-4736.071,-579.8825;Inherit;False;Property;_HighlightBStrength;Highlight B Strength;31;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;117;-1268.89,3248.74;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;48;-6042.212,-2247.363;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;157;-4801.346,-664.5075;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;251;-1222.407,-1690.918;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;116;-1391.273,3160.2;Inherit;False;Property;_AOStrength;Ambient Occlusion Strength;9;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;56;-4936.353,-1999.824;Inherit;False;float lower = smoothstep(From.x, From.y, ID)@$float upper = 1.0 - smoothstep(From.y, From.z, ID)@$return Fac * lerp(lower, upper, step(From.y, ID))@;1;Create;3;True;From;FLOAT3;0,0,0;In;;Inherit;False;True;ID;FLOAT;0;In;;Inherit;False;True;Fac;FLOAT;0;In;;Inherit;False;Three Point Distribution;False;False;0;;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;254;-1008.951,-1583.205;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;77;-3878.837,-536.3135;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;-4310.933,-1888.297;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;71;-5415.104,-2185.42;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomExpressionNode;156;-4341.332,-706.8046;Inherit;False;float lower = smoothstep(From.x, From.y, ID)@$float upper = 1.0 - smoothstep(From.y, From.z, ID)@$return Fac * lerp(lower, upper, step(From.y, ID))@;1;Create;3;True;From;FLOAT3;0,0,0;In;;Inherit;False;True;ID;FLOAT;0;In;;Inherit;False;True;Fac;FLOAT;0;In;;Inherit;False;Three Point Distribution;False;False;0;;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;118;-1079.89,3179.238;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;70;-4435.162,-2180.724;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;252;-1100.779,-1540.823;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;119;-907.9623,3187.773;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;69;-4592.828,-2120.777;Inherit;False;Property;_HighlightAColor;Highlight A Color;27;0;Create;True;0;0;0;False;0;False;0.9137255,0.7803922,0.6352941,0;1,0.9537699,0.8679587,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;86;-3688.665,-621.6724;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;67;-4137.933,-1887.297;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;141;-1461.428,820.1206;Inherit;False;696.864;315.2571;;2;139;140;Normals;0,0.07073355,1,1;0;0
Node;AmplifyShaderEditor.WireNode;165;-976.356,3532.227;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;92;-3970.56,-854.1534;Inherit;False;Property;_HighlightBColor;Highlight B Color;32;0;Create;True;0;0;0;False;0;False;1,1,1,0;0.4889122,0.2297351,0.110702,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;74;-3515.664,-620.6724;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;257;-2803.824,-1292.809;Inherit;False;2013.052;771.9266;;22;255;234;229;239;212;231;238;237;232;240;241;235;245;225;236;246;199;247;243;244;258;259;Anisotropic Effect;0.4634771,0,1,1;0;0
Node;AmplifyShaderEditor.WireNode;253;-2598.287,-1533.76;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;68;-3945.133,-2134.022;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;121;-2799.167,-347.4619;Inherit;False;2048.943;801.3671;;20;112;111;113;114;107;101;106;108;99;98;105;97;96;95;104;102;163;164;168;171;Final Color Blending;0,1,0.1873093,1;0;0
Node;AmplifyShaderEditor.WireNode;167;-2168.921,3376.054;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;255;-2753.824,-1242.809;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;80;-3322.864,-867.3986;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;234;-2546.089,-1242.166;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;140;-1411.428,1019.378;Inherit;False;Property;_NormalStrength;Normal Strength;15;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;272;-2215.947,-1393.323;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;139;-1084.565,870.1206;Inherit;True;Property;_NormalMap;Normal Map;14;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;166;-2774.67,2704.054;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;229;-2619.347,-1064.574;Inherit;False;URP Tangent To World Normal;-1;;14;e73075222d6e6944aa84a1f1cd458852;0;1;14;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;102;-2793.854,-32.58878;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;103;-4983.848,158.4388;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;231;-2281.833,-1175.18;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-8055.523,-260.4084;Inherit;False;Property;_AlphaRemap;Alpha Remap;6;0;Create;True;0;0;0;False;0;False;0.5;0.5;0.5;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;95;-2600.514,1.1864;Inherit;False;Property;BOOLEAN_ENABLECOLOR;Enable Color;38;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_ENABLECOLOR_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-2367,-924.3741;Inherit;False;Property;_Shift1;Shift1;44;0;Create;True;0;0;0;False;0;False;-0.04;-0.04;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;239;-2374.178,-710.1767;Inherit;False;Property;_Shift2;Shift2;45;0;Create;True;0;0;0;False;0;False;0.2;0.2;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;96;-2601.405,-89.1741;Inherit;False;Property;_DiffuseStrength;Diffuse Strength;1;0;Create;True;0;0;0;False;0;False;1;0.526;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;168;-2402.657,303.2917;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;261;-518.7381,-241.6127;Inherit;True;URP Tangent To World Normal;-1;;15;e73075222d6e6944aa84a1f1cd458852;0;1;14;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;271;-784.9111,-1371.093;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;99;-2597.587,116.9302;Inherit;False;Property;_BlendStrength;Blend Strength;17;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;237;-2023.088,-1092.166;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;238;-2020.739,-811.0908;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;21;-7710.523,-347.4088;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;104;-2283.423,231.9397;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;98;-2617.306,-292.4619;Inherit;True;Property;_BlendMap;Blend Map;16;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-2281.978,-52.0971;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;169;-1928.502,43.00317;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;262;-151.7978,-330.9475;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-7685.523,-147.4086;Inherit;False;Property;_AlphaPower;Alpha Power;5;0;Create;True;0;0;0;False;0;False;1;1;0.01;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-2099.423,342.9396;Inherit;False;Property;_VertexColorStrength;Vertex Color Strength;3;0;Create;True;0;0;0;False;0;False;0.5;0.15;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;240;-1823.761,-750.9628;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;171;-1725.854,-101.5312;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;105;-2042.422,256.9396;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;101;-2091.139,-78.27047;Inherit;False;Multiply;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;108;-1850.69,31.40487;Inherit;False;Property;_AOOccludeAll;AO Occlude All;10;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;22;-7555.524,-310.4087;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;132;-1495.507,2059.158;Inherit;False;704;186;;3;138;137;131;Metallic;0,1,0.9407032,1;0;0
Node;AmplifyShaderEditor.WireNode;152;-2028.195,2229.776;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;274;-58.59428,-474.7622;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;130;-1835.177,2452.594;Inherit;False;1090.432;405.9395;;7;154;128;125;129;124;126;123;Smoothness;0,1,0.9505663,1;0;0
Node;AmplifyShaderEditor.AbsOpNode;232;-1775.462,-1041.623;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;275;98.68103,-457.1729;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;154;-1796.699,2652.253;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;137;-1480.992,2134.789;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;245;-1747.865,-636.8815;Inherit;False;Property;_Pow2;Pow2;47;0;Create;True;0;0;0;False;0;False;6;2;0.01;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;164;-1437.551,-156.0408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;241;-1661.962,-763.5629;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-1790.422,274.9395;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;170;-1614.104,-21.06878;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;235;-1624.362,-1015.771;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;23;-7359.523,-238.4082;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;163;-1517.469,56.52478;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;263;-178.2839,-108.6203;Inherit;False;Property;_RImPower;RIm Power;48;0;Create;True;0;0;0;False;0;False;4;4;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-1777.459,2744.462;Inherit;False;Property;_SmoothnessPower;Smoothness Power;11;0;Create;True;0;0;0;False;0;False;1.25;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;225;-1732.682,-931.3612;Inherit;False;Property;_Pow1;Pow1;46;0;Create;True;0;0;0;False;0;False;3;2;0.01;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;259;-1446.836,-598.7764;Inherit;False;Property;_Multiplier2;Multiplier2;43;0;Create;True;0;0;0;False;0;False;3;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;246;-1430.665,-692.78;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;265;-185.0634,-27.35223;Inherit;False;Property;_RImMultiplier;RIm Multiplier;49;0;Create;True;0;0;0;False;0;False;1;0.1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;111;-1274.69,-100.5951;Inherit;False;Multiply;True;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;236;-1435.563,-1037.074;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;114;-1145.226,255.6993;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;131;-1212.507,2109.158;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;113;-1282.692,68.1661;Inherit;False;Property;_VertexBaseColor;Vertex Base Color;2;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.7443256,0.5606278,0.3524737,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;126;-1478.013,2618.392;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;199;-1436.669,-915.4138;Inherit;False;Property;_HighlightColor1;Highlight Color 1;41;0;Create;True;0;0;0;False;0;False;0.4509804,0.3058824,0.2313726,0;0.4528301,0.3061588,0.232823,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;136;-1386.323,1374.657;Inherit;False;621.4995;462.2001;Comment;3;133;134;135;Emission;1,0,0.8837481,1;0;0
Node;AmplifyShaderEditor.PowerNode;267;125.9366,-278.3522;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;161;-5010.111,577.6486;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;258;-1769.836,-1159.776;Inherit;False;Property;_Multiplier1;Multiplier1;42;0;Create;True;0;0;0;False;0;False;3;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-1288.258,2587.188;Inherit;False;Property;_SmoothnessMax;Smoothness Max;13;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;264;-200.6741,90.07231;Inherit;False;Property;_RimColor;Rim Color;50;0;Create;True;0;0;0;False;0;False;0.8,0.5686275,0.427451,0;0.8018868,0.5704757,0.4274208,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;247;-1195.365,-772.0822;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;133;-1336.324,1424.657;Inherit;True;Property;_EmissionMap;Emission Map;36;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;129;-1125.3,2691.267;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;134;-1294.724,1624.857;Inherit;False;Property;_EmissiveColor;Emissive Color;37;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;266;282.9366,-179.3522;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;243;-1194.672,-1097.199;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;153;-899.6559,2133.319;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;160;-2467.833,3326.125;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;112;-932.222,47.48609;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;124;-1287.262,2502.594;Inherit;False;Property;_SmoothnessMin;Smoothness Min;12;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;128;-926.7459,2570.35;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;151;-514.5452,2661.083;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;162;-116.1127,1806.874;Inherit;False;Property;_AlphaClip2;Alpha Clip;7;0;Create;False;0;0;0;False;0;False;0.15;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;176;-54.07501,1944.279;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;135;-926.825,1506.557;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;244;-943.7717,-1111.8;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;269;446.9366,-65.35223;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;158;-806.2621,3526.541;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;138;-834.2736,2100.206;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;175;242.925,1698.279;Inherit;False;half2 uv = ScreenPosition.xy * _ScreenParams.xy@$half DITHER_THRESHOLDS[16] =${$                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,$                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,$                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,$                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0$}@$uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4@$return In - DITHER_THRESHOLDS[index]@;1;Create;2;True;In;FLOAT;0;In;;Inherit;False;True;ScreenPosition;FLOAT2;0,0;In;;Inherit;False;Unity Dither;True;False;0;;False;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;147;-144.3588,1166.809;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;146;-145.3696,1073.48;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;270;215.1497,268.756;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;149;-142.5707,1520.562;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;159;-126.5291,1631.513;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;148;-143.3369,1266.146;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;150;-143.6767,1394.162;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-272.7546,-68.18864;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;6;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;7;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;406.7545,1026.333;Half;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;Reallusion/Amplify/RL_HairShader_FakeAniso_URP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;38;Workflow;1;0;Surface;0;637783597523522226;  Refraction Model;0;637783580232843266;  Blend;0;0;Two Sided;0;637783597481927776;Fragment Normal Space,InvertActionOnDeselection;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,-1;0;Translucency;0;637783665945206061;  Translucency Strength;2,False,-1;637783663348617131;  Normal Distortion;1,False,-1;637783663267523770;  Scattering;4,False,-1;637783663284300578;  Direct;0.9,False,-1;0;  Ambient;0.1,False,-1;0;  Shadow;0.5,False,-1;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,-1;0;  Type;0;0;  Tess;16,False,-1;0;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;0;8;False;True;True;True;True;True;True;True;False;;False;0
WireConnection;58;0;26;1
WireConnection;178;1;177;2
WireConnection;42;0;26;1
WireConnection;179;0;178;0
WireConnection;179;1;177;2
WireConnection;186;0;177;3
WireConnection;60;0;59;0
WireConnection;39;0;26;1
WireConnection;181;0;180;0
WireConnection;181;1;179;0
WireConnection;34;0;26;1
WireConnection;41;0;42;0
WireConnection;187;0;177;1
WireConnection;61;0;60;0
WireConnection;61;1;59;0
WireConnection;61;2;55;0
WireConnection;36;0;26;1
WireConnection;36;1;28;0
WireConnection;40;0;41;0
WireConnection;40;1;39;0
WireConnection;40;2;29;0
WireConnection;85;0;81;0
WireConnection;184;0;187;0
WireConnection;35;0;34;0
WireConnection;35;1;27;0
WireConnection;185;0;186;0
WireConnection;182;0;181;0
WireConnection;182;1;177;2
WireConnection;47;0;19;0
WireConnection;155;0;115;2
WireConnection;183;0;184;0
WireConnection;183;1;182;0
WireConnection;183;2;185;0
WireConnection;37;0;35;0
WireConnection;37;1;36;0
WireConnection;63;0;61;0
WireConnection;44;0;40;0
WireConnection;83;0;85;0
WireConnection;83;1;81;0
WireConnection;83;2;88;0
WireConnection;45;0;46;0
WireConnection;45;1;47;0
WireConnection;45;2;33;0
WireConnection;250;0;183;0
WireConnection;43;0;31;0
WireConnection;43;1;32;0
WireConnection;43;2;44;0
WireConnection;38;0;30;0
WireConnection;38;1;37;0
WireConnection;120;0;155;0
WireConnection;57;0;50;1
WireConnection;64;0;54;0
WireConnection;64;1;63;0
WireConnection;76;0;83;0
WireConnection;78;0;84;0
WireConnection;78;1;76;0
WireConnection;65;0;64;0
WireConnection;117;0;120;0
WireConnection;48;0;45;0
WireConnection;48;1;43;0
WireConnection;48;2;38;0
WireConnection;157;0;50;1
WireConnection;251;0;250;0
WireConnection;56;0;52;0
WireConnection;56;1;57;0
WireConnection;56;2;53;0
WireConnection;254;0;251;0
WireConnection;77;0;78;0
WireConnection;66;0;56;0
WireConnection;66;1;65;0
WireConnection;71;0;48;0
WireConnection;156;0;87;0
WireConnection;156;1;157;0
WireConnection;156;2;91;0
WireConnection;118;0;116;0
WireConnection;118;1;117;0
WireConnection;70;0;71;0
WireConnection;252;0;254;0
WireConnection;119;0;118;0
WireConnection;86;0;156;0
WireConnection;86;1;77;0
WireConnection;67;0;66;0
WireConnection;165;0;119;0
WireConnection;74;0;86;0
WireConnection;253;0;252;0
WireConnection;68;0;70;0
WireConnection;68;1;69;0
WireConnection;68;2;67;0
WireConnection;167;0;165;0
WireConnection;255;0;253;0
WireConnection;80;0;68;0
WireConnection;80;1;92;0
WireConnection;80;2;74;0
WireConnection;272;0;234;0
WireConnection;139;5;140;0
WireConnection;166;0;167;0
WireConnection;229;14;255;0
WireConnection;102;0;80;0
WireConnection;103;0;19;0
WireConnection;231;0;229;0
WireConnection;231;1;234;0
WireConnection;95;1;103;0
WireConnection;95;0;102;0
WireConnection;168;0;166;0
WireConnection;261;14;139;0
WireConnection;271;0;272;0
WireConnection;237;0;231;0
WireConnection;237;1;212;0
WireConnection;238;0;231;0
WireConnection;238;1;239;0
WireConnection;21;0;19;4
WireConnection;21;1;20;0
WireConnection;97;0;96;0
WireConnection;97;1;95;0
WireConnection;169;0;168;0
WireConnection;262;0;271;0
WireConnection;262;1;261;0
WireConnection;240;0;238;0
WireConnection;171;0;169;0
WireConnection;105;0;104;1
WireConnection;101;0;98;0
WireConnection;101;1;97;0
WireConnection;101;2;99;0
WireConnection;22;0;21;0
WireConnection;152;0;115;1
WireConnection;274;0;262;0
WireConnection;232;0;237;0
WireConnection;275;0;274;0
WireConnection;154;0;115;4
WireConnection;137;0;152;0
WireConnection;164;0;171;0
WireConnection;241;0;240;0
WireConnection;107;0;105;0
WireConnection;107;1;106;0
WireConnection;170;0;101;0
WireConnection;235;0;232;0
WireConnection;23;0;22;0
WireConnection;23;1;24;0
WireConnection;163;0;108;0
WireConnection;246;0;241;0
WireConnection;246;1;245;0
WireConnection;111;0;164;0
WireConnection;111;1;170;0
WireConnection;111;2;163;0
WireConnection;236;0;235;0
WireConnection;236;1;225;0
WireConnection;114;0;107;0
WireConnection;131;0;137;0
WireConnection;126;0;154;0
WireConnection;126;1;123;0
WireConnection;267;0;275;0
WireConnection;267;1;263;0
WireConnection;161;0;23;0
WireConnection;247;0;199;0
WireConnection;247;1;246;0
WireConnection;247;2;259;0
WireConnection;129;0;126;0
WireConnection;266;0;267;0
WireConnection;266;1;265;0
WireConnection;243;0;199;0
WireConnection;243;1;236;0
WireConnection;243;2;258;0
WireConnection;153;0;131;0
WireConnection;160;0;161;0
WireConnection;112;0;111;0
WireConnection;112;1;113;0
WireConnection;112;2;114;0
WireConnection;128;0;124;0
WireConnection;128;1;125;0
WireConnection;128;2;129;0
WireConnection;151;0;119;0
WireConnection;135;0;133;0
WireConnection;135;1;134;0
WireConnection;244;0;112;0
WireConnection;244;1;243;0
WireConnection;244;2;247;0
WireConnection;269;0;266;0
WireConnection;269;1;264;0
WireConnection;158;0;160;0
WireConnection;138;0;153;0
WireConnection;175;0;162;0
WireConnection;175;1;176;0
WireConnection;147;0;135;0
WireConnection;146;0;139;0
WireConnection;270;0;269;0
WireConnection;270;1;244;0
WireConnection;149;0;151;0
WireConnection;159;0;158;0
WireConnection;148;0;138;0
WireConnection;150;0;128;0
WireConnection;1;0;270;0
WireConnection;1;1;146;0
WireConnection;1;2;147;0
WireConnection;1;3;148;0
WireConnection;1;4;150;0
WireConnection;1;5;149;0
WireConnection;1;6;159;0
WireConnection;1;7;175;0
ASEEND*/
//CHKSM=8D0F69AA1183D552B10C854144377F6BCDFD2CF0