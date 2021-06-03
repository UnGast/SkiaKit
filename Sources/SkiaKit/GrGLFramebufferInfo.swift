import CSkia

/**
Wrap the frame buffer object attached to the screen in a Skia render target so Skia can
render to it.
*/
public struct GrGLFramebufferInfo {
  public var fFBOID: UInt32
  public var fFormat: UInt32

  public init(fFBOID: UInt32, fFormat: UInt32 = 0) {
    self.fFBOID = fFBOID
    self.fFormat = fFormat
  }

  func toNative() -> gr_gl_framebufferinfo_t {
    gr_gl_framebufferinfo_t(fFBOID: fFBOID, fFormat: fFormat)
  }
}