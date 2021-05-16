/*
 * Copyright 2014 Google Inc.
 * Copyright 2015 Xamarin Inc.
 * Copyright 2017 Microsoft Corporation. All rights reserved.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef sk_paint_DEFINED
#define sk_paint_DEFINED

#include "sk_types.h"

SK_C_PLUS_PLUS_BEGIN_GUARD

SK_C_API sk_paint_t* sk_paint_new(void);
SK_C_API sk_paint_t* sk_paint_clone(sk_paint_t*);
SK_C_API void sk_paint_delete(sk_paint_t*);
SK_C_API void sk_paint_reset(sk_paint_t*);
SK_C_API bool sk_paint_is_antialias(const sk_paint_t*);
SK_C_API void sk_paint_set_antialias(sk_paint_t*, bool);
SK_C_API sk_color_t sk_paint_get_color(const sk_paint_t*);
SK_C_API void sk_paint_get_color4f(const sk_paint_t* paint, sk_color4f_t* color);
SK_C_API void sk_paint_set_color(sk_paint_t*, sk_color_t);
SK_C_API void sk_paint_set_color4f(sk_paint_t* paint, sk_color4f_t* color, sk_colorspace_t* colorspace);
SK_C_API sk_paint_style_t sk_paint_get_style(const sk_paint_t*);
SK_C_API void sk_paint_set_style(sk_paint_t*, sk_paint_style_t);
SK_C_API float sk_paint_get_stroke_width(const sk_paint_t*);
SK_C_API void sk_paint_set_stroke_width(sk_paint_t*, float width);
SK_C_API float sk_paint_get_stroke_miter(const sk_paint_t*);
SK_C_API void sk_paint_set_stroke_miter(sk_paint_t*, float miter);
SK_C_API sk_stroke_cap_t sk_paint_get_stroke_cap(const sk_paint_t*);
SK_C_API void sk_paint_set_stroke_cap(sk_paint_t*, sk_stroke_cap_t);
SK_C_API sk_stroke_join_t sk_paint_get_stroke_join(const sk_paint_t*);
SK_C_API void sk_paint_set_stroke_join(sk_paint_t*, sk_stroke_join_t);
SK_C_API void sk_paint_set_shader(sk_paint_t*, sk_shader_t*);
SK_C_API void sk_paint_set_maskfilter(sk_paint_t*, sk_maskfilter_t*);
SK_C_API void sk_paint_set_blendmode(sk_paint_t*, sk_blendmode_t);
SK_C_API bool sk_paint_is_dither(const sk_paint_t*);
SK_C_API void sk_paint_set_dither(sk_paint_t*, bool);
SK_C_API sk_shader_t* sk_paint_get_shader(sk_paint_t*);
SK_C_API sk_maskfilter_t* sk_paint_get_maskfilter(sk_paint_t*);
SK_C_API void sk_paint_set_colorfilter(sk_paint_t*, sk_colorfilter_t*);
SK_C_API sk_colorfilter_t* sk_paint_get_colorfilter(sk_paint_t*);
SK_C_API void sk_paint_set_imagefilter(sk_paint_t*, sk_imagefilter_t*);
SK_C_API sk_imagefilter_t* sk_paint_get_imagefilter(sk_paint_t*);
SK_C_API sk_blendmode_t sk_paint_get_blendmode(sk_paint_t*);
SK_C_API void sk_paint_set_filter_quality(sk_paint_t*, sk_filter_quality_t);
SK_C_API sk_filter_quality_t sk_paint_get_filter_quality(sk_paint_t *);
SK_C_API sk_path_effect_t* sk_paint_get_path_effect(sk_paint_t* cpaint);
SK_C_API void sk_paint_set_path_effect(sk_paint_t* cpaint, sk_path_effect_t* effect);  
SK_C_API bool sk_paint_get_fill_path(const sk_paint_t*, const sk_path_t* src, sk_path_t* dst, const sk_rect_t* cullRect, float resScale);

SK_C_PLUS_PLUS_END_GUARD

#endif
