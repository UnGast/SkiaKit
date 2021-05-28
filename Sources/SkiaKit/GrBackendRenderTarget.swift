import CSkia

public class GrBackendRenderTarget {
  let handle: OpaquePointer

  init(handle: OpaquePointer) {
    self.handle = handle
  }

  public convenience init(width: Int, height: Int, samples: Int, stencils: Int, glInfo: GrGLFramebufferInfo) {
    var glInfoNative = glInfo.toNative()
    self.init(handle: gr_backendrendertarget_new_gl(
      Int32(width), Int32(height), Int32(samples), Int32(stencils), &glInfoNative
    ))
  }
}