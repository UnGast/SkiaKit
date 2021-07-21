# SkiaKit

**originally forked from [migueldeicaza/SkiaKit](https://github.com/migueldeicaza/SkiaKit)**

<br>

## Installation

SkiaKit is a wrapper library which maps Skia's C++ API to Swift via an intermediate C API.

SkiaKit does not contain the actual Skia code. Instead it is linked to a prebuilt binary. You have to obtain this binary and place it somewhere the linker can find it (usually a system directory like /usr/lib).  
This is hopefully only a temporary requirement. When the Swift Package Manager supports shipping binaries with packages on all all platforms, manually installing Skia will not be necessary.

<br>

### **1. Obtaining a Skia binary**

#### **Option 1: Using the download script**

The easiest way to obtain a binary is by using the automatic download and installation script at [tools/install_skia.sh](https://github.com/UnGast/SkiaKit/blob/main/tools/install_skia.sh).

Execute these lines in your terminal to run the script with correct parameters:

```bash
SKIAKIT_VERSION=<insert the exact version of SkiaKit package, e.g. 0.0.1>
SKIAKIT_PLATFORM=<insert your platform, allowed values: linux, macos>
curl -L https://raw.githubusercontent.com/UnGast/SkiaKit/main/tools/install_skia.sh --output install_skia.sh && chmod +x install_skia.sh && sudo ./install_skia.sh $SKIAKIT_PLATFORM $SKIAKIT_VERSION
rm install_skia.sh
```

<br>

#### **Option 2: Manually downloading a prebuilt binary**

You might find a binary for your platform at: [releases](https://github.com/UnGast/SkiaKit/releases) (look in assets section).

If you found a prebuilt binary for your platform, continue with [step 2](#step2).

<br>

#### **Option 3: Compile it yourself**

I cannot provide a prebuilt version for every possible platform. So you might have to compile Skia yourself, which is not too hard.  
Read the tutorial on [skia.org](https://skia.org/docs/user/build/) and build this exact commit of a modified Skia version:

`https://github.com/UnGast/skia/tree/d22bd8f1c52c3181e63561f88dfbe4cb4d891d66`

I use the following build arguments, you might have to adjust them for your platform.

<br>

GN build args on Ubuntu:

```
is_official_build = true
target_os = "linux"
target_cpu = "x64"
skia_use_piex = false
skia_enable_tools = false
skia_use_harfbuzz=false
skia_use_system_expat = false
skia_use_system_freetype2 = true
skia_use_system_libjpeg_turbo = false
skia_use_system_libpng = false
skia_use_system_libwebp = false
skia_use_vulkan = true

extra_cflags = [ "-DHAVE_GETRANDOM" ]
```

<br>

GN build args on MacOS:

```
is_debug=false
is_official_build=true
skia_use_system_expat=false
skia_use_system_icu=false
skia_use_system_libjpeg_turbo=false 
skia_use_system_libpng=false
skia_use_system_libwebp=false
skia_use_system_zlib=false
skia_use_sfntly=false
skia_use_freetype=true
skia_use_harfbuzz=false
skia_pdf_subset_harfbuzz=false
skia_use_system_freetype2=false
skia_use_system_harfbuzz=false
target_cpu="x64"
extra_cflags=["-DHAVE_GETRANDOM", "-DHAVE_XLOCALE_H"]
extra_cflags_cc=["-frtti"]
```

<br>

<a name="step2"></a>
### **2. Making the binary visible to the linker**
Ensure that your binary is named `libskia_skiakit.a`, if it is not, simply rename it.
Then place your binary in `/usr/lib`. This will require root priviliges.

Now you should be able to use this package like a normal Swift package.

<br>

<br>

**originally forked from [migueldeicaza/SkiaKit](https://github.com/migueldeicaza/SkiaKit)**

This work uses extensive code from Microsoft's SkiaSharp bindings authoered by 
Matthew Leibowitz and dozens of contributors. SkiaSharp just happens to have
a very advanced set of bridge APIs to the underlying Skia engine that do not 
exist in the upstream Google Skia project.
