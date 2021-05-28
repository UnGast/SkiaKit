import CSkia

public class GrBackendRenderTarget {
  let handle: OpaquePointer

  init(handle: OpaquePointer) {
    self.handle = handle
  }

  public init(width: Int, height: Int, samples: Int, stencils: Int, glInfo: GrGLFramebufferInfo) {
    self.init(handle: gr_backendrendertarget_new_gl(
      Int32(width), Int32(height), Int32(samples), Int32(stencils), glInfo.toNative()
    ))
  }
}