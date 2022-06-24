SamplerState s_Source : register(s0);
SamplerState s_Source1 : register(s1);
Texture2D t_Source : register(t0);
Texture2D t_Source1 : register(t1);

cbuffer Globals : register(b0)
{
   float4 textureSize;
   float4 viewSize;
   float4 filterParam;
};

float4 main(float4 svPos : SV_POSITION, float2 tc : TEXCOORD) : SV_TARGET
{
	uint2 tCoord = floor(tc * textureSize.xy);
	float4 source = t_Source.Load(uint3(tCoord, 0));
	float4 source1 = t_Source1.Load(uint3(tCoord, 0));
	return float4(lerp(source.rgb, source1.rgb, source1.a), 1.0f);
}