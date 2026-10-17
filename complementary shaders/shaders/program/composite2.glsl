/////////////////////////////////////
// Complementary Shaders by EminGT //
/////////////////////////////////////

//Common//
#include "/lib/common.glsl"

//////////Fragment Shader//////////Fragment Shader//////////Fragment Shader//////////
#ifdef FRAGMENT_SHADER

noperspective in vec2 texCoord;

//Pipeline Constants//

//Common Variables//
vec2 view = vec2(viewWidth, viewHeight);

//Includes//
#include "/contour/contourOutline.glsl"

//Program//
void main() {
    vec4 sceneColor = texelFetch(colortex0, texelCoord, 0);

    ApplyContourOutline(sceneColor);

    /* DRAWBUFFERS:0 */
    gl_FragData[0] = sceneColor;
}

#endif

//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////
#ifdef VERTEX_SHADER

noperspective out vec2 texCoord;

//Attributes//

//Common Variables//

//Common Functions//

//Includes//

//Program//
void main() {
    gl_Position = ftransform();
    texCoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
}

#endif
