#ifndef sk_c_api_version_DEFINED
#define sk_c_api_version_DEFINED

#define SK_C_API_VERSION 1

#include "sk_types.h"

SK_C_PLUS_PLUS_BEGIN_GUARD

SK_C_API int sk_get_binary_c_api_version();
SK_C_API static int sk_get_header_c_api_version() {
    return SK_C_API_VERSION;
}

SK_C_PLUS_PLUS_END_GUARD

#endif
