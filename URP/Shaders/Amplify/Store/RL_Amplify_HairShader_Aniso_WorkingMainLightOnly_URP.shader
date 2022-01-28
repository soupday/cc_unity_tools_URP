// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Reallusion/Amplify/RL_HairShader_Variants_URP1"
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
		[Toggle(BOOLEAN_ENABLECOLOR_ON)] BOOLEAN_ENABLECOLOR("Enable Color", Float) = 0
		_FlowMap("Flow Map", 2D) = "gray" {}
		_FlowMapInvertG("Flow Map Invert G", Float) = 0
		_SpecularTint("Specular Tint", Color) = (1,1,1,0)
		_SpecularPower("Specular Power", Range( 0 , 100)) = 50
		_SpecularMultiplier("Specular Multiplier", Range( 0 , 2)) = 1
		_SpecularShiftMin("Specular Shift Min", Range( -1 , 1)) = 0
		[ASEEnd]_SpecularShiftMax("Specular Shift Max", Range( -1 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

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
		#pragma target 3.0

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
			
			#pragma multi_compile_instancing
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local BOOLEAN_ENABLECOLOR_ON
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
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
				#ifdef ASE_FOG
				float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 lightmapUVOrVertexSH : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _HighlightBColor;
			float4 _HighlightAColor;
			float4 _VertexBaseColor;
			float4 _FlowMap_ST;
			float4 _SpecularTint;
			float4 _IDMap_ST;
			float4 _EndColor;
			float4 _RootMap_ST;
			float4 _DiffuseMap_ST;
			float4 _BlendMap_ST;
			float4 _MaskMap_ST;
			float4 _RootColor;
			float4 _NormalMap_ST;
			float3 _HighlightBDistribution;
			float3 _HighlightADistribution;
			float _VertexColorStrength;
			float _FlowMapInvertG;
			float _SpecularShiftMax;
			float _SpecularShiftMin;
			float _SpecularPower;
			float _SpecularMultiplier;
			float _AlphaRemap;
			float _NormalStrength;
			float _AOOccludeAll;
			float _AOStrength;
			float _HighlightBOverlapInvert;
			float _HighlightBOverlapEnd;
			float _HighlightBStrength;
			float _AlphaPower;
			float _HighlightAOverlapInvert;
			float _HighlightAOverlapEnd;
			float _HighlightAStrength;
			float _EndColorStrength;
			float _RootColorStrength;
			float _GlobalStrength;
			float _InvertRootMap;
			float _BaseColorStrength;
			float _DiffuseStrength;
			float _BlendStrength;
			float _AlphaClip2;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _MaskMap;
			sampler2D _BlendMap;
			sampler2D _DiffuseMap;
			sampler2D _RootMap;
			sampler2D _IDMap;
			sampler2D _FlowMap;
			sampler2D _NormalMap;


			float ThreePointDistribution( float3 From, float ID, float Fac )
			{
				float lower = smoothstep(From.x, From.y, ID);
				float upper = 1.0 - smoothstep(From.y, From.z, ID);
				return Fac * lerp(lower, upper, step(From.y, ID));
			}
			
			float3 TangentToWorld13_g82( float3 NormalTS, float3x3 TBN )
			{
				float3 NormalWS = TransformTangentToWorld(NormalTS, TBN);
				NormalWS = NormalizeNormalPerPixel(NormalWS);
				return NormalWS;
			}
			
			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			
			float UnityDither175( float In, float2 ScreenPosition )
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
			
			
			VertexOutput VertexFunction ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord8 = screenPos;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
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
				#ifdef ASE_FOG
				o.fogFactor = ComputeFogFactor( positionCS.z );
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
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

			half4 frag ( VertexOutput IN  ) : SV_Target
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
				float2 uv_MaskMap = IN.ase_texcoord3.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				float4 tex2DNode115 = tex2D( _MaskMap, uv_MaskMap );
				float4 temp_cast_0 = (( 1.0 - ( _AOStrength * ( 1.0 - tex2DNode115.g ) ) )).xxxx;
				float2 uv_BlendMap = IN.ase_texcoord3.xy * _BlendMap_ST.xy + _BlendMap_ST.zw;
				float2 uv_DiffuseMap = IN.ase_texcoord3.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				float4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				float4 color46 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
				float4 lerpResult45 = lerp( color46 , tex2DNode19 , _BaseColorStrength);
				float2 uv_RootMap = IN.ase_texcoord3.xy * _RootMap_ST.xy + _RootMap_ST.zw;
				float4 tex2DNode26 = tex2D( _RootMap, uv_RootMap );
				float lerpResult40 = lerp( tex2DNode26.r , ( 1.0 - tex2DNode26.r ) , _InvertRootMap);
				float4 lerpResult43 = lerp( _RootColor , _EndColor , lerpResult40);
				float4 lerpResult48 = lerp( lerpResult45 , lerpResult43 , ( _GlobalStrength * ( ( ( 1.0 - tex2DNode26.r ) * _RootColorStrength ) + ( tex2DNode26.r * _EndColorStrength ) ) ));
				float3 From56 = _HighlightADistribution;
				float2 uv_IDMap = IN.ase_texcoord3.xy * _IDMap_ST.xy + _IDMap_ST.zw;
				float4 tex2DNode50 = tex2D( _IDMap, uv_IDMap );
				float ID56 = tex2DNode50.r;
				float Fac56 = _HighlightAStrength;
				float localThreePointDistribution56 = ThreePointDistribution( From56 , ID56 , Fac56 );
				float root58 = tex2DNode26.r;
				float lerpResult61 = lerp( ( 1.0 - root58 ) , root58 , _HighlightAOverlapInvert);
				float4 lerpResult68 = lerp( lerpResult48 , _HighlightAColor , saturate( ( localThreePointDistribution56 * ( 1.0 - ( _HighlightAOverlapEnd * ( 1.0 - lerpResult61 ) ) ) ) ));
				float3 From156 = _HighlightBDistribution;
				float ID156 = tex2DNode50.r;
				float Fac156 = _HighlightBStrength;
				float localThreePointDistribution156 = ThreePointDistribution( From156 , ID156 , Fac156 );
				float lerpResult83 = lerp( ( 1.0 - root58 ) , root58 , _HighlightBOverlapInvert);
				float4 lerpResult80 = lerp( lerpResult68 , _HighlightBColor , saturate( ( localThreePointDistribution156 * ( 1.0 - ( _HighlightBOverlapEnd * ( 1.0 - lerpResult83 ) ) ) ) ));
				#ifdef BOOLEAN_ENABLECOLOR_ON
				float4 staticSwitch95 = lerpResult80;
				#else
				float4 staticSwitch95 = tex2DNode19;
				#endif
				float4 blendOpSrc101 = tex2D( _BlendMap, uv_BlendMap );
				float4 blendOpDest101 = ( _DiffuseStrength * staticSwitch95 );
				float4 lerpBlendMode101 = lerp(blendOpDest101,( blendOpSrc101 * blendOpDest101 ),_BlendStrength);
				float4 blendOpSrc111 = temp_cast_0;
				float4 blendOpDest111 = ( saturate( lerpBlendMode101 ));
				float4 lerpBlendMode111 = lerp(blendOpDest111,( blendOpSrc111 * blendOpDest111 ),( _AOOccludeAll * 0.5 ));
				float4 lerpResult112 = lerp( ( saturate( lerpBlendMode111 )) , _VertexBaseColor , ( ( 1.0 - IN.ase_color.r ) * _VertexColorStrength ));
				float4 albedo331 = lerpResult112;
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float2 uv_FlowMap = IN.ase_texcoord3.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
				float4 tex2DNode177 = tex2D( _FlowMap, uv_FlowMap );
				float3 appendResult183 = (float3(tex2DNode177.r , ( ( _FlowMapInvertG * ( ( 1.0 - tex2DNode177.g ) - tex2DNode177.g ) ) + tex2DNode177.g ) , tex2DNode177.b));
				float3 NormalTS13_g82 = ( ( appendResult183 * float3( 2,2,2 ) ) - float3( 1,1,1 ) );
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 Binormal5_g82 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( ase_worldNormal , ase_worldTangent ) );
				float3x3 TBN1_g82 = float3x3(ase_worldTangent, Binormal5_g82, ase_worldNormal);
				float3x3 TBN13_g82 = TBN1_g82;
				float3 localTangentToWorld13_g82 = TangentToWorld13_g82( NormalTS13_g82 , TBN13_g82 );
				float3 flowTangent377 = localTangentToWorld13_g82;
				float2 uv_NormalMap = IN.ase_texcoord3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				float3 unpack139 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalStrength );
				unpack139.z = lerp( 1, unpack139.z, saturate(_NormalStrength) );
				float3 normal282 = unpack139;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal343 = normal282;
				float3 worldNormal343 = float3(dot(tanToWorld0,tanNormal343), dot(tanToWorld1,tanNormal343), dot(tanToWorld2,tanNormal343));
				float3 temp_output_26_0_g95 = worldNormal343;
				float idMap383 = tex2DNode50.r;
				float lerpResult81_g95 = lerp( _SpecularShiftMin , _SpecularShiftMax , idMap383);
				float3 normalizeResult10_g96 = normalize( ( flowTangent377 + ( temp_output_26_0_g95 * lerpResult81_g95 ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult14_g97 = normalize( ( ase_worldViewDir + _MainLightPosition.xyz ) );
				float dotResult16_g97 = dot( normalizeResult10_g96 , normalizeResult14_g97 );
				float smoothstepResult22_g97 = smoothstep( -1.0 , 0.0 , dotResult16_g97);
				float dotResult30_g95 = dot( temp_output_26_0_g95 , _MainLightPosition.xyz );
				float lerpResult29_g95 = lerp( 0.25 , 1.0 , dotResult30_g95);
				float4 color63_g95 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
				float3 tanNormal53_g95 = temp_output_26_0_g95;
				float3 bakedGI53_g95 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, float3(dot(tanToWorld0,tanNormal53_g95), dot(tanToWorld1,tanNormal53_g95), dot(tanToWorld2,tanNormal53_g95)));
				MixRealtimeAndBakedGI(ase_mainLight, float3(dot(tanToWorld0,tanNormal53_g95), dot(tanToWorld1,tanNormal53_g95), dot(tanToWorld2,tanNormal53_g95)), bakedGI53_g95, half4(0,0,0,0));
				
				float saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				float In175 = _AlphaClip2;
				float4 screenPos = IN.ase_texcoord8;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenPosition175 = ase_screenPosNorm.xy;
				float localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = ( albedo331 * ( ( ase_lightAtten * ( ( ( ( smoothstepResult22_g97 * pow( ( 1.0 - ( dotResult16_g97 * dotResult16_g97 ) ) , _SpecularPower ) ) * _SpecularTint * _SpecularMultiplier ) + ( saturate( lerpResult29_g95 ) * color63_g95 ) ) * _MainLightColor ) ) + float4( bakedGI53_g95 , 0.0 ) ) ).rgb;
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				return half4( Color, Alpha );
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
			
			#pragma multi_compile_instancing
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag
#if ASE_SRP_VERSION >= 110000
			#pragma multi_compile _ _CASTING_PUNCTUAL_LIGHT_SHADOW
#endif
			#define SHADERPASS SHADERPASS_SHADOWCASTER

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
			float4 _HighlightBColor;
			float4 _HighlightAColor;
			float4 _VertexBaseColor;
			float4 _FlowMap_ST;
			float4 _SpecularTint;
			float4 _IDMap_ST;
			float4 _EndColor;
			float4 _RootMap_ST;
			float4 _DiffuseMap_ST;
			float4 _BlendMap_ST;
			float4 _MaskMap_ST;
			float4 _RootColor;
			float4 _NormalMap_ST;
			float3 _HighlightBDistribution;
			float3 _HighlightADistribution;
			float _VertexColorStrength;
			float _FlowMapInvertG;
			float _SpecularShiftMax;
			float _SpecularShiftMin;
			float _SpecularPower;
			float _SpecularMultiplier;
			float _AlphaRemap;
			float _NormalStrength;
			float _AOOccludeAll;
			float _AOStrength;
			float _HighlightBOverlapInvert;
			float _HighlightBOverlapEnd;
			float _HighlightBStrength;
			float _AlphaPower;
			float _HighlightAOverlapInvert;
			float _HighlightAOverlapEnd;
			float _HighlightAStrength;
			float _EndColorStrength;
			float _RootColorStrength;
			float _GlobalStrength;
			float _InvertRootMap;
			float _BaseColorStrength;
			float _DiffuseStrength;
			float _BlendStrength;
			float _AlphaClip2;
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


			float UnityDither175( float In, float2 ScreenPosition )
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

				float3 normalWS = TransformObjectToWorldDir( v.ase_normal );
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
				float4 clipPos = TransformWorldToHClip( ApplyShadowBias( positionWS, normalWS, _LightDirection ) );
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
				float4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				float saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				float In175 = _AlphaClip2;
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenPosition175 = ase_screenPosNorm.xy;
				float localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;
				float AlphaClipThresholdShadow = 0.5;

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
			
			#pragma multi_compile_instancing
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag

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
			float4 _HighlightBColor;
			float4 _HighlightAColor;
			float4 _VertexBaseColor;
			float4 _FlowMap_ST;
			float4 _SpecularTint;
			float4 _IDMap_ST;
			float4 _EndColor;
			float4 _RootMap_ST;
			float4 _DiffuseMap_ST;
			float4 _BlendMap_ST;
			float4 _MaskMap_ST;
			float4 _RootColor;
			float4 _NormalMap_ST;
			float3 _HighlightBDistribution;
			float3 _HighlightADistribution;
			float _VertexColorStrength;
			float _FlowMapInvertG;
			float _SpecularShiftMax;
			float _SpecularShiftMin;
			float _SpecularPower;
			float _SpecularMultiplier;
			float _AlphaRemap;
			float _NormalStrength;
			float _AOOccludeAll;
			float _AOStrength;
			float _HighlightBOverlapInvert;
			float _HighlightBOverlapEnd;
			float _HighlightBStrength;
			float _AlphaPower;
			float _HighlightAOverlapInvert;
			float _HighlightAOverlapEnd;
			float _HighlightAStrength;
			float _EndColorStrength;
			float _RootColorStrength;
			float _GlobalStrength;
			float _InvertRootMap;
			float _BaseColorStrength;
			float _DiffuseStrength;
			float _BlendStrength;
			float _AlphaClip2;
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


			float UnityDither175( float In, float2 ScreenPosition )
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

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = TransformWorldToHClip( positionWS );
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
				float4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				float saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				
				float In175 = _AlphaClip2;
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 ScreenPosition175 = ase_screenPosNorm.xy;
				float localUnityDither175 = UnityDither175( In175 , ScreenPosition175 );
				
				float Alpha = pow( saferPower23 , _AlphaPower );
				float AlphaClipThreshold = localUnityDither175;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				return 0;
			}
			ENDHLSL
		}

	
	}
	
	CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18934
