; RUN: llc < %s -verify-machineinstrs -mtriple=aarch64-none-linux-gnu -mattr=+neon | FileCheck %s


define <8 x i8> @and8xi8(<8 x i8> %a, <8 x i8> %b) {
;CHECK: and {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = and <8 x i8> %a, %b;
	ret <8 x i8> %tmp1
}

define <16 x i8> @and16xi8(<16 x i8> %a, <16 x i8> %b) {
;CHECK: and {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = and <16 x i8> %a, %b;
	ret <16 x i8> %tmp1
}


define <8 x i8> @orr8xi8(<8 x i8> %a, <8 x i8> %b) {
;CHECK: orr {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = or <8 x i8> %a, %b;
	ret <8 x i8> %tmp1
}

define <16 x i8> @orr16xi8(<16 x i8> %a, <16 x i8> %b) {
;CHECK: orr {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = or <16 x i8> %a, %b;
	ret <16 x i8> %tmp1
}


define <8 x i8> @xor8xi8(<8 x i8> %a, <8 x i8> %b) {
;CHECK: eor {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = xor <8 x i8> %a, %b;
	ret <8 x i8> %tmp1
}

define <16 x i8> @xor16xi8(<16 x i8> %a, <16 x i8> %b) {
;CHECK: eor {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = xor <16 x i8> %a, %b;
	ret <16 x i8> %tmp1
}

define <8 x i8> @bsl8xi8_const(<8 x i8> %a, <8 x i8> %b)  {
;CHECK:  bsl {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = and <8 x i8> %a, < i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1 >
	%tmp2 = and <8 x i8> %b, < i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0 >
	%tmp3 = or <8 x i8> %tmp1, %tmp2
	ret <8 x i8> %tmp3
}

define <16 x i8> @bsl16xi8_const(<16 x i8> %a, <16 x i8> %b) {
;CHECK:  bsl {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = and <16 x i8> %a, < i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1 >
	%tmp2 = and <16 x i8> %b, < i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0 >
	%tmp3 = or <16 x i8> %tmp1, %tmp2
	ret <16 x i8> %tmp3
}

define <8 x i8> @orn8xi8(<8 x i8> %a, <8 x i8> %b)  {
;CHECK:  orn {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %tmp1 = xor <8 x i8> %b, < i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1 >
  %tmp2 = or <8 x i8> %a, %tmp1
  ret <8 x i8> %tmp2
}

define <16 x i8> @orn16xi8(<16 x i8> %a, <16 x i8> %b) {
;CHECK:  orn {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %tmp1 = xor <16 x i8> %b, < i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1 >
  %tmp2 = or <16 x i8> %a, %tmp1
  ret <16 x i8> %tmp2
}

define <8 x i8> @bic8xi8(<8 x i8> %a, <8 x i8> %b)  {
;CHECK:  bic {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %tmp1 = xor <8 x i8> %b, < i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1 >
  %tmp2 = and <8 x i8> %a, %tmp1
  ret <8 x i8> %tmp2
}

define <16 x i8> @bic16xi8(<16 x i8> %a, <16 x i8> %b) {
;CHECK:  bic {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %tmp1 = xor <16 x i8> %b, < i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1 >
  %tmp2 = and <16 x i8> %a, %tmp1
  ret <16 x i8> %tmp2
}

define <2 x i32> @orrimm2s_lsl0(<2 x i32> %a) {
;CHECK:  orr {{v[0-9]+}}.2s, #0xff
	%tmp1 = or <2 x i32> %a, < i32 255, i32 255>
	ret <2 x i32> %tmp1
}

define <2 x i32> @orrimm2s_lsl8(<2 x i32> %a) {
;CHECK:  orr {{v[0-9]+}}.2s, #0xff, lsl #8
	%tmp1 = or <2 x i32> %a, < i32 65280, i32 65280>
	ret <2 x i32> %tmp1
}

define <2 x i32> @orrimm2s_lsl16(<2 x i32> %a) {
;CHECK:  orr {{v[0-9]+}}.2s, #0xff, lsl #16
	%tmp1 = or <2 x i32> %a, < i32 16711680, i32 16711680>
	ret <2 x i32> %tmp1
}

define <2 x i32> @orrimm2s_lsl24(<2 x i32> %a) {
;CHECK:  orr {{v[0-9]+}}.2s, #0xff, lsl #24
	%tmp1 = or <2 x i32> %a, < i32 4278190080, i32 4278190080>
	ret <2 x i32> %tmp1
}

define <4 x i32> @orrimm4s_lsl0(<4 x i32> %a) {
;CHECK:  orr {{v[0-9]+}}.4s, #0xff
	%tmp1 = or <4 x i32> %a, < i32 255, i32 255, i32 255, i32 255>
	ret <4 x i32> %tmp1
}

define <4 x i32> @orrimm4s_lsl8(<4 x i32> %a) {
;CHECK:  orr {{v[0-9]+}}.4s, #0xff, lsl #8
	%tmp1 = or <4 x i32> %a, < i32 65280, i32 65280, i32 65280, i32 65280>
	ret <4 x i32> %tmp1
}

define <4 x i32> @orrimm4s_lsl16(<4 x i32> %a) {
;CHECK:  orr {{v[0-9]+}}.4s, #0xff, lsl #16
	%tmp1 = or <4 x i32> %a, < i32 16711680, i32 16711680, i32 16711680, i32 16711680>
	ret <4 x i32> %tmp1
}

define <4 x i32> @orrimm4s_lsl24(<4 x i32> %a) {
;CHECK:  orr {{v[0-9]+}}.4s, #0xff, lsl #24
	%tmp1 = or <4 x i32> %a, < i32 4278190080, i32 4278190080, i32 4278190080, i32 4278190080>
	ret <4 x i32> %tmp1
}

define <4 x i16> @orrimm4h_lsl0(<4 x i16> %a) {
;CHECK:  orr {{v[0-9]+}}.4h, #0xff
	%tmp1 = or <4 x i16> %a, < i16 255, i16 255, i16 255, i16 255 >
	ret <4 x i16> %tmp1
}

define <4 x i16> @orrimm4h_lsl8(<4 x i16> %a) {
;CHECK:  orr {{v[0-9]+}}.4h, #0xff, lsl #8
	%tmp1 = or <4 x i16> %a, < i16 65280, i16 65280, i16 65280, i16 65280 >
	ret <4 x i16> %tmp1
}

define <8 x i16> @orrimm8h_lsl0(<8 x i16> %a) {
;CHECK:  orr {{v[0-9]+}}.8h, #0xff
	%tmp1 = or <8 x i16> %a, < i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255 >
	ret <8 x i16> %tmp1
}

define <8 x i16> @orrimm8h_lsl8(<8 x i16> %a) {
;CHECK:  orr {{v[0-9]+}}.8h, #0xff, lsl #8
	%tmp1 = or <8 x i16> %a, < i16 65280, i16 65280, i16 65280, i16 65280, i16 65280, i16 65280, i16 65280, i16 65280 >
	ret <8 x i16> %tmp1
}

define <2 x i32> @bicimm2s_lsl0(<2 x i32> %a) {
;CHECK:  bic {{v[0-9]+}}.2s, #0x10
	%tmp1 = and <2 x i32> %a, < i32 4294967279, i32 4294967279 >
	ret <2 x i32> %tmp1
}

define <2 x i32> @bicimm2s_lsl8(<2 x i32> %a) {
;CHECK:  bic {{v[0-9]+}}.2s, #0x10, lsl #8
	%tmp1 = and <2 x i32> %a, < i32 18446744073709547519, i32  18446744073709547519 >
	ret <2 x i32> %tmp1
}

define <2 x i32> @bicimm2s_lsl16(<2 x i32> %a) {
;CHECK:  bic {{v[0-9]+}}.2s, #0x10, lsl #16
	%tmp1 = and <2 x i32> %a, < i32 18446744073708503039, i32 18446744073708503039 >
	ret <2 x i32> %tmp1
}

define <2 x i32> @bicimm2s_lsl124(<2 x i32> %a) {
;CHECK:  bic {{v[0-9]+}}.2s, #0x10, lsl #24
	%tmp1 = and <2 x i32> %a, < i32 18446744073441116159, i32  18446744073441116159>
	ret <2 x i32> %tmp1
}

define <4 x i32> @bicimm4s_lsl0(<4 x i32> %a) {
;CHECK:  bic {{v[0-9]+}}.4s, #0x10
	%tmp1 = and <4 x i32> %a, < i32 4294967279, i32 4294967279, i32 4294967279, i32 4294967279 >
	ret <4 x i32> %tmp1
}

define <4 x i32> @bicimm4s_lsl8(<4 x i32> %a) {
;CHECK:  bic {{v[0-9]+}}.4s, #0x10, lsl #8
	%tmp1 = and <4 x i32> %a, < i32 18446744073709547519, i32  18446744073709547519, i32  18446744073709547519, i32  18446744073709547519 >
	ret <4 x i32> %tmp1
}

define <4 x i32> @bicimm4s_lsl16(<4 x i32> %a) {
;CHECK:  bic {{v[0-9]+}}.4s, #0x10, lsl #16
	%tmp1 = and <4 x i32> %a, < i32 18446744073708503039, i32 18446744073708503039, i32 18446744073708503039, i32 18446744073708503039 >
	ret <4 x i32> %tmp1
}

define <4 x i32> @bicimm4s_lsl124(<4 x i32> %a) {
;CHECK:  bic {{v[0-9]+}}.4s, #0x10, lsl #24
	%tmp1 = and <4 x i32> %a, < i32 18446744073441116159, i32  18446744073441116159, i32  18446744073441116159, i32  18446744073441116159>
	ret <4 x i32> %tmp1
}

define <4 x i16> @bicimm4h_lsl0_a(<4 x i16> %a) {
;CHECK:  bic {{v[0-9]+}}.4h, #0x10
	%tmp1 = and <4 x i16> %a, < i16 18446744073709551599, i16  18446744073709551599, i16  18446744073709551599, i16  18446744073709551599 >
	ret <4 x i16> %tmp1
}

define <4 x i16> @bicimm4h_lsl0_b(<4 x i16> %a) {
;CHECK:  bic {{v[0-9]+}}.4h, #0x0
	%tmp1 = and <4 x i16> %a, < i16 65280, i16  65280, i16  65280, i16 65280 >
	ret <4 x i16> %tmp1
}

define <4 x i16> @bicimm4h_lsl8_a(<4 x i16> %a) {
;CHECK:  bic {{v[0-9]+}}.4h, #0x10, lsl #8
	%tmp1 = and <4 x i16> %a, < i16 18446744073709547519, i16  18446744073709547519, i16  18446744073709547519, i16  18446744073709547519>
	ret <4 x i16> %tmp1
}

define <4 x i16> @bicimm4h_lsl8_b(<4 x i16> %a) {
;CHECK:  bic {{v[0-9]+}}.4h, #0x0, lsl #8
	%tmp1 = and <4 x i16> %a, < i16 255, i16 255, i16 255, i16 255>
	ret <4 x i16> %tmp1
}

define <8 x i16> @bicimm8h_lsl0_a(<8 x i16> %a) {
;CHECK:  bic {{v[0-9]+}}.8h, #0x10
	%tmp1 = and <8 x i16> %a, < i16 18446744073709551599, i16  18446744073709551599, i16  18446744073709551599, i16  18446744073709551599,
   i16  18446744073709551599, i16  18446744073709551599, i16  18446744073709551599, i16  18446744073709551599 >
	ret <8 x i16> %tmp1
}

define <8 x i16> @bicimm8h_lsl0_b(<8 x i16> %a) {
;CHECK:  bic {{v[0-9]+}}.8h, #0x0
	%tmp1 = and <8 x i16> %a, < i16 65280, i16  65280, i16  65280, i16 65280, i16 65280, i16  65280, i16  65280, i16 65280 >
	ret <8 x i16> %tmp1
}

define <8 x i16> @bicimm8h_lsl8_a(<8 x i16> %a) {
;CHECK:  bic {{v[0-9]+}}.8h, #0x10, lsl #8
	%tmp1 = and <8 x i16> %a, < i16 18446744073709547519, i16  18446744073709547519, i16  18446744073709547519, i16  18446744073709547519,
   i16  18446744073709547519, i16  18446744073709547519, i16  18446744073709547519, i16  18446744073709547519>
	ret <8 x i16> %tmp1
}

define <8 x i16> @bicimm8h_lsl8_b(<8 x i16> %a) {
;CHECK:  bic {{v[0-9]+}}.8h, #0x0, lsl #8
	%tmp1 = and <8 x i16> %a, < i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255, i16 255>
	ret <8 x i16> %tmp1
}

define <2 x i32> @and2xi32(<2 x i32> %a, <2 x i32> %b) {
;CHECK: and {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = and <2 x i32> %a, %b;
	ret <2 x i32> %tmp1
}

define <4 x i16> @and4xi16(<4 x i16> %a, <4 x i16> %b) {
;CHECK: and {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = and <4 x i16> %a, %b;
	ret <4 x i16> %tmp1
}

define <1 x i64> @and1xi64(<1 x i64> %a, <1 x i64> %b) {
;CHECK: and {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = and <1 x i64> %a, %b;
	ret <1 x i64> %tmp1
}

define <4 x i32> @and4xi32(<4 x i32> %a, <4 x i32> %b) {
;CHECK: and {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = and <4 x i32> %a, %b;
	ret <4 x i32> %tmp1
}

define <8 x i16> @and8xi16(<8 x i16> %a, <8 x i16> %b) {
;CHECK: and {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = and <8 x i16> %a, %b;
	ret <8 x i16> %tmp1
}

define <2 x i64> @and2xi64(<2 x i64> %a, <2 x i64> %b) {
;CHECK: and {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = and <2 x i64> %a, %b;
	ret <2 x i64> %tmp1
}

define <2 x i32> @orr2xi32(<2 x i32> %a, <2 x i32> %b) {
;CHECK: orr {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = or <2 x i32> %a, %b;
	ret <2 x i32> %tmp1
}

define <4 x i16> @orr4xi16(<4 x i16> %a, <4 x i16> %b) {
;CHECK: orr {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = or <4 x i16> %a, %b;
	ret <4 x i16> %tmp1
}

define <1 x i64> @orr1xi64(<1 x i64> %a, <1 x i64> %b) {
;CHECK: orr {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = or <1 x i64> %a, %b;
	ret <1 x i64> %tmp1
}

define <4 x i32> @orr4xi32(<4 x i32> %a, <4 x i32> %b) {
;CHECK: orr {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = or <4 x i32> %a, %b;
	ret <4 x i32> %tmp1
}

define <8 x i16> @orr8xi16(<8 x i16> %a, <8 x i16> %b) {
;CHECK: orr {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = or <8 x i16> %a, %b;
	ret <8 x i16> %tmp1
}

define <2 x i64> @orr2xi64(<2 x i64> %a, <2 x i64> %b) {
;CHECK: orr {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = or <2 x i64> %a, %b;
	ret <2 x i64> %tmp1
}

define <2 x i32> @eor2xi32(<2 x i32> %a, <2 x i32> %b) {
;CHECK: eor {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = xor <2 x i32> %a, %b;
	ret <2 x i32> %tmp1
}

define <4 x i16> @eor4xi16(<4 x i16> %a, <4 x i16> %b) {
;CHECK: eor {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = xor <4 x i16> %a, %b;
	ret <4 x i16> %tmp1
}

define <1 x i64> @eor1xi64(<1 x i64> %a, <1 x i64> %b) {
;CHECK: eor {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = xor <1 x i64> %a, %b;
	ret <1 x i64> %tmp1
}

define <4 x i32> @eor4xi32(<4 x i32> %a, <4 x i32> %b) {
;CHECK: eor {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = xor <4 x i32> %a, %b;
	ret <4 x i32> %tmp1
}

define <8 x i16> @eor8xi16(<8 x i16> %a, <8 x i16> %b) {
;CHECK: eor {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = xor <8 x i16> %a, %b;
	ret <8 x i16> %tmp1
}

define <2 x i64> @eor2xi64(<2 x i64> %a, <2 x i64> %b) {
;CHECK: eor {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = xor <2 x i64> %a, %b;
	ret <2 x i64> %tmp1
}


define <2 x i32> @bic2xi32(<2 x i32> %a, <2 x i32> %b)  {
;CHECK:  bic {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %tmp1 = xor <2 x i32> %b, < i32 -1, i32 -1 >
  %tmp2 = and <2 x i32> %a, %tmp1
  ret <2 x i32> %tmp2
}

define <4 x i16> @bic4xi16(<4 x i16> %a, <4 x i16> %b)  {
;CHECK:  bic {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %tmp1 = xor <4 x i16> %b, < i16 -1, i16 -1, i16 -1, i16-1 >
  %tmp2 = and <4 x i16> %a, %tmp1
  ret <4 x i16> %tmp2
}

define <1 x i64> @bic1xi64(<1 x i64> %a, <1 x i64> %b)  {
;CHECK:  bic {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %tmp1 = xor <1 x i64> %b, < i64 -1>
  %tmp2 = and <1 x i64> %a, %tmp1
  ret <1 x i64> %tmp2
}

define <4 x i32> @bic4xi32(<4 x i32> %a, <4 x i32> %b)  {
;CHECK:  bic {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %tmp1 = xor <4 x i32> %b, < i32 -1, i32 -1, i32 -1, i32 -1>
  %tmp2 = and <4 x i32> %a, %tmp1
  ret <4 x i32> %tmp2
}

define <8 x i16> @bic8xi16(<8 x i16> %a, <8 x i16> %b)  {
;CHECK:  bic {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %tmp1 = xor <8 x i16> %b, < i16 -1, i16 -1, i16 -1, i16-1, i16 -1, i16 -1, i16 -1, i16 -1 >
  %tmp2 = and <8 x i16> %a, %tmp1
  ret <8 x i16> %tmp2
}

define <2 x i64> @bic2xi64(<2 x i64> %a, <2 x i64> %b)  {
;CHECK:  bic {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %tmp1 = xor <2 x i64> %b, < i64 -1, i64 -1>
  %tmp2 = and <2 x i64> %a, %tmp1
  ret <2 x i64> %tmp2
}

define <2 x i32> @orn2xi32(<2 x i32> %a, <2 x i32> %b)  {
;CHECK:  orn {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %tmp1 = xor <2 x i32> %b, < i32 -1, i32 -1 >
  %tmp2 = or <2 x i32> %a, %tmp1
  ret <2 x i32> %tmp2
}

define <4 x i16> @orn4xi16(<4 x i16> %a, <4 x i16> %b)  {
;CHECK:  orn {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %tmp1 = xor <4 x i16> %b, < i16 -1, i16 -1, i16 -1, i16-1 >
  %tmp2 = or <4 x i16> %a, %tmp1
  ret <4 x i16> %tmp2
}

define <1 x i64> @orn1xi64(<1 x i64> %a, <1 x i64> %b)  {
;CHECK:  orn {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %tmp1 = xor <1 x i64> %b, < i64 -1>
  %tmp2 = or <1 x i64> %a, %tmp1
  ret <1 x i64> %tmp2
}

define <4 x i32> @orn4xi32(<4 x i32> %a, <4 x i32> %b)  {
;CHECK:  orn {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %tmp1 = xor <4 x i32> %b, < i32 -1, i32 -1, i32 -1, i32 -1>
  %tmp2 = or <4 x i32> %a, %tmp1
  ret <4 x i32> %tmp2
}

define <8 x i16> @orn8xi16(<8 x i16> %a, <8 x i16> %b)  {
;CHECK:  orn {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %tmp1 = xor <8 x i16> %b, < i16 -1, i16 -1, i16 -1, i16-1, i16 -1, i16 -1, i16 -1, i16 -1 >
  %tmp2 = or <8 x i16> %a, %tmp1
  ret <8 x i16> %tmp2
}

define <2 x i64> @orn2xi64(<2 x i64> %a, <2 x i64> %b)  {
;CHECK:  orn {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %tmp1 = xor <2 x i64> %b, < i64 -1, i64 -1>
  %tmp2 = or <2 x i64> %a, %tmp1
  ret <2 x i64> %tmp2
}
define <2 x i32> @bsl2xi32_const(<2 x i32> %a, <2 x i32> %b)  {
;CHECK:  bsl {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = and <2 x i32> %a, < i32 -1, i32 -1 >
	%tmp2 = and <2 x i32> %b, < i32 0, i32 0 >
	%tmp3 = or <2 x i32> %tmp1, %tmp2
	ret <2 x i32> %tmp3
}


define <4 x i16> @bsl4xi16_const(<4 x i16> %a, <4 x i16> %b)  {
;CHECK:  bsl {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = and <4 x i16> %a, < i16 -1, i16 -1, i16 -1,i16 -1 >
	%tmp2 = and <4 x i16> %b, < i16 0, i16 0,i16 0, i16 0 >
	%tmp3 = or <4 x i16> %tmp1, %tmp2
	ret <4 x i16> %tmp3
}

define <1 x i64> @bsl1xi64_const(<1 x i64> %a, <1 x i64> %b)  {
;CHECK:  bsl {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
	%tmp1 = and <1 x i64> %a, < i64 -1 >
	%tmp2 = and <1 x i64> %b, < i64 0 >
	%tmp3 = or <1 x i64> %tmp1, %tmp2
	ret <1 x i64> %tmp3
}

define <4 x i32> @bsl4xi32_const(<4 x i32> %a, <4 x i32> %b)  {
;CHECK:  bsl {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = and <4 x i32> %a, < i32 -1, i32 -1, i32 -1, i32 -1 >
	%tmp2 = and <4 x i32> %b, < i32 0, i32 0, i32 0, i32 0 >
	%tmp3 = or <4 x i32> %tmp1, %tmp2
	ret <4 x i32> %tmp3
}

define <8 x i16> @bsl8xi16_const(<8 x i16> %a, <8 x i16> %b)  {
;CHECK:  bsl {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = and <8 x i16> %a, < i16 -1, i16 -1, i16 -1,i16 -1, i16 -1, i16 -1, i16 -1,i16 -1 >
	%tmp2 = and <8 x i16> %b, < i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0 >
	%tmp3 = or <8 x i16> %tmp1, %tmp2
	ret <8 x i16> %tmp3
}

define <2 x i64> @bsl2xi64_const(<2 x i64> %a, <2 x i64> %b)  {
;CHECK:  bsl {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
	%tmp1 = and <2 x i64> %a, < i64 -1, i64 -1 >
	%tmp2 = and <2 x i64> %b, < i64 0, i64 0 >
	%tmp3 = or <2 x i64> %tmp1, %tmp2
	ret <2 x i64> %tmp3
}


define <8 x i8> @bsl8xi8(<8 x i8> %v1, <8 x i8> %v2, <8 x i8> %v3) {
;CHECK:  bsl {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %1 = and <8 x i8> %v1, %v2
  %2 = xor <8 x i8> %v1, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %3 = and <8 x i8> %2, %v3
  %4 = or <8 x i8> %1, %3
  ret <8 x i8> %4
}

define <4 x i16> @bsl4xi16(<4 x i16> %v1, <4 x i16> %v2, <4 x i16> %v3) {
;CHECK:  bsl {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %1 = and <4 x i16> %v1, %v2
  %2 = xor <4 x i16> %v1, <i16 -1, i16 -1, i16 -1, i16 -1>
  %3 = and <4 x i16> %2, %v3
  %4 = or <4 x i16> %1, %3
  ret <4 x i16> %4
}

define <2 x i32> @bsl2xi32(<2 x i32> %v1, <2 x i32> %v2, <2 x i32> %v3) {
;CHECK:  bsl {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %1 = and <2 x i32> %v1, %v2
  %2 = xor <2 x i32> %v1, <i32 -1, i32 -1>
  %3 = and <2 x i32> %2, %v3
  %4 = or <2 x i32> %1, %3
  ret <2 x i32> %4
}

define <1 x i64> @bsl1xi64(<1 x i64> %v1, <1 x i64> %v2, <1 x i64> %v3) {
;CHECK:  bsl {{v[0-9]+}}.8b, {{v[0-9]+}}.8b, {{v[0-9]+}}.8b
  %1 = and <1 x i64> %v1, %v2
  %2 = xor <1 x i64> %v1, <i64 -1>
  %3 = and <1 x i64> %2, %v3
  %4 = or <1 x i64> %1, %3
  ret <1 x i64> %4
}

define <16 x i8> @bsl16xi8(<16 x i8> %v1, <16 x i8> %v2, <16 x i8> %v3) {
;CHECK:  bsl {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %1 = and <16 x i8> %v1, %v2
  %2 = xor <16 x i8> %v1, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %3 = and <16 x i8> %2, %v3
  %4 = or <16 x i8> %1, %3
  ret <16 x i8> %4
}

define <8 x i16> @bsl8xi16(<8 x i16> %v1, <8 x i16> %v2, <8 x i16> %v3) {
;CHECK:  bsl {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %1 = and <8 x i16> %v1, %v2
  %2 = xor <8 x i16> %v1, <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>
  %3 = and <8 x i16> %2, %v3
  %4 = or <8 x i16> %1, %3
  ret <8 x i16> %4
}

define <4 x i32> @bsl4xi32(<4 x i32> %v1, <4 x i32> %v2, <4 x i32> %v3) {
;CHECK:  bsl {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %1 = and <4 x i32> %v1, %v2
  %2 = xor <4 x i32> %v1, <i32 -1, i32 -1, i32 -1, i32 -1>
  %3 = and <4 x i32> %2, %v3
  %4 = or <4 x i32> %1, %3
  ret <4 x i32> %4
}

define <2 x i64> @bsl2xi64(<2 x i64> %v1, <2 x i64> %v2, <2 x i64> %v3) {
;CHECK:  bsl {{v[0-9]+}}.16b, {{v[0-9]+}}.16b, {{v[0-9]+}}.16b
  %1 = and <2 x i64> %v1, %v2
  %2 = xor <2 x i64> %v1, <i64 -1, i64 -1>
  %3 = and <2 x i64> %2, %v3
  %4 = or <2 x i64> %1, %3
  ret <2 x i64> %4
}

define <8 x i8> @orrimm8b_as_orrimm4h_lsl0(<8 x i8> %a) {
;CHECK:  orr {{v[0-9]+}}.4h, #0xff
  %val = or <8 x i8> %a, <i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0>
  ret <8 x i8> %val
}

define <8 x i8> @orrimm8b_as_orimm4h_lsl8(<8 x i8> %a) {
;CHECK:  orr {{v[0-9]+}}.4h, #0xff, lsl #8
  %val = or <8 x i8> %a, <i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255>
  ret <8 x i8> %val
}

define <16 x i8> @orimm16b_as_orrimm8h_lsl0(<16 x i8> %a) {
;CHECK:  orr {{v[0-9]+}}.8h, #0xff
  %val = or <16 x i8> %a, <i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0>
  ret <16 x i8> %val
}

define <16 x i8> @orimm16b_as_orrimm8h_lsl8(<16 x i8> %a) {
;CHECK:  orr {{v[0-9]+}}.8h, #0xff, lsl #8
  %val = or <16 x i8> %a, <i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255, i8 0, i8 255>
  ret <16 x i8> %val
}


