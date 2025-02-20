import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/theme/app_theme.dart';

abstract class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(AppThemes.lightTheme);
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(AppThemes.darkTheme);
}
