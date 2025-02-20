import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/core/theme/theme_cubit.dart';
import 'package:hotel_booking_app/core/theme/theme_state.dart';
import 'package:hotel_booking_app/generated/l10n.dart';

class SettingsPage extends StatelessWidget {
  final Function(String) changeLanguage;

  const SettingsPage({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsPageTitle),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildLanguageTile(context),
            const Divider(),
            _buildThemeTile(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.language, color: Theme.of(context).iconTheme.color),
      title: Text(S.of(context).language),
      subtitle: Text(S.of(context).chooseYourLanguage),
      onTap: () {
        _showLanguageDialog(context);
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).selectLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(S.of(context).english),
              onTap: () {
                changeLanguage('en');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(S.of(context).arabic),
              onTap: () {
                changeLanguage('ar');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeTile(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        bool isDarkMode = themeState is DarkThemeState;
        return ListTile(
          leading: Icon(
            Icons.brightness_6,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(S.of(context).darkMode),
          subtitle: Text(
            isDarkMode
                ? S.of(context).darkModeEnabled
                : S.of(context).darkModeDisabled,
          ),
          trailing: Switch(
            value: isDarkMode,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        );
      },
    );
  }
}