1913;30;1920;999;960.5037;-14.49014;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;20;-8055.523,-260.4084;Inherit;False;Property;_AlphaRemap;Alpha Remap;8;0;Create;True;0;0;0;False;0;False;0.5;0.5;0.5;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;19;-8063.595,-557.3702;Inherit;True;Property;_DiffuseMap;Diffuse Map;2;0;Create;True;0;0;0;False;0;False;-1;None;3fbc99f6243d08943aa80607f4fa6dec;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;21;-7710.523,-347.4088;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-7685.523,-147.4086;Inherit;False;Property;_AlphaPower;Alpha Power;7;0;Create;True;0;0;0;False;0;False;1;1;0.01;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;22;-7555.524,-310.4087;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;23;-7359.523,-238.4082;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;49;-7940.442,-2644.624;Inherit;False;2080.23;986.8006;;24;45;47;33;46;38;34;36;35;37;43;41;26;30;39;44;40;28;48;42;27;29;31;32;58;Root / End Blending;0,1,0.2533042,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;73;-4857.816,-968.7963;Inherit;False;1716.951;892.6089;;16;157;156;80;74;92;86;77;91;87;78;84;76;83;85;88;81;Highlight B;0,1,0.1391485,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;72;-5480.216,-2235.42;Inherit;False;1717.083;890.5963;;18;55;67;64;65;63;71;70;56;53;69;66;52;54;61;59;60;68;57;Highlight A;0,1,0.2131615,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;256;-2729.285,-1235.86;Inherit;False;1863.956;636.6965;;15;376;250;180;181;177;186;183;187;179;182;184;185;251;178;377;Flow Map;0,0.0816164,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;162;-116.1127,1806.874;Inherit;False;Property;_AlphaClip2;Alpha Clip;9;0;Create;False;0;0;0;False;0;False;0.15;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;176;-54.07501,1944.279;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;121;-2799.167,-347.4619;Inherit;False;2048.943;801.3671;;20;112;111;113;114;107;101;106;108;99;98;105;97;96;95;104;102;163;164;168;171;Final Color Blending;0,1,0.1873093,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;122;-1450.725,3110.2;Inherit;False;721.7638;249.5405;;5;120;116;117;118;119;Ambient Occlusion;0,1,0.9515676,1;0;0
Node;AmplifyShaderEditor.WireNode;302;-5151.37,486.9218;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;141;-1732.579,805.0568;Inherit;False;952.864;322.2571;;3;282;139;140;Normals;0,0.07073355,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;132;-1495.507,2059.158;Inherit;False;704;186;;2;137;131;Metallic;0,1,0.9407032,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;136;-1386.323,1374.657;Inherit;False;621.4995;462.2001;Comment;3;133;134;135;Emission;1,0,0.8837481,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;130;-1835.177,2452.594;Inherit;False;1090.432;405.9395;;7;154;128;125;129;124;126;123;Smoothness;0,1,0.9505663,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;25;-8113.595,-607.3702;Inherit;False;931.0713;575.9611;;6;19;21;22;23;20;24;Diffuse & Alpha;0,1,0.2258735,1;0;0
Node;AmplifyShaderEditor.ColorNode;92;-3970.56,-854.1534;Inherit;False;Property;_HighlightBColor;Highlight B Color;34;0;Create;True;0;0;0;False;0;False;1,1,1,0;0.4889122,0.2297351,0.110702,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;179;-2070.533,-1054.464;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;48;-6042.212,-2247.363;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-2281.978,-52.0971;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-4041.058,-477.7805;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;102;-2793.854,-32.58878;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;95;-2600.514,1.1864;Inherit;False;Property;BOOLEAN_ENABLECOLOR;Enable Color;40;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_ENABLECOLOR_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;85;-4591.949,-331.5695;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;129;-1125.3,2691.267;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;113;-1282.692,68.1661;Inherit;False;Property;_VertexBaseColor;Vertex Base Color;4;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.7443256,0.5606278,0.3524737,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;70;-4435.162,-2180.724;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;135;-926.825,1506.557;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;184;-1698.834,-883.1651;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;-4663.326,-1744.405;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;103;-4983.848,158.4388;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;54;-5359.353,-1756.824;Inherit;False;Property;_HighlightAOverlapEnd;Highlight A Overlap End;31;0;Create;True;0;0;0;False;0;False;1;0.753;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;170;-1614.104,-21.06878;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;265;225.6211,-887.4773;Inherit;False;Property;_RImMultiplier;RIm Multiplier;44;0;Create;True;0;0;0;False;0;False;1;0.1;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;43;-6363.495,-2251.375;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.AbsOpNode;274;345.1624,-1341.815;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-6694.63,-1773.823;Inherit;False;Property;_BaseColorStrength;Base Color Strength;6;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;371;749.3403,424.1495;Inherit;False;Lambert Light;0;;73;9be9b95d80559e74dac059ac0a4060cf;0;2;42;COLOR;0,0,0,0;False;52;FLOAT3;0,0,0;False;2;COLOR;0;FLOAT;57
Node;AmplifyShaderEditor.WireNode;165;-976.356,3532.227;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;69;-4592.828,-2120.777;Inherit;False;Property;_HighlightAColor;Highlight A Color;29;0;Create;True;0;0;0;False;0;False;0.9137255,0.7803922,0.6352941,0;1,0.9537699,0.8679587,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;57;-5413.66,-1864.789;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;41;-7136.494,-2176.375;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;80;-3322.864,-867.3986;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;44;-6671.495,-2166.375;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;167;-2168.921,3376.054;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;171;-1725.854,-101.5312;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;61;-5031.216,-1572.194;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;108;-1850.69,31.40487;Inherit;False;Property;_AOOccludeAll;AO Occlude All;12;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;187;-2208.832,-883.1651;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;116;-1391.273,3160.2;Inherit;False;Property;_AOStrength;Ambient Occlusion Strength;11;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;-4310.933,-1888.297;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;42;-7357.494,-2191.375;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;56;-4936.353,-1999.824;Inherit;False;float lower = smoothstep(From.x, From.y, ID)@$float upper = 1.0 - smoothstep(From.y, From.z, ID)@$return Fac * lerp(lower, upper, step(From.y, ID))@;1;Create;3;True;From;FLOAT3;0,0,0;In;;Inherit;False;True;ID;FLOAT;0;In;;Inherit;False;True;Fac;FLOAT;0;In;;Inherit;False;Three Point Distribution;False;False;0;;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;376;-1299.38,-982.4818;Inherit;False;URP Tangent To World Normal;-1;;82;e73075222d6e6944aa84a1f1cd458852;0;1;14;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;250;-1483.284,-866.8931;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;2,2,2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;383;-5736.618,-1228.798;Inherit;False;idMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;67;-4137.933,-1887.297;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-7297.442,-2040.624;Inherit;False;Property;_InvertRootMap;Invert Root Map;24;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;166;-2774.67,2704.054;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;96;-2601.405,-89.1741;Inherit;False;Property;_DiffuseStrength;Diffuse Strength;3;0;Create;True;0;0;0;False;0;False;1;0.526;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;47;-6878.233,-1753.476;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-6970.495,-2363.375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;52;-5336.153,-2079.217;Inherit;False;Property;_HighlightADistribution;Highlight A Distribution;30;0;Create;True;0;0;0;False;0;False;0.1,0.2,0.3;0.2823,0.8031,0.9103001;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;183;-1621.712,-923.6942;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;388;11.23859,457.6893;Inherit;False;RL_Amplify_Function_HairLighting;-1;;95;1c2ce0d33e6d0364e94912a58b37cdd2;0;9;71;FLOAT;0.5;False;75;FLOAT;0;False;80;FLOAT;0;False;33;COLOR;1,1,1,0;False;42;COLOR;1,1,1,0;False;7;FLOAT;0;False;41;FLOAT;1;False;26;FLOAT3;0,0,1;False;3;FLOAT3;0,-1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;331;-512.6263,543.4392;Inherit;False;albedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;345;-340.0945,634.6074;Inherit;False;377;flowTangent;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-4736.071,-579.8825;Inherit;False;Property;_HighlightBStrength;Highlight B Strength;33;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;65;-4501.104,-1802.937;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;379;-502.0638,164.4751;Inherit;False;Property;_SpecularPower;Specular Power;47;0;Create;True;0;0;0;False;0;False;50;0;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;301;-761.064,592.0416;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;157;-4801.346,-664.5075;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;182;-1762.047,-995.8191;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;34;-7255.494,-2535.376;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;114;-1145.226,255.6993;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;81;-4804.949,-288.5695;Inherit;False;58;root;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;26;-7890.442,-2379.623;Inherit;True;Property;_RootMap;Root Map;20;0;Create;True;0;0;0;False;0;False;-1;None;2b9a5778cbf3e534f8790e88f06e76af;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;58;-7572.616,-2073.293;Inherit;False;root;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;177;-2585.102,-1002.118;Inherit;True;Property;_FlowMap;Flow Map;41;0;Create;True;0;0;0;False;0;False;-1;cc37af08370d26540b0e6725a8b8879e;f31dfb87d347aa64d8a826f975304ba2;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;84;-4737.085,-490.1994;Inherit;False;Property;_HighlightBOverlapEnd;Highlight B Overlap End;36;0;Create;True;0;0;0;False;0;False;1;0.258;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;181;-1914.633,-1129.564;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-7314.442,-2421.623;Inherit;False;Property;_RootColorStrength;Root Color Strength;22;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;380;-504.9082,244.4731;Inherit;False;Property;_SpecularMultiplier;Specular Multiplier;48;0;Create;True;0;0;0;False;0;False;1;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;185;-1699.834,-852.165;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;74;-3515.664,-620.6724;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;186;-2211.832,-855.165;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;63;-4843.216,-1615.194;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;60;-5221.217,-1600.194;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;31;-6643.443,-2346.113;Inherit;False;Property;_RootColor;Root Color;25;0;Create;True;0;0;0;False;0;False;0.3294118,0.1411765,0.05098039,0;0.3391081,0.2690152,0.0849447,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;68;-3945.133,-2134.022;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;45;-6359.132,-1948.475;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;137;-1480.992,2134.789;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;164;-1437.551,-156.0408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;76;-4225.948,-364.5695;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;251;-1337.785,-814.295;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;46;-6916.459,-1996.865;Inherit;False;Constant;_DefaultBaseColor;Default Base Color;11;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendOpsNode;111;-1274.69,-100.5951;Inherit;False;Multiply;True;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;112;-932.222,47.48609;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;178;-2220.832,-1098.165;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;39;-7236.494,-2127.375;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;87;-4713.885,-812.5936;Inherit;False;Property;_HighlightBDistribution;Highlight B Distribution;35;0;Create;True;0;0;0;False;0;False;0.1,0.2,0.3;0.7637001,0.9175001,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;119;-907.9623,3187.773;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;180;-2219.533,-1185.86;Inherit;False;Property;_FlowMapInvertG;Flow Map Invert G;42;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;59;-5441.216,-1553.194;Inherit;False;58;root;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;263;225.4727,-975.6733;Inherit;False;Property;_RImPower;RIm Power;43;0;Create;True;0;0;0;False;0;False;4;4;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;154;-1796.699,2652.253;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;77;-3878.837,-536.3135;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;152;-2028.195,2229.776;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-1777.459,2744.462;Inherit;False;Property;_SmoothnessPower;Smoothness Power;13;0;Create;True;0;0;0;False;0;False;1.25;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-2099.423,342.9396;Inherit;False;Property;_VertexColorStrength;Vertex Color Strength;5;0;Create;True;0;0;0;False;0;False;0.5;0.15;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-1682.579,1004.314;Inherit;False;Property;_NormalStrength;Normal Strength;17;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;98;-2617.306,-292.4619;Inherit;True;Property;_BlendMap;Blend Map;18;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;53;-5358.338,-1846.507;Inherit;False;Property;_HighlightAStrength;Highlight A Strength;28;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;128;-926.7459,2570.35;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-6614.495,-2493.375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;124;-1287.262,2502.594;Inherit;False;Property;_SmoothnessMin;Smoothness Min;14;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-6972.495,-2468.375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-4745.085,-188.2001;Inherit;False;Property;_HighlightBOverlapInvert;Highlight B Overlap Invert;37;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;126;-1478.013,2618.392;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;168;-2402.657,303.2917;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;83;-4408.948,-305.5696;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;50;-6150.171,-1259.694;Inherit;True;Property;_IDMap;ID Map;27;0;Create;True;0;0;0;False;0;False;-1;None;fd90b191f6d70424c88a473d176d575a;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;155;-2037.84,3182.767;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;175;242.925,1698.279;Inherit;False;half2 uv = ScreenPosition.xy * _ScreenParams.xy@$half DITHER_THRESHOLDS[16] =${$                1.0 / 17.0,  9.0 / 17.0,  3.0 / 17.0, 11.0 / 17.0,$                13.0 / 17.0,  5.0 / 17.0, 15.0 / 17.0,  7.0 / 17.0,$                4.0 / 17.0, 12.0 / 17.0,  2.0 / 17.0, 10.0 / 17.0,$                16.0 / 17.0,  8.0 / 17.0, 14.0 / 17.0,  6.0 / 17.0$}@$uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4@$return In - DITHER_THRESHOLDS[index]@;1;Create;2;True;In;FLOAT;0;In;;Inherit;False;True;ScreenPosition;FLOAT2;0,0;In;;Inherit;False;Unity Dither;True;False;0;;False;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-5442.353,-1454.824;Inherit;False;Property;_HighlightAOverlapInvert;Highlight A Overlap Invert;32;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;131;-1212.507,2109.158;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;104;-2283.423,231.9397;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;117;-1268.89,3248.74;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-1790.422,274.9395;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;115;-2586.726,2657.764;Inherit;True;Property;_MaskMap;Mask Map;10;0;Create;True;0;0;0;False;0;False;-1;None;444d0c817d0a7bc428463ac8655842b2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;378;-447.7943,-18.16256;Inherit;False;Property;_SpecularTint;Specular Tint;45;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;40;-6982.495,-2151.375;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;343;-644.1391,924.9638;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;99;-2597.587,116.9302;Inherit;False;Property;_BlendStrength;Blend Strength;19;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-6800.495,-2422.375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;133;-1336.324,1424.657;Inherit;True;Property;_EmissionMap;Emission Map;38;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;105;-2042.422,256.9396;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;261;-114.9813,-1108.665;Inherit;True;URP Tangent To World Normal;-1;;61;e73075222d6e6944aa84a1f1cd458852;0;1;14;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;385;-499.3954,324.9275;Inherit;False;Property;_SpecularShiftMin;Specular Shift Min;49;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;139;-1355.716,855.0568;Inherit;True;Property;_NormalMap;Normal Map;16;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendOpsNode;101;-2091.139,-78.27047;Inherit;False;Multiply;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-7310.442,-2271.623;Inherit;False;Property;_EndColorStrength;End Color Strength;23;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;71;-5415.104,-2185.42;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomExpressionNode;156;-4341.332,-706.8046;Inherit;False;float lower = smoothstep(From.x, From.y, ID)@$float upper = 1.0 - smoothstep(From.y, From.z, ID)@$return Fac * lerp(lower, upper, step(From.y, ID))@;1;Create;3;True;From;FLOAT3;0,0,0;In;;Inherit;False;True;ID;FLOAT;0;In;;Inherit;False;True;Fac;FLOAT;0;In;;Inherit;False;Three Point Distribution;False;False;0;;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;264;203.0825,-776.9807;Inherit;False;Property;_RimColor;Rim Color;46;0;Create;True;0;0;0;False;0;False;0.8,0.5686275,0.427451,0;0.8018868,0.5704757,0.4274208,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;169;-1928.502,43.00317;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;134;-1294.724,1624.857;Inherit;False;Property;_EmissiveColor;Emissive Color;39;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;86;-3688.665,-621.6724;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;269;850.6928,-932.4053;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;275;502.4377,-1324.225;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;267;529.6933,-1145.405;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-6949.443,-2594.624;Inherit;False;Property;_GlobalStrength;Global Strength;21;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;262;251.9588,-1198;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;284;-333.1471,-1082.216;Inherit;False;282;normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-1288.258,2587.188;Inherit;False;Property;_SmoothnessMax;Smoothness Max;15;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;120;-1400.725,3257.127;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;32;-6640.932,-2125.878;Inherit;False;Property;_EndColor;End Color;26;0;Create;True;0;0;0;False;0;False;0.6039216,0.454902,0.2862745,0;1,0.8160401,0.5494938,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;377;-1122.33,-808.976;Inherit;False;flowTangent;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;384;-82.44788,161.3735;Inherit;False;383;idMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;118;-1079.89,3179.238;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;163;-1517.469,56.52478;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;282;-985.7444,924.2095;Inherit;False;normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;266;686.6933,-1046.405;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;389;-513.5037,416.4901;Inherit;False;Property;_SpecularShiftMax;Specular Shift Max;50;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;299;601.0043,1008.494;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;296;601.0043,1008.494;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;297;601.0043,1008.494;Float;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;3;Reallusion/Amplify/RL_HairShader_Variants_URP1;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;2;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;22;Surface;0;0;  Blend;0;0;Two Sided;1;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;0;0;Built-in Fog;0;0;DOTS Instancing;0;0;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,-1;0;  Type;0;0;  Tess;16,False,-1;0;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Vertex Position,InvertActionOnDeselection;1;0;0;5;False;True;True;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;298;601.0043,1008.494;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;300;601.0043,1008.494;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;21;0;19;4
WireConnection;21;1;20;0
WireConnection;22;0;21;0
WireConnection;23;0;22;0
WireConnection;23;1;24;0
WireConnection;302;0;23;0
WireConnection;179;0;178;0
WireConnection;179;1;177;2
WireConnection;48;0;45;0
WireConnection;48;1;43;0
WireConnection;48;2;38;0
WireConnection;97;0;96;0
WireConnection;97;1;95;0
WireConnection;78;0;84;0
WireConnection;78;1;76;0
WireConnection;102;0;80;0
WireConnection;95;1;103;0
WireConnection;95;0;102;0
WireConnection;85;0;81;0
WireConnection;129;0;126;0
WireConnection;70;0;71;0
WireConnection;135;0;133;0
WireConnection;135;1;134;0
WireConnection;184;0;187;0
WireConnection;64;0;54;0
WireConnection;64;1;63;0
WireConnection;103;0;19;0
WireConnection;170;0;101;0
WireConnection;43;0;31;0
WireConnection;43;1;32;0
WireConnection;43;2;44;0
WireConnection;274;0;262;0
WireConnection;165;0;119;0
WireConnection;57;0;50;1
WireConnection;41;0;42;0
WireConnection;80;0;68;0
WireConnection;80;1;92;0
WireConnection;80;2;74;0
WireConnection;44;0;40;0
WireConnection;167;0;165;0
WireConnection;171;0;169;0
WireConnection;61;0;60;0
WireConnection;61;1;59;0
WireConnection;61;2;55;0
WireConnection;187;0;177;1
WireConnection;66;0;56;0
WireConnection;66;1;65;0
WireConnection;42;0;26;1
WireConnection;56;0;52;0
WireConnection;56;1;57;0
WireConnection;56;2;53;0
WireConnection;376;14;251;0
WireConnection;250;0;183;0
WireConnection;383;0;50;1
WireConnection;67;0;66;0
WireConnection;166;0;167;0
WireConnection;47;0;19;0
WireConnection;36;0;26;1
WireConnection;36;1;28;0
WireConnection;183;0;184;0
WireConnection;183;1;182;0
WireConnection;183;2;185;0
WireConnection;388;71;384;0
WireConnection;388;75;385;0
WireConnection;388;80;389;0
WireConnection;388;33;378;0
WireConnection;388;42;331;0
WireConnection;388;7;379;0
WireConnection;388;41;380;0
WireConnection;388;26;343;0
WireConnection;388;3;345;0
WireConnection;331;0;112;0
WireConnection;65;0;64;0
WireConnection;301;0;302;0
WireConnection;157;0;50;1
WireConnection;182;0;181;0
WireConnection;182;1;177;2
WireConnection;34;0;26;1
WireConnection;114;0;107;0
WireConnection;58;0;26;1
WireConnection;181;0;180;0
WireConnection;181;1;179;0
WireConnection;185;0;186;0
WireConnection;74;0;86;0
WireConnection;186;0;177;3
WireConnection;63;0;61;0
WireConnection;60;0;59;0
WireConnection;68;0;70;0
WireConnection;68;1;69;0
WireConnection;68;2;67;0
WireConnection;45;0;46;0
WireConnection;45;1;47;0
WireConnection;45;2;33;0
WireConnection;137;0;152;0
WireConnection;164;0;171;0
WireConnection;76;0;83;0
WireConnection;251;0;250;0
WireConnection;111;0;164;0
WireConnection;111;1;170;0
WireConnection;111;2;163;0
WireConnection;112;0;111;0
WireConnection;112;1;113;0
WireConnection;112;2;114;0
WireConnection;178;1;177;2
WireConnection;39;0;26;1
WireConnection;119;0;118;0
WireConnection;154;0;115;4
WireConnection;77;0;78;0
WireConnection;152;0;115;1
WireConnection;128;0;124;0
WireConnection;128;1;125;0
WireConnection;128;2;129;0
WireConnection;38;0;30;0
WireConnection;38;1;37;0
WireConnection;35;0;34;0
WireConnection;35;1;27;0
WireConnection;126;0;154;0
WireConnection;126;1;123;0
WireConnection;168;0;166;0
WireConnection;83;0;85;0
WireConnection;83;1;81;0
WireConnection;83;2;88;0
WireConnection;155;0;115;2
WireConnection;175;0;162;0
WireConnection;175;1;176;0
WireConnection;131;0;137;0
WireConnection;117;0;120;0
WireConnection;107;0;105;0
WireConnection;107;1;106;0
WireConnection;40;0;41;0
WireConnection;40;1;39;0
WireConnection;40;2;29;0
WireConnection;343;0;282;0
WireConnection;37;0;35;0
WireConnection;37;1;36;0
WireConnection;105;0;104;1
WireConnection;261;14;284;0
WireConnection;139;5;140;0
WireConnection;101;0;98;0
WireConnection;101;1;97;0
WireConnection;101;2;99;0
WireConnection;71;0;48;0
WireConnection;156;0;87;0
WireConnection;156;1;157;0
WireConnection;156;2;91;0
WireConnection;169;0;168;0
WireConnection;86;0;156;0
WireConnection;86;1;77;0
WireConnection;269;0;266;0
WireConnection;269;1;264;0
WireConnection;275;0;274;0
WireConnection;267;0;275;0
WireConnection;267;1;263;0
WireConnection;262;1;261;0
WireConnection;120;0;155;0
WireConnection;377;0;376;0
WireConnection;118;0;116;0
WireConnection;118;1;117;0
WireConnection;163;0;108;0
WireConnection;282;0;139;0
WireConnection;266;0;267;0
WireConnection;266;1;265;0
WireConnection;297;2;388;0
WireConnection;297;3;301;0
WireConnection;297;4;175;0
ASEEND*/
//CHKSM=D504E47105B403B7CC5CD73F1D85CC4463F8652E