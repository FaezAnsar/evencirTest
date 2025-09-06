import 'package:evencir_test/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialTheme {
  const MaterialTheme(this.textTheme);

  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2d628b),
      surfaceTint: Color(0xff2d628b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcde5ff),
      onPrimaryContainer: Color(0xff0a4a72),
      secondary: Color(0xff51606f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd4e4f6),
      onSecondaryContainer: Color(0xff394857),
      tertiary: Color(0xff67587a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffeedcff),
      onTertiaryContainer: Color(0xff4f4061),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff181c20),
      onSurfaceVariant: Color(0xff42474e),
      outline: Color(0xff72787e),
      outlineVariant: Color(0xffc2c7cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff9acbfa),
      primaryFixed: Color(0xffcde5ff),
      onPrimaryFixed: Color(0xff001d32),
      primaryFixedDim: Color(0xff9acbfa),
      onPrimaryFixedVariant: Color(0xff0a4a72),
      secondaryFixed: Color(0xffd4e4f6),
      onSecondaryFixed: Color(0xff0d1d2a),
      secondaryFixedDim: Color(0xffb9c8da),
      onSecondaryFixedVariant: Color(0xff394857),
      tertiaryFixed: Color(0xffeedcff),
      onTertiaryFixed: Color(0xff221533),
      tertiaryFixedDim: Color(0xffd2bfe7),
      onTertiaryFixedVariant: Color(0xff4f4061),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00395b),
      surfaceTint: Color(0xff2d628b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3e719b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff293846),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff606f7e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3e3050),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff76668a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff0e1215),
      onSurfaceVariant: Color(0xff31373d),
      outline: Color(0xff4d5359),
      outlineVariant: Color(0xff686e74),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff9acbfa),
      primaryFixed: Color(0xff3e719b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff215981),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff606f7e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff475665),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff76668a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5d4e70),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c6cc),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffe6e8ee),
      surfaceContainerHigh: Color(0xffdadde2),
      surfaceContainerHighest: Color(0xffcfd2d7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002f4b),
      surfaceTint: Color(0xff2d628b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0f4d75),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1f2e3b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3c4b59),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff332645),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff514364),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff272d33),
      outlineVariant: Color(0xff444a50),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff9acbfa),
      primaryFixed: Color(0xff0f4d75),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003655),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3c4b59),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff253442),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff514364),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3a2c4c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb6b9be),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeef1f6),
      surfaceContainer: Color(0xffe0e2e8),
      surfaceContainerHigh: Color(0xffd2d4da),
      surfaceContainerHighest: Color(0xffc4c6cc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9acbfa),
      surfaceTint: Color(0xff9acbfa),
      onPrimary: Color(0xff003352),
      primaryContainer: Color(0xff0a4a72),
      onPrimaryContainer: Color(0xffcde5ff),
      secondary: Color(0xffb9c8da),
      onSecondary: Color(0xff233240),
      secondaryContainer: Color(0xff394857),
      onSecondaryContainer: Color(0xffd4e4f6),
      tertiary: Color(0xffd2bfe7),
      onTertiary: Color(0xff382a4a),
      tertiaryContainer: Color(0xff4f4061),
      onTertiaryContainer: Color(0xffeedcff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101418),
      onSurface: Color(0xffe0e2e8),
      onSurfaceVariant: Color(0xffc2c7cf),
      outline: Color(0xff8c9198),
      outlineVariant: Color(0xff42474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff2d628b),
      primaryFixed: Color(0xffcde5ff),
      onPrimaryFixed: Color(0xff001d32),
      primaryFixedDim: Color(0xff9acbfa),
      onPrimaryFixedVariant: Color(0xff0a4a72),
      secondaryFixed: Color(0xffd4e4f6),
      onSecondaryFixed: Color(0xff0d1d2a),
      secondaryFixedDim: Color(0xffb9c8da),
      onSecondaryFixedVariant: Color(0xff394857),
      tertiaryFixed: Color(0xffeedcff),
      onTertiaryFixed: Color(0xff221533),
      tertiaryFixedDim: Color(0xffd2bfe7),
      onTertiaryFixedVariant: Color(0xff4f4061),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff36393e),
      surfaceContainerLowest: Color(0xff0b0f12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff272a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc1e0ff),
      surfaceTint: Color(0xff9acbfa),
      onPrimary: Color(0xff002841),
      primaryContainer: Color(0xff6495c1),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcedef0),
      onSecondary: Color(0xff182734),
      secondaryContainer: Color(0xff8392a3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe8d5fd),
      onTertiary: Color(0xff2d1f3e),
      tertiaryContainer: Color(0xff9b8aaf),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd8dde4),
      outline: Color(0xffadb2ba),
      outlineVariant: Color(0xff8b9198),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff0d4c73),
      primaryFixed: Color(0xffcde5ff),
      onPrimaryFixed: Color(0xff001222),
      primaryFixedDim: Color(0xff9acbfa),
      onPrimaryFixedVariant: Color(0xff00395b),
      secondaryFixed: Color(0xffd4e4f6),
      onSecondaryFixed: Color(0xff03121f),
      secondaryFixedDim: Color(0xffb9c8da),
      onSecondaryFixedVariant: Color(0xff293846),
      tertiaryFixed: Color(0xffeedcff),
      onTertiaryFixed: Color(0xff170a28),
      tertiaryFixedDim: Color(0xffd2bfe7),
      onTertiaryFixedVariant: Color(0xff3e3050),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff414549),
      surfaceContainerLowest: Color(0xff05080b),
      surfaceContainerLow: Color(0xff1a1e22),
      surfaceContainer: Color(0xff25282c),
      surfaceContainerHigh: Color(0xff2f3337),
      surfaceContainerHighest: Color(0xff3a3e42),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe6f1ff),
      surfaceTint: Color(0xff9acbfa),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff96c8f6),
      onPrimaryContainer: Color(0xff000c19),
      secondary: Color(0xffe6f1ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb5c4d6),
      onSecondaryContainer: Color(0xff000c19),
      tertiary: Color(0xfff8ecff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcebbe3),
      onTertiaryContainer: Color(0xff110522),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff101418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffebf0f8),
      outlineVariant: Color(0xffbec3cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff0d4c73),
      primaryFixed: Color(0xffcde5ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9acbfa),
      onPrimaryFixedVariant: Color(0xff001222),
      secondaryFixed: Color(0xffd4e4f6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb9c8da),
      onSecondaryFixedVariant: Color(0xff03121f),
      tertiaryFixed: Color(0xffeedcff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd2bfe7),
      onTertiaryFixedVariant: Color(0xff170a28),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff4d5055),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1c2024),
      surfaceContainer: Color(0xff2d3135),
      surfaceContainerHigh: Color(0xff383c40),
      surfaceContainerHighest: Color(0xff43474c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) {
    final fontFamily = textTheme.bodyMedium?.fontFamily ?? 'Roboto';

    return ThemeData(
      useMaterial3: true,
      cardColor: colorScheme.onPrimary,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      primaryTextTheme: textTheme.apply(
        bodyColor: colorScheme.onPrimary,
        displayColor: colorScheme.onPrimary,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.onSurface,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicatorColor: colorScheme.primary,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0.r),
            side: BorderSide(color: colorScheme.outline),
          ),
          padding: EdgeInsets.all(12.0),
          textStyle: AppTextStyles.textStyle14.copyWith(fontFamily: fontFamily),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0.r),
          ),
          padding: EdgeInsets.all(12.0),
          textStyle: AppTextStyles.textStyle14.copyWith(fontFamily: fontFamily),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0.r),
        ),
        padding: EdgeInsets.all(12.0),
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerLow,
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        errorMaxLines: 3,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        errorStyle: TextStyle(color: colorScheme.error),
      ),
      dividerColor: colorScheme.surfaceContainerHighest,
      dividerTheme: DividerThemeData(
        color: colorScheme.surfaceContainerHighest,
        thickness: 1.0,
      ),
    );
  }

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });

  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

TextTheme createTextTheme(
  BuildContext context,
  String bodyFontString,
  String displayFontString,
) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
    bodyFontString,
    baseTextTheme,
  );
  TextTheme displayTextTheme = GoogleFonts.getTextTheme(
    displayFontString,
    baseTextTheme,
  );
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
