import CSkia

public final class SkiaCApiVersion {
    public static func getBinaryVersion() -> Int32 {
        return sk_get_binary_c_api_version()
    }

    public static func getHeaderVersion() -> Int32 {
        return sk_get_header_c_api_version()
    }

    public static func validateFail() {
        let binary = getBinaryVersion()
        let header = getHeaderVersion()

        if binary != header {
            fatalError("linked Skia binary version does not match the version expected by the current version of the SkiaKit package, binary version: \(binary), expected: \(header)")
        }
    }
}
