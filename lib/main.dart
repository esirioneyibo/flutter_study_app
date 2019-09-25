import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_study_app/app.dart';
import 'package:flutter_study_app/app_state.dart';
import 'package:flutter_study_app/config/router_config.dart';
import 'package:flutter_study_app/factory.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';
import 'package:flutter_study_app/pages/mine/about_screen.dart';
import 'package:flutter_study_app/pages/mine/account_screen.dart';
import 'package:flutter_study_app/pages/mine/device_info_screen.dart';
import 'package:flutter_study_app/pages/mine/language_screen.dart';
import 'package:flutter_study_app/pages/mine/settings_screen.dart';
import 'package:flutter_study_app/pages/mine/theme_screen.dart';
import 'package:flutter_study_app/pages/splash_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouterConfig router = ConfigFactory.router();
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          routes: {
            router.index: (context) => MyApp(),
            router.account: (context) => AccountScreen(),
            router.about: (context) => AboutAppScreen(),
            router.settings: (context) => SettingScreen(),
            router.language: (context) => LanguageScreen(),
            router.theme: (context) => ThemeScreen(),
            router.deviceInfo: (context) => DeviceInfoScreen(),
          },
          locale: store.state.locale,
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            MyLocalizationsDelegate.delegate
          ],
          supportedLocales: [
            const Locale('zh', 'CN'), // 中文简体
            const Locale('en', 'US'), // 美国英语
            const Locale('ja', 'JP'), // 日本日语
          ],
          theme: store.state.themeData,
          home: SplashScreen(),
        ));
  }
}
