import CSkia

public class GLInterface {
  let handle: OpaquePointer

  init(handle: OpaquePointer) {
    self.handle = handle
  }

  public static func makeNative() -> GLInterface {
    GLInterface(handle: gr_glinterface_create_native_interface())
  }
}