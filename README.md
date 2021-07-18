# SkiaKit

## Installation

SkiaKit is a wrapper library which maps Skia's C++ API to Swift via an intermediate C API.

SkiaKit does not contain the actual Skia code. Instead it is linked to a prebuilt binary. You have to obtain this binary and place it somewhere the linker can find it (usually a system directory like /usr/local/lib). 

### **1. Obtaining a Skia binary**

#### **Option 1: Prebuilt binary**

The easiest way to achieve this is to download a prebuilt binary for your platform which you can find at: [releases](https://github.com/UnGast/SkiaKit/releases).

If you found a prebuilt binary for your platform, continue with [step 2](#step2).

<br>

#### **Option 2: Compile it yourself**

I cannot provide a prebuilt version for every possible platform. So you might have to compile Skia yourself, which is not too hard.  
Read the tutorial on [skia.org](https://skia.org/docs/user/build/) and build this exact commit of a modified Skia version:

`https://github.com/UnGast/skia/tree/88c91a587e99dc313c461cbeb4ddfa6b996075c5`

I use the following build arguments, you might have to adjust them for your platform.

<br>

GN build args on Linux:

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
Place your binary called `libskia.a` in `/usr/local/lib`.

Now you should be able to use this package like a normal Swift package.

<br>

<br>

**originally forked from [migueldeicaza/SkiaKit](https://github.com/migueldeicaza/SkiaKit)**

This work uses extensive code from Microsoft's SkiaSharp bindings authoered by 
Matthew Leibowitz and dozens of contributors. SkiaSharp just happens to have
a very advanced set of bridge APIs to the underlying Skia engine that do not 
exist in the upstream Google Skia project.