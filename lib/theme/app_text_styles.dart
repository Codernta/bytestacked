import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headlines (Plus Jakarta Sans)
  static TextStyle headlineXl({Color color = AppColors.primary, double? fontSize}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: fontSize ?? 56,
        height: (fontSize != null ? fontSize * 1.14 : 64) / (fontSize ?? 56),
        fontWeight: FontWeight.w700,
        letterSpacing: -1.68,
        color: color,
      );

  static TextStyle headlineXlMobile({Color color = AppColors.primary}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 34,
        height: 42 / 34,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.85,
        color: color,
      );

  static TextStyle headlineLg({Color color = AppColors.primary, double? fontSize}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: fontSize ?? 40,
        height: (fontSize != null ? fontSize * 1.2 : 48) / (fontSize ?? 40),
        fontWeight: FontWeight.w700,
        letterSpacing: -1.0,
        color: color,
      );

  static TextStyle headlineLgMobile({Color color = AppColors.primary}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 28,
        height: 36 / 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.56,
        color: color,
      );

  static TextStyle headlineMd({Color color = AppColors.primary}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 28,
        height: 36 / 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.56,
        color: color,
      );

  static TextStyle headlineSm({Color color = AppColors.primary}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 20,
        height: 28 / 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        color: color,
      );

  // Body
  static TextStyle bodyLg({Color color = AppColors.onSurfaceVariant}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 18,
        height: 28 / 18,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle bodyMd({Color color = AppColors.onSurfaceVariant}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 15,
        height: 24 / 15,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle bodySm({Color color = AppColors.onSurfaceVariant}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 13,
        height: 20 / 13,
        fontWeight: FontWeight.w400,
        color: color,
      );

  // Labels
  static TextStyle labelMd({Color color = AppColors.primary, FontWeight fontWeight = FontWeight.w600}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: fontWeight,
        color: color,
      );

  static TextStyle labelSm({Color color = AppColors.onSurfaceVariant, FontWeight fontWeight = FontWeight.w500}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: fontWeight,
        color: color,
      );

  static TextStyle labelCaps({Color color = AppColors.onSurfaceVariant, FontWeight fontWeight = FontWeight.w600}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 11,
        height: 16 / 11,
        fontWeight: fontWeight,
        letterSpacing: 0.88,
        color: color,
      );

  static TextStyle codeSnippet({Color color = AppColors.inverseOnSurface}) =>
      GoogleFonts.jetBrainsMono(
        fontSize: 12,
        height: 1.6,
        fontWeight: FontWeight.w500,
        color: color,
      );
}
