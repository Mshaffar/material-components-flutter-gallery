import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/localizations_delegate.dart';
import 'l10n/supported_locales.dart';
import 'pages/backdrop.dart';
import 'pages/home.dart';
import 'pages/settings.dart';
import 'themes/gallery_theme_data.dart';

void setOverrideForDesktop() {
  if (kIsWeb) return;

  if (Platform.isMacOS) {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
  } else if (Platform.isFuchsia) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  setOverrideForDesktop();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      themeMode: ThemeMode.system,
      theme: GalleryThemeData.lightThemeData,
      darkTheme: GalleryThemeData.darkThemeData,
      localizationsDelegates: [
        GalleryLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      home: Backdrop(
        frontLayer: SettingsPage(),
        backLayer: HomePage(),
      ),
    );
  }
}
