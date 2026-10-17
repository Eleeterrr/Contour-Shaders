#ifndef OUTLINE_GLOW_GLSL
#define OUTLINE_GLOW_GLSL

#define OUTLINE_GLOW 0 // [0 1]
#define OUTLINE_GLOW_INTENSITY 2.0 // [0.5 1.0 1.5 2.0 2.5 3.0 4.0 5.0 6.0 8.0 10.0]
#define OUTLINE_GLOW_SMOOTHNESS 0.50 // [0.00 0.10 0.20 0.30 0.40 0.50 0.60 0.70 0.80 0.90 1.00]

void ApplyOutlineGlow(inout vec3 sceneColor, vec3 outlineColor, float totalWeight)
{
    #if OUTLINE_GLOW == 1
    float edge = clamp(totalWeight * 0.5, 0.0, 1.0);
    float factor = mix(clamp(totalWeight * 20.0, 0.0, 1.0), edge, OUTLINE_GLOW_SMOOTHNESS);
    sceneColor = mix(sceneColor, outlineColor * OUTLINE_GLOW_INTENSITY, factor);
    #else
    #if OUTLINE_RAINBOW == 1
    sceneColor = outlineColor;
    #else
    sceneColor = outlineColor * OUTLINE_DARKNESS;
    #endif
    #endif
}

#endif
