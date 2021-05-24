#include "include/gpu/GrBackendSurface.h"
#include "include/gpu/GrContext.h"
#include "include/gpu/gl/GrGLInterface.h"
#include "include/core/SkSurface.h"
#include "include/core/SkFontMgr.h"
#include "include/core/SkImage.h"
//#include "include/gpu/vk/GrVkBackendContext.h"
#include "include/core/SkColor.h"
#include "include/core/SkPaint.h"
#include "sk_types.h"
#include "sk_types_priv.h"
#include "src/gpu/gl/GrGLUtil.h"

extern "C" {
  sk_surface_t* makeSurface(int width, int height, int buffer) {
    auto interface = GrGLMakeNativeInterface();

    // setup contexts
    sk_sp<GrContext> grContext(GrContext::MakeGL(interface));
    SkASSERT(grContext);

    // Wrap the frame buffer object attached to the screen in a Skia render target so Skia can
    // render to it
    //GR_GL_GetIntegerv(interface.get(), 0x8CA6, &buffer);
    GrGLFramebufferInfo info;
    info.fFBOID = (GrGLuint) buffer;
    SkColorType colorType;

    //SkDebugf("%s", SDL_GetPixelFormatName(windowFormat));
    // TODO: the windowFormat is never any of these?
    //if (SDL_PIXELFORMAT_RGBA8888 == windowFormat) {
        info.fFormat = GR_GL_RGBA8;
        colorType = kRGBA_8888_SkColorType;
    /*} else {
        colorType = kBGRA_8888_SkColorType;
        if (SDL_GL_CONTEXT_PROFILE_ES == contextType) {
            info.fFormat = GR_GL_BGRA8;
        } else {
            // We assume the internal format is RGBA8 on desktop GL
            info.fFormat = GR_GL_RGBA8;
        }
    }*/

    GrBackendRenderTarget target(width, height, 0, 8, info);

    // setup SkSurface
    // To use distance field text, use commented out SkSurfaceProps instead
    // SkSurfaceProps props(SkSurfaceProps::kUseDeviceIndependentFonts_Flag,
    //                      SkSurfaceProps::kUnknown_SkPixelGeometry);
    SkSurfaceProps *props;

    sk_sp<SkSurface> surface(SkSurface::MakeFromBackendRenderTarget(grContext.get(), target,
                                                                    kBottomLeft_GrSurfaceOrigin,
                                                                      colorType, nullptr, props));

    surface->ref();

    return ToSurface(surface.get());
  }

  /*sk_surface_t* makeSurfaceVulkan(int width, int height, VkInstance vkInstance, VkPhysicalDevice vkPhysDevice) {
    sk_sp<GrVkBackendContext> vkBackendContext = new GrVkBackendContext();
    vkBackendContext->fInstance = vkInstance;
    vkBackendContext->fPhysicalDevice = vkPhysDevice;
    //vkBackendContext->fInterface.reset(GrVkCreateInterface(instance, vkPhysDevice, extensionFlags);
    sk_sp<GrContext> context = GrContext::MakeVulkan(vkBackendContext);
    return 0;
  }*/
}