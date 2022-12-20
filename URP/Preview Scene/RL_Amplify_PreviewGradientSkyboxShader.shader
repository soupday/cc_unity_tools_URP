// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Reallusion/Skybox/Preview Gradient Skybox"
{
	Properties
	{
		_TopCurve("Top Curve", Range( 0 , 2)) = 1
		_TopRange("Top Range", Range( 0 , 1)) = 0.5
		_TopColor("Top Color", Color) = (1,0,0,0)
		_MidColor("Mid Color", Color) = (0,1,0,0)
		_BottomColor("Bottom Color", Color) = (0,0,1,0)
		_BottomRange("Bottom Range", Range( 0 , 1)) = 0.5
		_BottomCurve("Bottom Curve", Range( 0 , 2)) = 1
		_Intensity("Intensity", Range( 0 , 5)) = 1

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			

			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half4 _MidColor;
			uniform half4 _TopColor;
			uniform half _TopCurve;
			uniform half _TopRange;
			uniform half4 _BottomColor;
			uniform half _BottomCurve;
			uniform half _BottomRange;
			uniform half _Intensity;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				half2 texCoord6 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				half temp_output_1_0_g3 = 0.0;
				half4 lerpResult7 = lerp( _MidColor , _TopColor , saturate( ( ( pow( saturate( texCoord6.y ) , _TopCurve ) - temp_output_1_0_g3 ) / ( _TopRange - temp_output_1_0_g3 ) ) ));
				half temp_output_1_0_g4 = 0.0;
				half4 lerpResult13 = lerp( _MidColor , _BottomColor , saturate( ( ( pow( saturate( -texCoord6.y ) , _BottomCurve ) - temp_output_1_0_g4 ) / ( _BottomRange - temp_output_1_0_g4 ) ) ));
				half4 lerpResult15 = lerp( lerpResult7 , lerpResult13 , step( texCoord6.y , 0.0 ));
				
				
				finalColor = ( lerpResult15 * _Intensity );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18935
7;54;1920;975;1523.953;-60.14267;1;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-2138.439,261.2903;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NegateNode;11;-1836.624,500.1349;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1780.752,261.6984;Inherit;False;Property;_TopCurve;Top Curve;0;0;Create;True;0;0;0;False;0;False;1;1;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-1830.454,596.8992;Inherit;False;Property;_BottomCurve;Bottom Curve;6;0;Create;True;0;0;0;False;0;False;1;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;22;-1696.553,500.5985;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;27;-1720.045,132.9981;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-1613.632,724.5234;Inherit;False;Property;_BottomRange;Bottom Range;5;0;Create;True;0;0;0;False;0;False;0.5;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-1574.833,35.6892;Inherit;False;Property;_TopRange;Top Range;1;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;17;-1516.852,507.1991;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;18;-1463.752,217.6984;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;30;-1233.573,552.2074;Inherit;False;Inverse Lerp;-1;;4;09cbe79402f023141a4dc1fddd4c9511;0;3;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;29;-1245.573,166.2074;Inherit;False;Inverse Lerp;-1;;3;09cbe79402f023141a4dc1fddd4c9511;0;3;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;23;-976.2092,326.4027;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;14;-1104.047,789.0972;Inherit;False;Property;_BottomColor;Bottom Color;4;0;Create;True;0;0;0;False;0;False;0,0,1,0;0.5,0.5,0.5,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;8;-1116.388,-31.48786;Inherit;False;Property;_TopColor;Top Color;2;0;Create;True;0;0;0;False;0;False;1,0,0,0;0.75,0.75,0.75,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;32;-997.6384,559.0791;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;5;-1074.124,362.5698;Inherit;False;Property;_MidColor;Mid Color;3;0;Create;True;0;0;0;False;0;False;0,1,0,0;0.3499999,0.3499999,0.3499999,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;31;-1048.638,194.0791;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;7;-725.192,146.9334;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StepOpNode;16;-702.6553,330.2404;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;13;-703.4764,467.376;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;15;-426.4998,277.5899;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-406.7883,492.7814;Inherit;False;Property;_Intensity;Intensity;7;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;-124.5876,323.1689;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;42;121.0044,324.5281;Float;False;True;-1;2;ASEMaterialInspector;100;1;Reallusion/Skybox/Preview Gradient Skybox;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;11;0;6;2
WireConnection;22;0;11;0
WireConnection;27;0;6;2
WireConnection;17;0;22;0
WireConnection;17;1;19;0
WireConnection;18;0;27;0
WireConnection;18;1;20;0
WireConnection;30;2;25;0
WireConnection;30;3;17;0
WireConnection;29;2;24;0
WireConnection;29;3;18;0
WireConnection;23;0;6;2
WireConnection;32;0;30;0
WireConnection;31;0;29;0
WireConnection;7;0;5;0
WireConnection;7;1;8;0
WireConnection;7;2;31;0
WireConnection;16;0;23;0
WireConnection;13;0;5;0
WireConnection;13;1;14;0
WireConnection;13;2;32;0
WireConnection;15;0;7;0
WireConnection;15;1;13;0
WireConnection;15;2;16;0
WireConnection;33;0;15;0
WireConnection;33;1;34;0
WireConnection;42;0;33;0
ASEEND*/
//CHKSM=C931B347868CDE459CE9E819F290CE6EA166F556