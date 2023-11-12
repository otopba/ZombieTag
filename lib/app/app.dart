import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taggame/app/app_cubit.dart';
import 'package:taggame/app/app_cubit_state.dart';
import 'package:taggame/kit/tg_colors.dart';
import 'package:taggame/services/localization_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  static const _designSize = Size(414, 890);

  final _cubit = AppCubit();
  late AppCubitState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(
      bloc: _cubit,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, AppCubitState state) {
    _state = state;

    /// migrating from deprecated button to new material buttons
    /// flutter.dev/go/material-button-migration-guide
    final flatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    final raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: Colors.grey[300],
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );

    final outlineButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            );
          }
          return BorderSide.none; // Defer to the widget's default.
        },
      ),
    );

    final theme = ThemeData(
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: TGColors.lightColors.backgroundColor,
      highlightColor: TGColors.lightColors.splashColor,
      splashColor: TGColors.lightColors.splashColor,
      colorScheme: const ColorScheme.light(
        secondary: TGColors.greenForWhiteColor,
      ),
      // to automatically repaint the status bar in the desired color
      primaryColor: TGColors.lightColors.backgroundColor,
      textButtonTheme: TextButtonThemeData(style: flatButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
    );

    final dartTheme = ThemeData(
      colorScheme: const ColorScheme.dark(secondary: TGColors.greenColor),
      brightness: Brightness.dark,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: TGColors.darkColors.backgroundColor,
      highlightColor: TGColors.darkColors.highlightColor,
      splashColor: TGColors.darkColors.splashColor,
      // to automatically repaint the status bar in the desired color
      primaryColor: TGColors.darkColors.backgroundColor,
      textButtonTheme: TextButtonThemeData(style: flatButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
    );

    return ScreenUtilInit(
      designSize: _designSize,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _cubit.routerConfig,
        localizationsDelegates: LocalizationService.localizationsDelegates,
        supportedLocales: LocalizationService.supportedLocales,
        onGenerateTitle: (context) => context.localization.appTitle,
        localeListResolutionCallback: _cubit.localeListResolutionCallback,
        locale: _state.overridedLocale,
        theme: theme,
        darkTheme: dartTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
