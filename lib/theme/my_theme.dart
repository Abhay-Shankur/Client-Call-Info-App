import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kThemeModeKey = '__theme_mode__';

abstract class AppTheme {
  static AppTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  abstract Color primary;
  abstract Color secondary;
  abstract Color tertiary;
  abstract Color alternate;
  abstract Color primaryText;
  abstract Color secondaryText;
  abstract Color primaryBackground;
  abstract Color secondaryBackground;
  abstract Color accent1;
  abstract Color accent2;
  abstract Color accent3;
  abstract Color accent4;
  abstract Color success;
  abstract Color warning;
  abstract Color error;
  abstract Color info;

  abstract Color primaryBtnText;
  abstract Color lineColor;
  abstract Color backgroundComponents;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends AppTheme {
  @override
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @override
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @override
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  @override
  Color primary = const Color(0xFF507583);
  @override
  Color secondary = const Color(0xFF18aa99);
  @override
  Color tertiary = const Color(0xFF928163);
  @override
  Color alternate = const Color(0xFFede8df);
  @override
  Color primaryText = const Color(0xFF101518);
  @override
  Color secondaryText = const Color(0xFF57636c);
  @override
  Color primaryBackground = const Color(0xFFfbf9f5);
  @override
  Color secondaryBackground = const Color(0xFFFFFFFF);
  @override
  Color accent1 = const Color(0x4F507583);
  @override
  Color accent2 = const Color(0x4D18AA99);
  @override
  Color accent3 = const Color(0x4D928163);
  @override
  Color accent4 = const Color(0xB2FFFFFF);
  @override
  Color success = const Color(0xFF16857B);
  @override
  Color warning = const Color(0xFFF3C344);
  @override
  Color error = const Color(0xFFC4454D);
  @override
  Color info = const Color(0xFFFFFFFF);

  @override
  Color primaryBtnText = const Color(0xFFFFFFFF);
  @override
  Color lineColor = const Color(0xFFE0E3E7);
  @override
  Color backgroundComponents = const Color(0xFF1D2428);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final AppTheme theme;

  @override
  String get displayLargeFamily => 'Outfit';
  @override
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  @override
  String get displayMediumFamily => 'Outfit';
  @override
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  @override
  String get displaySmallFamily => 'Outfit';
  @override
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  @override
  String get headlineLargeFamily => 'Outfit';
  @override
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  @override
  String get headlineMediumFamily => 'Outfit';
  @override
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  @override
  String get headlineSmallFamily => 'Outfit';
  @override
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  @override
  String get titleLargeFamily => 'Outfit';
  @override
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  @override
  String get titleMediumFamily => 'Readex Pro';
  @override
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  @override
  String get titleSmallFamily => 'Readex Pro';
  @override
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  @override
  String get labelLargeFamily => 'Readex Pro';
  @override
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  @override
  String get labelMediumFamily => 'Readex Pro';
  @override
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  @override
  String get labelSmallFamily => 'Readex Pro';
  @override
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  @override
  String get bodyLargeFamily => 'Readex Pro';
  @override
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  @override
  String get bodyMediumFamily => 'Readex Pro';
  @override
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  @override
  String get bodySmallFamily => 'Readex Pro';
  @override
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Readex Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends AppTheme {
  @override
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @override
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @override
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  @override
  Color primary = const Color(0xFF6898AB);
  @override
  Color secondary = const Color(0xFF18AA99);
  @override
  Color tertiary = const Color(0xFF928163);
  @override
  Color alternate = const Color(0xFF1C262E);
  @override
  Color primaryText = const Color(0xFFFFFFFF);
  @override
  Color secondaryText = const Color(0xFF95A1AC);
  @override
  Color primaryBackground = const Color(0xFF182026);
  @override
  Color secondaryBackground = const Color(0xFF101518);
  @override
  Color accent1 = const Color(0x4C6898AB);
  @override
  Color accent2 = const Color(0x4D18AA99);
  @override
  Color accent3 = const Color(0x4D928163);
  @override
  Color accent4 = const Color(0xB20B191E);
  @override
  Color success = const Color(0xFF16857B);
  @override
  Color warning = const Color(0xFFF3C344);
  @override
  Color error = const Color(0xFFC4454D);
  @override
  Color info = const Color(0xFFFFFFFF);

  @override
  Color primaryBtnText = const Color(0xFFFFFFFF);
  @override
  Color lineColor = const Color(0xFF22282F);
  @override
  Color backgroundComponents = const Color(0xFF1D2428);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
