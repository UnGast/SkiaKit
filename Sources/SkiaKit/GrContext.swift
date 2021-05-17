import CSkia

public final class GrContext {
  let handle: OpaquePointer

  private init(handle: OpaquePointer) {
    self.handle = handle
  }

  /// create a GrContext for the currently active OpenGL context
  public static func makeGL() -> GrContext {
    GrContext(handle: gr_context_make_gl(gr_glinterface_create_native_interface()))
  }
}