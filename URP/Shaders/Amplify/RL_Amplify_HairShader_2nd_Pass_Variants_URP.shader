// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Reallusion/Amplify/RL_HairShader_2nd_Pass_Variants_URP"
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
		_EmissionMap("Emission Map", 2D) = "white" {}
		_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[Toggle(BOOLEAN_ENABLECOLOR_ON)] BOOLEAN_ENABLECOLOR("Enable Color", Float) = 0
		_FlowMap("Flow Map", 2D) = "gray" {}
		[Toggle]_FlowMapFlipGreen("Flow Map Flip Green", Float) = 0
		_RimPower("Rim Power", Range( 1 , 10)) = 4
		_RimTransmission("Rim Transmission", Range( 0 , 20)) = 10
		_SpecularColor("Specular Color", Color) = (1,1,1,0)
		_SpecularPower("Specular Power", Range( 0 , 100)) = 50
		_SpecularMultiplier("Specular Multiplier", Range( 0 , 2)) = 1
		_SpecularTint("Specular Tint", Range( 0.5 , 1)) = 1
		_SpecularShiftMin("Specular Shift Min", Range( -1 , 1)) = -0.25
		_SpecularShiftMax("Specular Shift Max", Range( -1 , 1)) = 0.25
		[ASEEnd]_Tranlucency("Tranlucency", Range( 0 , 1)) = 0
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

		
		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" }
		
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
			
			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest Less
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM
			
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#define ASE_FOG 1
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
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma shader_feature_local BOOLEAN_ENABLECOLOR_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				half4 ase_tangent : TANGENT;
				half4 ase_color : COLOR;
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 lightmapUVOrVertexSH : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _FlowMap_ST;
			half4 _EmissiveColor;
			half4 _NormalMap_ST;
			half4 _EmissionMap_ST;
			half4 _MaskMap_ST;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightBColor;
			half4 _SpecularColor;
			half4 _BlendMap_ST;
			half4 _HighlightAColor;
			half4 _DiffuseMap_ST;
			half4 _RootMap_ST;
			half4 _RootColor;
			half4 _EndColor;
			half3 _HighlightBDistribution;
			half3 _HighlightADistribution;
			half _InvertRootMap;
			half _FlowMapFlipGreen;
			half _NormalStrength;
			half _AOOccludeAll;
			half _SpecularShiftMin;
			half _AOStrength;
			half _RimTransmission;
			half _RimPower;
			half _Tranlucency;
			half _SpecularTint;
			half _VertexColorStrength;
			half _SpecularShiftMax;
			half _BlendStrength;
			half _HighlightBOverlapInvert;
			half _HighlightBOverlapEnd;
			half _HighlightBStrength;
			half _SpecularPower;
			half _SpecularMultiplier;
			half _HighlightAOverlapInvert;
			half _HighlightAOverlapEnd;
			half _HighlightAStrength;
			half _AlphaRemap;
			half _DiffuseStrength;
			half _EndColorStrength;
			half _RootColorStrength;
			half _GlobalStrength;
			half _BaseColorStrength;
			half _AlphaPower;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _FlowMap;
			sampler2D _NormalMap;
			sampler2D _IDMap;
			sampler2D _BlendMap;
			sampler2D _DiffuseMap;
			sampler2D _RootMap;
			sampler2D _MaskMap;
			sampler2D _EmissionMap;


			half3 TangentToWorld13_g790( half3 NormalTS, half3x3 TBN )
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
			
			half3 RL_Amplify_Expression_HairLighting_Additional126_g786( half3 Color, half3 TangentWorld, half3 ViewDir, half3 NormalWorld, half3 SpecularColor, half SpecularTint, half SpecularPower, half SpecularMultiplier, half3 PositionWorld, half Translucency, half RimTransmission, half RimPower )
			{
				half3 addColor = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
					Light light = GetAdditionalLight(i, PositionWorld);	
				                half3 L = light.direction;	
					// Transmission & Diffuse contribution
					half lambert = dot(L, NormalWorld);
					half wrappedLambert = saturate(lambert * (1 - Translucency) + Translucency);
					half rim = saturate(1.0 - abs(dot(NormalWorld, ViewDir)));
					half LV = saturate(-dot(L, ViewDir));
					half transmission = pow(rim * LV, RimPower) * RimTransmission * wrappedLambert;
					half3 diffuse = (wrappedLambert + transmission) * Color;
					// Specular contribution
					half3 H = normalize(ViewDir + L);
					half dotTH = dot(TangentWorld, H);
					half sinTH = saturate(1.0 - dotTH * dotTH);
				                half dirAtten = smoothstep(-1, 0, dotTH) * pow(sinTH, SpecularPower);	
					// Because additional lights usually don't cast shadows, 
					// the shadow attenuation doesn't mask specular for back faces correctly.
					// So use the lambert value to mask out specular for back faces.
					half3 specular = (dirAtten * SpecularMultiplier * wrappedLambert) * SpecularColor;
					specular = lerp(specular, specular * Color, SpecularTint);	
					half3 AttLightColor = light.color * (light.distanceAttenuation * light.shadowAttenuation);	
					addColor += (diffuse + specular) * AttLightColor;
				}
				#endif
				return addColor;
			}
			
			float3 ASEIndirectDiffuse( float2 uvStaticLightmap, float3 normalWS )
			{
			#ifdef LIGHTMAP_ON
				return SampleLightmap( uvStaticLightmap, normalWS );
			#else
				return SampleSH(normalWS);
			#endif
			}
			
			
			VertexOutput VertexFunction ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				half3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				half3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				half ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( ase_worldNormal, o.lightmapUVOrVertexSH.xyz );
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
				
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
				half4 ase_tangent : TANGENT;
				half4 ase_color : COLOR;
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
				o.ase_tangent = v.ase_tangent;
				o.ase_color = v.ase_color;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
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
				float ase_lightAtten = 0;
				Light ase_mainLight = GetMainLight( ShadowCoords );
				ase_lightAtten = ase_mainLight.distanceAttenuation * ase_mainLight.shadowAttenuation;
				float2 uv_FlowMap = IN.ase_texcoord3.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
				half4 break109_g786 = tex2D( _FlowMap, uv_FlowMap );
				half lerpResult123_g786 = lerp( break109_g786.g , ( 1.0 - break109_g786.g ) , _FlowMapFlipGreen);
				half3 appendResult98_g786 = (half3(break109_g786.r , lerpResult123_g786 , break109_g786.b));
				half3 NormalTS13_g790 = ( ( appendResult98_g786 * float3( 2,2,2 ) ) - float3( 1,1,1 ) );
				half3 ase_worldTangent = IN.ase_texcoord4.xyz;
				half3 ase_worldNormal = IN.ase_texcoord5.xyz;
				half3 Binormal5_g790 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( ase_worldNormal , ase_worldTangent ) );
				half3x3 TBN1_g790 = float3x3(ase_worldTangent, Binormal5_g790, ase_worldNormal);
				half3x3 TBN13_g790 = TBN1_g790;
				half3 localTangentToWorld13_g790 = TangentToWorld13_g790( NormalTS13_g790 , TBN13_g790 );
				half3 flowTangent107_g786 = localTangentToWorld13_g790;
				float2 uv_NormalMap = IN.ase_texcoord3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
				half3 unpack139 = UnpackNormalScale( tex2D( _NormalMap, uv_NormalMap ), _NormalStrength );
				unpack139.z = lerp( 1, unpack139.z, saturate(_NormalStrength) );
				half3 normal282 = unpack139;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				half3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				half3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				half3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal85_g786 = normal282;
				half3 worldNormal85_g786 = float3(dot(tanToWorld0,tanNormal85_g786), dot(tanToWorld1,tanNormal85_g786), dot(tanToWorld2,tanNormal85_g786));
				half3 worldNormal86_g786 = worldNormal85_g786;
				float2 uv_IDMap = IN.ase_texcoord3.xy * _IDMap_ST.xy + _IDMap_ST.zw;
				half idMap383 = tex2D( _IDMap, uv_IDMap ).r;
				half lerpResult81_g786 = lerp( _SpecularShiftMin , _SpecularShiftMax , idMap383);
				half3 normalizeResult10_g787 = normalize( ( flowTangent107_g786 + ( worldNormal86_g786 * lerpResult81_g786 ) ) );
				half3 shiftedTangent119_g786 = normalizeResult10_g787;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				half3 viewDIr52_g788 = ase_worldViewDir;
				half3 lightDir55_g788 = _MainLightPosition.xyz;
				half3 normalizeResult14_g789 = normalize( ( viewDIr52_g788 + lightDir55_g788 ) );
				half dotResult16_g789 = dot( shiftedTangent119_g786 , normalizeResult14_g789 );
				half smoothstepResult22_g789 = smoothstep( -1.0 , 0.0 , dotResult16_g789);
				half temp_output_7_0_g786 = _SpecularPower;
				half temp_output_132_0_g786 = _SpecularMultiplier;
				half4 temp_output_131_0_g786 = _SpecularColor;
				half4 temp_output_13_0_g788 = ( ( smoothstepResult22_g789 * pow( saturate( ( 1.0 - ( dotResult16_g789 * dotResult16_g789 ) ) ) , temp_output_7_0_g786 ) ) * temp_output_132_0_g786 * temp_output_131_0_g786 );
				float2 uv_BlendMap = IN.ase_texcoord3.xy * _BlendMap_ST.xy + _BlendMap_ST.zw;
				float2 uv_DiffuseMap = IN.ase_texcoord3.xy * _DiffuseMap_ST.xy + _DiffuseMap_ST.zw;
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half4 diffuseMap517 = tex2DNode19;
				half4 color10_g701 = IsGammaSpace() ? half4(1,1,1,0) : half4(1,1,1,0);
				half4 lerpResult18_g701 = lerp( color10_g701 , diffuseMap517 , _BaseColorStrength);
				float2 uv_RootMap = IN.ase_texcoord3.xy * _RootMap_ST.xy + _RootMap_ST.zw;
				half root58 = tex2D( _RootMap, uv_RootMap ).r;
				half temp_output_27_0_g701 = root58;
				half lerpResult23_g701 = lerp( temp_output_27_0_g701 , ( 1.0 - temp_output_27_0_g701 ) , _InvertRootMap);
				half4 lerpResult3_g701 = lerp( _RootColor , _EndColor , lerpResult23_g701);
				half4 lerpResult6_g701 = lerp( lerpResult18_g701 , lerpResult3_g701 , ( _GlobalStrength * ( ( ( 1.0 - temp_output_27_0_g701 ) * _RootColorStrength ) + ( temp_output_27_0_g701 * _EndColorStrength ) ) ));
				half3 From8_g703 = _HighlightADistribution;
				half ID8_g703 = idMap383;
				half Fac8_g703 = _HighlightAStrength;
				half localThreePointDistribution8_g703 = ThreePointDistribution( From8_g703 , ID8_g703 , Fac8_g703 );
				half temp_output_24_0_g703 = root58;
				half lerpResult16_g703 = lerp( ( 1.0 - temp_output_24_0_g703 ) , temp_output_24_0_g703 , _HighlightAOverlapInvert);
				half4 lerpResult18_g703 = lerp( lerpResult6_g701 , _HighlightAColor , saturate( ( localThreePointDistribution8_g703 * ( 1.0 - ( _HighlightAOverlapEnd * ( 1.0 - lerpResult16_g703 ) ) ) ) ));
				half3 From8_g704 = _HighlightBDistribution;
				half ID8_g704 = idMap383;
				half Fac8_g704 = _HighlightBStrength;
				half localThreePointDistribution8_g704 = ThreePointDistribution( From8_g704 , ID8_g704 , Fac8_g704 );
				half temp_output_24_0_g704 = root58;
				half lerpResult16_g704 = lerp( ( 1.0 - temp_output_24_0_g704 ) , temp_output_24_0_g704 , _HighlightBOverlapInvert);
				half4 lerpResult18_g704 = lerp( lerpResult18_g703 , _HighlightBColor , saturate( ( localThreePointDistribution8_g704 * ( 1.0 - ( _HighlightBOverlapEnd * ( 1.0 - lerpResult16_g704 ) ) ) ) ));
				#ifdef BOOLEAN_ENABLECOLOR_ON
				half4 staticSwitch95 = lerpResult18_g704;
				#else
				half4 staticSwitch95 = diffuseMap517;
				#endif
				half4 blendOpSrc101 = tex2D( _BlendMap, uv_BlendMap );
				half4 blendOpDest101 = ( _DiffuseStrength * staticSwitch95 );
				half4 lerpBlendMode101 = lerp(blendOpDest101,( blendOpSrc101 * blendOpDest101 ),_BlendStrength);
				half4 lerpResult112 = lerp( ( saturate( lerpBlendMode101 )) , _VertexBaseColor , ( ( 1.0 - IN.ase_color.r ) * _VertexColorStrength ));
				half4 baseColor331 = lerpResult112;
				half4 temp_output_42_0_g786 = baseColor331;
				half4 temp_output_32_0_g788 = temp_output_42_0_g786;
				half temp_output_172_0_g786 = _SpecularTint;
				half4 lerpResult36_g788 = lerp( temp_output_13_0_g788 , ( temp_output_13_0_g788 * temp_output_32_0_g788 ) , temp_output_172_0_g786);
				half3 temp_output_24_0_g788 = worldNormal86_g786;
				half dotResult15_g788 = dot( lightDir55_g788 , temp_output_24_0_g788 );
				half temp_output_200_0_g786 = _Tranlucency;
				half temp_output_40_0_g788 = temp_output_200_0_g786;
				half dotResult54_g788 = dot( temp_output_24_0_g788 , viewDIr52_g788 );
				half dotResult57_g788 = dot( viewDIr52_g788 , lightDir55_g788 );
				half temp_output_208_0_g786 = _RimPower;
				half temp_output_207_0_g786 = _RimTransmission;
				half3 Color126_g786 = temp_output_42_0_g786.rgb;
				half3 TangentWorld126_g786 = shiftedTangent119_g786;
				half3 ViewDir126_g786 = ase_worldViewDir;
				half3 NormalWorld126_g786 = worldNormal86_g786;
				half3 SpecularColor126_g786 = temp_output_131_0_g786.rgb;
				half SpecularTint126_g786 = temp_output_172_0_g786;
				half SpecularPower126_g786 = temp_output_7_0_g786;
				half SpecularMultiplier126_g786 = temp_output_132_0_g786;
				half3 worldPosition129_g786 = WorldPosition;
				half3 PositionWorld126_g786 = worldPosition129_g786;
				half Translucency126_g786 = temp_output_200_0_g786;
				half RimTransmission126_g786 = temp_output_207_0_g786;
				half RimPower126_g786 = temp_output_208_0_g786;
				half3 localRL_Amplify_Expression_HairLighting_Additional126_g786 = RL_Amplify_Expression_HairLighting_Additional126_g786( Color126_g786 , TangentWorld126_g786 , ViewDir126_g786 , NormalWorld126_g786 , SpecularColor126_g786 , SpecularTint126_g786 , SpecularPower126_g786 , SpecularMultiplier126_g786 , PositionWorld126_g786 , Translucency126_g786 , RimTransmission126_g786 , RimPower126_g786 );
				float3 tanNormal53_g786 = worldNormal86_g786;
				half3 bakedGI53_g786 = ASEIndirectDiffuse( IN.lightmapUVOrVertexSH.xy, float3(dot(tanToWorld0,tanNormal53_g786), dot(tanToWorld1,tanNormal53_g786), dot(tanToWorld2,tanNormal53_g786)));
				MixRealtimeAndBakedGI(ase_mainLight, float3(dot(tanToWorld0,tanNormal53_g786), dot(tanToWorld1,tanNormal53_g786), dot(tanToWorld2,tanNormal53_g786)), bakedGI53_g786, half4(0,0,0,0));
				float2 uv_MaskMap = IN.ase_texcoord3.xy * _MaskMap_ST.xy + _MaskMap_ST.zw;
				half4 tex2DNode115 = tex2D( _MaskMap, uv_MaskMap );
				half ambientOcclusion570 = ( 1.0 - ( _AOStrength * ( 1.0 - tex2DNode115.g ) ) );
				half temp_output_161_0_g786 = ambientOcclusion570;
				half temp_output_178_0_g786 = _AOOccludeAll;
				half lerpResult180_g786 = lerp( temp_output_161_0_g786 , 1.0 , temp_output_178_0_g786);
				half lerpResult183_g786 = lerp( 1.0 , temp_output_161_0_g786 , temp_output_178_0_g786);
				float2 uv_EmissionMap = IN.ase_texcoord3.xy * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
				
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				half alpha518 = pow( saferPower23 , _AlphaPower );
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = ( ( ( ( ( ase_lightAtten * ( ( lerpResult36_g788 + ( ( saturate( ( ( dotResult15_g788 * ( 1.0 - temp_output_40_0_g788 ) ) + temp_output_40_0_g788 ) ) + ( pow( ( max( ( 1.0 - abs( dotResult54_g788 ) ) , 0.0 ) * max( ( 0.0 - dotResult57_g788 ) , 0.0 ) ) , temp_output_208_0_g786 ) * temp_output_207_0_g786 ) ) * temp_output_32_0_g788 ) ) * _MainLightColor ) ) + half4( localRL_Amplify_Expression_HairLighting_Additional126_g786 , 0.0 ) ) + ( half4( bakedGI53_g786 , 0.0 ) * temp_output_42_0_g786 * lerpResult180_g786 ) ) * lerpResult183_g786 ) + ( tex2D( _EmissionMap, uv_EmissionMap ) * _EmissiveColor ) ).rgb;
				float Alpha = alpha518;
				float AlphaClipThreshold = 0.05;
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
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 100500

			
			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS


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
			half4 _FlowMap_ST;
			half4 _EmissiveColor;
			half4 _NormalMap_ST;
			half4 _EmissionMap_ST;
			half4 _MaskMap_ST;
			half4 _VertexBaseColor;
			half4 _IDMap_ST;
			half4 _HighlightBColor;
			half4 _SpecularColor;
			half4 _BlendMap_ST;
			half4 _HighlightAColor;
			half4 _DiffuseMap_ST;
			half4 _RootMap_ST;
			half4 _RootColor;
			half4 _EndColor;
			half3 _HighlightBDistribution;
			half3 _HighlightADistribution;
			half _InvertRootMap;
			half _FlowMapFlipGreen;
			half _NormalStrength;
			half _AOOccludeAll;
			half _SpecularShiftMin;
			half _AOStrength;
			half _RimTransmission;
			half _RimPower;
			half _Tranlucency;
			half _SpecularTint;
			half _VertexColorStrength;
			half _SpecularShiftMax;
			half _BlendStrength;
			half _HighlightBOverlapInvert;
			half _HighlightBOverlapEnd;
			half _HighlightBStrength;
			half _SpecularPower;
			half _SpecularMultiplier;
			half _HighlightAOverlapInvert;
			half _HighlightAOverlapEnd;
			half _HighlightAStrength;
			half _AlphaRemap;
			half _DiffuseStrength;
			half _EndColorStrength;
			half _RootColorStrength;
			half _GlobalStrength;
			half _BaseColorStrength;
			half _AlphaPower;
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
				half4 tex2DNode19 = tex2D( _DiffuseMap, uv_DiffuseMap );
				half saferPower23 = abs( saturate( ( tex2DNode19.a / _AlphaRemap ) ) );
				half alpha518 = pow( saferPower23 , _AlphaPower );
				
				float Alpha = alpha518;
				float AlphaClipThreshold = 0.05;

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
1913;7;1920;1011;1322.801;-308.4961;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;25;-5721.536,873.5989;Inherit;False;1176.518;561.6434;;8;518;517;23;22;24;21;20;19;Diffuse & Alpha;0.5235849,1,0.631946,1;0;0
Node;AmplifyShaderEditor.SamplerNode;19;-5671.535,923.5991;Inherit;True;Property;_DiffuseMap;Diffuse Map;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;20;-5663.463,1220.562;Inherit;False;Property;_AlphaRemap;Alpha Remap;6;0;Create;True;0;0;0;False;0;False;0.5;0.5;0.5;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;21;-5318.46,1133.561;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-5293.459,1333.562;Inherit;False;Property;_AlphaPower;Alpha Power;5;0;Create;True;0;0;0;False;0;False;1;1;0.01;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;22;-5163.459,1170.561;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;23;-4967.458,1242.563;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;518;-4746.722,1239.47;Inherit;False;alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;533;-1263.113,2698.074;Inherit;False;341.2995;196.2863;;1;521;Alpha;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;141;-1860.923,590.5557;Inherit;False;952.864;322.2571;;3;282;139;140;Normals;0.5235849,0.5572144,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;516;-5730.066,-1036.8;Inherit;False;2272.674;1645.196;;28;91;88;92;87;84;508;69;53;52;54;55;503;519;504;27;31;32;33;29;30;28;59;510;509;502;524;523;522;Hair Color Blending;0.5330188,1,0.6022252,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;512;-5718.366,1661.348;Inherit;False;696.6748;494.7862;;4;26;58;383;50;Maps;0.504717,0.9903985,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;130;-2017.728,1684.574;Inherit;False;1090.432;405.9395;;7;154;128;125;129;124;126;123;Smoothness;0.514151,1,0.9752312,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;136;-1553.433,1059.366;Inherit;False;621.4995;462.2001;Comment;3;133;134;135;Emission;1,0.514151,0.9428412,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;573;-759.7318,-401.0714;Inherit;False;1096.671;1516.562;;16;569;571;108;572;539;263;379;384;482;385;265;378;177;380;389;180;Specular Highlights;1,0.7932334,0.514151,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;521;-1106.107,2770.981;Inherit;False;518;alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;525;-3245.436,-222.8687;Inherit;False;622.7622;286.4321;Enable Color;2;95;520;Keyword;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;122;-1909.03,2266.963;Inherit;False;990.7638;251.5405;;6;570;116;117;119;120;118;Ambient Occlusion;0.504717,1,0.9766926,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;121;-2526.007,-395.2434;Inherit;False;1611.361;818.9382;;12;331;96;104;97;101;105;106;107;113;98;112;99;Final Color Blending;0.514151,1,0.6056049,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;116;-1849.578,2316.963;Inherit;False;Property;_AOStrength;Ambient Occlusion Strength;8;0;Create;False;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;119;-1366.267,2344.536;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;104;-2146.046,182.9718;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;133;-1503.434,1109.366;Inherit;True;Property;_EmissionMap;Emission Map;35;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;50;-5668.366,1711.348;Inherit;True;Property;_IDMap;ID Map;24;0;Create;True;0;0;0;False;0;False;19;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;87;-4315.965,276.4831;Inherit;False;Property;_HighlightBDistribution;Highlight B Distribution;32;0;Create;True;0;0;0;False;0;False;0.1,0.2,0.3;0.2487,0.5152001,0.6487001;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;96;-2471.786,-166.6682;Inherit;False;Property;_DiffuseStrength;Diffuse Strength;1;0;Create;True;0;0;0;False;0;False;1;0.8;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;108;-694.5977,-200.0366;Inherit;False;Property;_AOOccludeAll;AO Occlude All;9;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-5014.418,58.35992;Inherit;False;Property;_HighlightAOverlapInvert;Highlight A Overlap Invert;29;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;101;-1658.146,-124.4951;Inherit;False;Multiply;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;99;-2001.331,16.97653;Inherit;False;Property;_BlendStrength;Blend Strength;16;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;98;-2016.306,-277.3997;Inherit;True;Property;_BlendMap;Blend Map;15;0;Create;True;0;0;0;False;0;False;19;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;520;-3195.436,-172.8687;Inherit;False;517;diffuseMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;115;-2549.129,1937.093;Inherit;True;Property;_MaskMap;Mask Map;7;0;Create;True;0;0;0;False;0;False;19;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;123;-1960.01,1976.442;Inherit;False;Property;_SmoothnessPower;Smoothness Power;10;0;Create;True;0;0;0;False;0;False;1.25;1;0.5;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;571;-637.0811,-277.3754;Inherit;False;570;ambientOcclusion;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-4359.578,513.0045;Inherit;False;Property;_HighlightBOverlapInvert;Highlight B Overlap Invert;34;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-5674.055,-876.1475;Inherit;False;Property;_BaseColorStrength;Base Color Strength;4;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;510;-3968.615,-191.6566;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;572;-594.7292,-351.0714;Inherit;False;331;baseColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-5668.135,-688.8041;Inherit;False;Property;_GlobalStrength;Global Strength;18;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;379;-692.7015,122.987;Inherit;False;Property;_SpecularPower;Specular Power;43;0;Create;True;0;0;0;False;0;False;50;50;0;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;595;-110.9783,9.531306;Inherit;False;RL_Amplify_Function_Hair_AnisotropicLighting;-1;;786;1c2ce0d33e6d0364e94912a58b37cdd2;1,88,0;17;42;COLOR;1,1,1,0;False;161;FLOAT;1;False;178;FLOAT;1;False;84;FLOAT3;0,0,1;False;26;FLOAT3;0,0,1;False;131;COLOR;1,1,1,0;False;7;FLOAT;50;False;172;FLOAT;0;False;132;FLOAT;1;False;108;COLOR;0,0,0,0;False;112;FLOAT;0;False;71;FLOAT;0.5;False;75;FLOAT;-0.1;False;80;FLOAT;0.1;False;200;FLOAT;0;False;207;FLOAT;0;False;208;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;84;-4359.336,431.3161;Inherit;False;Property;_HighlightBOverlapEnd;Highlight B Overlap End;33;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-2160.596,-101.7776;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-4364.522,197.3449;Inherit;False;Property;_HighlightBStrength;Highlight B Strength;30;0;Create;True;0;0;0;False;0;False;1;0.725;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;69;-4960.777,-437.1049;Inherit;False;Property;_HighlightAColor;Highlight A Color;26;0;Create;True;0;0;0;False;0;False;0.9137255,0.7803922,0.6352941,0;0.749388,0.5341862,0.3652521,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;112;-1334.348,4.108437;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;92;-4296.681,19.90401;Inherit;False;Property;_HighlightBColor;Highlight B Color;31;0;Create;True;0;0;0;False;0;False;1,1,1,0;0.7048331,0.4975328,0.3391081,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;504;-5567.181,-781.3913;Inherit;False;58;root;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-5669.347,-147.4745;Inherit;False;Property;_EndColorStrength;End Color Strength;20;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;59;-4915.522,-589.2163;Inherit;False;58;root;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;385;-684.8522,695.3685;Inherit;False;Property;_SpecularShiftMin;Specular Shift Min;46;0;Create;True;0;0;0;False;0;False;-0.25;-0.35;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;502;-4641.802,-723.1288;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;54;-5017.305,-22.45101;Inherit;False;Property;_HighlightAOverlapEnd;Highlight A Overlap End;28;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;503;-4915.507,-514.9556;Inherit;False;383;idMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;570;-1144.033,2340.833;Inherit;False;ambientOcclusion;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;105;-1881.327,189.0002;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;135;-1093.935,1191.266;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;539;-680.1417,846.9451;Inherit;False;Property;_Tranlucency;Tranlucency;48;0;Create;True;0;0;0;False;0;False;0;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;58;-5245.691,1959.615;Inherit;False;root;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;519;-5581.311,-960.5982;Inherit;False;517;diffuseMap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;120;-1859.03,2413.89;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;129;-1307.851,1923.247;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;389;-682.5292,770.9006;Inherit;False;Property;_SpecularShiftMax;Specular Shift Max;47;0;Create;True;0;0;0;False;0;False;0.25;-0.15;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;265;-678.3436,922.4185;Inherit;False;Property;_RimTransmission;Rim Transmission;41;0;Create;True;0;0;0;False;0;False;10;10;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;522;-4431.044,-426.122;Inherit;False;RL_Amplify_Function_Hair_IDBlend;-1;;703;6afb608343a58854589726462adfdb8b;0;8;26;COLOR;1,1,1,0;False;24;FLOAT;0.5;False;27;FLOAT;0.5;False;25;COLOR;0.9137256,0.7803922,0.6352941,0;False;21;FLOAT;1;False;20;FLOAT3;0.1,0.2,0.3;False;22;FLOAT;1;False;23;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;282;-1114.089,709.7084;Inherit;False;normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;139;-1484.06,640.5557;Inherit;True;Property;_NormalMap;Normal Map;13;0;Create;True;0;0;0;False;0;False;19;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;134;-1461.834,1309.566;Inherit;False;Property;_EmissiveColor;Emissive Color;36;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;569;-590.8998,-125.8811;Inherit;False;282;normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;378;-628.2301,-49.07933;Inherit;False;Property;_SpecularColor;Specular Color;42;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;27;-5671.595,-237.5661;Inherit;False;Property;_RootColorStrength;Root Color Strength;19;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;32;-5612.805,-421.4388;Inherit;False;Property;_EndColor;End Color;23;0;Create;True;0;0;0;False;0;False;0.6039216,0.454902,0.2862745,0;0.4475037,0.2778465,0.1318038,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;95;-2929.674,-76.43671;Inherit;False;Property;BOOLEAN_ENABLECOLOR;Enable Color;37;0;Create;False;0;0;0;False;0;False;0;0;0;True;BOOLEAN_ENABLECOLOR_ON;Toggle;2;Key0;Key1;Create;True;False;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;331;-1127.497,-1.164222;Inherit;False;baseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;509;-4259.245,-135.2632;Inherit;False;58;root;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-1625.77,230.7146;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;180;-628.3543,542.955;Inherit;False;Property;_FlowMapFlipGreen;Flow Map Flip Green;39;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;177;-709.7319,353.5402;Inherit;True;Property;_FlowMap;Flow Map;38;0;Create;True;0;0;0;False;0;False;19;cc37af08370d26540b0e6725a8b8879e;cc37af08370d26540b0e6725a8b8879e;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;380;-689.9268,276.3215;Inherit;False;Property;_SpecularMultiplier;Specular Multiplier;44;0;Create;True;0;0;0;False;0;False;1;0.3486;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;517;-5312.597,999.702;Inherit;False;diffuseMap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;523;-5087.463,-880.7275;Inherit;False;RL_Amplify_Function_Hair_RootBlend;-1;;701;3304ef6ee2139bd4cab5d899498bc3dd;0;9;26;COLOR;0,0,0,0;False;37;FLOAT;1;False;27;FLOAT;0;False;31;FLOAT;1;False;35;COLOR;0.3294118,0.1411765,0.05098039,0;False;36;COLOR;0.6039216,0.454902,0.2862745,0;False;32;FLOAT;1;False;33;FLOAT;1;False;34;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;536;114.6943,2294.918;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;31;-5612.955,-600.91;Inherit;False;Property;_RootColor;Root Color;22;0;Create;True;0;0;0;False;0;False;0.3294118,0.1411765,0.05098039,0;0.2690152,0.1318038,0.04984008,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;29;-5666.166,-64.65891;Inherit;False;Property;_InvertRootMap;Invert Root Map;21;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;52;-4972.563,-178.1671;Inherit;False;Property;_HighlightADistribution;Highlight A Distribution;27;0;Create;True;0;0;0;False;0;False;0.1,0.2,0.3;0.6026,0.8363001,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;154;-1979.25,1884.233;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;117;-1727.195,2405.503;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;578;488.4657,1290.249;Inherit;False;Constant;_TransparencyAlphaClip0;Transparency Alpha Clip 0;49;0;Create;True;0;0;0;False;0;False;0.05;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;26;-5664.931,1926.134;Inherit;True;Property;_RootMap;Root Map;17;0;Create;True;0;0;0;False;0;False;19;None;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;482;-691.7015,199.9869;Inherit;False;Property;_SpecularTint;Specular Tint;45;0;Create;True;0;0;0;False;0;False;1;0.75;0.5;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;53;-5017.905,-259.2123;Inherit;False;Property;_HighlightAStrength;Highlight A Strength;25;0;Create;True;0;0;0;False;0;False;1;0.738;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;384;-583.0779,618.9556;Inherit;False;383;idMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;113;-1661.103,22.41703;Inherit;False;Property;_VertexBaseColor;Vertex Base Color;2;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.1808585,0.0849447,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;155;-2048.458,2317.48;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-1470.809,1819.168;Inherit;False;Property;_SmoothnessMax;Smoothness Max;12;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;524;-3805.556,-56.1289;Inherit;False;RL_Amplify_Function_Hair_IDBlend;-1;;704;6afb608343a58854589726462adfdb8b;0;8;26;COLOR;1,1,1,0;False;24;FLOAT;0.5;False;27;FLOAT;0.5;False;25;COLOR;0.9137256,0.7803922,0.6352941,0;False;21;FLOAT;1;False;20;FLOAT3;0.1,0.2,0.3;False;22;FLOAT;1;False;23;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-1810.923,789.8129;Inherit;False;Property;_NormalStrength;Normal Strength;14;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;124;-1469.813,1734.574;Inherit;False;Property;_SmoothnessMin;Smoothness Min;11;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;508;-4260.21,-59.08698;Inherit;False;383;idMap;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;128;-1109.297,1802.33;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;126;-1660.564,1850.372;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;118;-1538.195,2336.002;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;383;-5246.238,1787.672;Inherit;False;idMap;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;574;688.0759,1168.212;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-1944.258,290.4149;Inherit;False;Property;_VertexColorStrength;Vertex Color Strength;3;0;Create;True;0;0;0;False;0;False;0.5;0.878;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;263;-676.0562,997.1207;Inherit;False;Property;_RimPower;Rim Power;40;0;Create;True;0;0;0;False;0;False;4;2;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;297;917.0538,1167.637;Half;False;True;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;3;Reallusion/Amplify/RL_HairShader_2nd_Pass_Variants_URP;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;5;False;-1;10;False;-1;1;1;False;-1;10;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;2;False;-1;True;1;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;22;Surface;1;637787991825921621;  Blend;0;0;Two Sided;0;637788651120112867;Cast Shadows;0;637788651025808361;  Use Shadow Threshold;0;637787998365867513;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;0;0;Built-in Fog;1;637788650928858011;DOTS Instancing;0;0;Meta Pass;0;637788651284779850;Extra Pre Pass;0;637788651331004462;Tessellation;0;637788079018214460;  Phong;1;637788078609197688;  Strength;0.5,False,-1;0;  Type;0;0;  Tess;16,False,-1;0;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Vertex Position,InvertActionOnDeselection;1;0;0;5;False;True;False;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;296;601.0043,1008.494;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;3;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;300;601.0043,1008.494;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;3;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;299;601.0043,1008.494;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;3;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;298;601.0043,1008.494;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;3;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;17;d3d9;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;nomrt;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;21;0;19;4
WireConnection;21;1;20;0
WireConnection;22;0;21;0
WireConnection;23;0;22;0
WireConnection;23;1;24;0
WireConnection;518;0;23;0
WireConnection;119;0;118;0
WireConnection;101;0;98;0
WireConnection;101;1;97;0
WireConnection;101;2;99;0
WireConnection;510;0;522;0
WireConnection;595;42;572;0
WireConnection;595;161;571;0
WireConnection;595;178;108;0
WireConnection;595;84;569;0
WireConnection;595;131;378;0
WireConnection;595;7;379;0
WireConnection;595;172;482;0
WireConnection;595;132;380;0
WireConnection;595;108;177;0
WireConnection;595;112;180;0
WireConnection;595;71;384;0
WireConnection;595;75;385;0
WireConnection;595;80;389;0
WireConnection;595;200;539;0
WireConnection;595;207;265;0
WireConnection;595;208;263;0
WireConnection;97;0;96;0
WireConnection;97;1;95;0
WireConnection;112;0;101;0
WireConnection;112;1;113;0
WireConnection;112;2;107;0
WireConnection;502;0;523;0
WireConnection;570;0;119;0
WireConnection;105;0;104;1
WireConnection;135;0;133;0
WireConnection;135;1;134;0
WireConnection;58;0;26;1
WireConnection;120;0;155;0
WireConnection;129;0;126;0
WireConnection;522;26;502;0
WireConnection;522;24;59;0
WireConnection;522;27;503;0
WireConnection;522;25;69;0
WireConnection;522;21;53;0
WireConnection;522;20;52;0
WireConnection;522;22;54;0
WireConnection;522;23;55;0
WireConnection;282;0;139;0
WireConnection;139;5;140;0
WireConnection;95;1;520;0
WireConnection;95;0;524;0
WireConnection;331;0;112;0
WireConnection;107;0;105;0
WireConnection;107;1;106;0
WireConnection;517;0;19;0
WireConnection;523;26;519;0
WireConnection;523;37;33;0
WireConnection;523;27;504;0
WireConnection;523;31;30;0
WireConnection;523;35;31;0
WireConnection;523;36;32;0
WireConnection;523;32;27;0
WireConnection;523;33;28;0
WireConnection;523;34;29;0
WireConnection;536;0;521;0
WireConnection;154;0;115;4
WireConnection;117;0;120;0
WireConnection;155;0;115;2
WireConnection;524;26;510;0
WireConnection;524;24;509;0
WireConnection;524;27;508;0
WireConnection;524;25;92;0
WireConnection;524;21;91;0
WireConnection;524;20;87;0
WireConnection;524;22;84;0
WireConnection;524;23;88;0
WireConnection;128;0;124;0
WireConnection;128;1;125;0
WireConnection;128;2;129;0
WireConnection;126;0;154;0
WireConnection;126;1;123;0
WireConnection;118;0;116;0
WireConnection;118;1;117;0
WireConnection;383;0;50;1
WireConnection;574;0;595;0
WireConnection;574;1;135;0
WireConnection;297;2;574;0
WireConnection;297;3;536;0
WireConnection;297;4;578;0
ASEEND*/
//CHKSM=2E798412C5C7D8C4C94305F099E60BC8175BCAE8