// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Depart`
  String get depart {
    return Intl.message('Depart', name: 'depart', desc: '', args: []);
  }

  /// `Arrive`
  String get arrive {
    return Intl.message('Arrive', name: 'arrive', desc: '', args: []);
  }

  /// `Travel Dates`
  String get travelDates {
    return Intl.message(
      'Travel Dates',
      name: 'travelDates',
      desc: '',
      args: [],
    );
  }

  /// `Search for a city`
  String get searchForCity {
    return Intl.message(
      'Search for a city',
      name: 'searchForCity',
      desc: '',
      args: [],
    );
  }

  /// `Search Cities`
  String get searchCities {
    return Intl.message(
      'Search Cities',
      name: 'searchCities',
      desc: '',
      args: [],
    );
  }

  /// `Menu button clicked!`
  String get menuButtonClicked {
    return Intl.message(
      'Menu button clicked!',
      name: 'menuButtonClicked',
      desc: '',
      args: [],
    );
  }

  /// `🔍 Search`
  String get searchIcon {
    return Intl.message('🔍 Search', name: 'searchIcon', desc: '', args: []);
  }

  /// `Searching for hotels`
  String get searchingForHotels {
    return Intl.message(
      'Searching for hotels',
      name: 'searchingForHotels',
      desc: '',
      args: [],
    );
  }

  /// `👥 Guests`
  String get guests {
    return Intl.message('👥 Guests', name: 'guests', desc: '', args: []);
  }

  /// `📅 Select Dates`
  String get selectDates {
    return Intl.message(
      '📅 Select Dates',
      name: 'selectDates',
      desc: '',
      args: [],
    );
  }

  /// `Depart`
  String get departLabel {
    return Intl.message('Depart', name: 'departLabel', desc: '', args: []);
  }

  /// `Arrive`
  String get arriveLabel {
    return Intl.message('Arrive', name: 'arriveLabel', desc: '', args: []);
  }

  /// `Great adventures start here, search for your hotel!`
  String get greatAdventuresStart {
    return Intl.message(
      'Great adventures start here, search for your hotel!',
      name: 'greatAdventuresStart',
      desc: '',
      args: [],
    );
  }

  /// `🌍 Travel to`
  String get travelTo {
    return Intl.message('🌍 Travel to', name: 'travelTo', desc: '', args: []);
  }

  /// `Navigating to packages page`
  String get navigatingToPackagesPage {
    return Intl.message(
      'Navigating to packages page',
      name: 'navigatingToPackagesPage',
      desc: '',
      args: [],
    );
  }

  /// `Packages`
  String get packages {
    return Intl.message('Packages', name: 'packages', desc: '', args: []);
  }

  /// `Navigating to flights page`
  String get navigatingToFlightsPage {
    return Intl.message(
      'Navigating to flights page',
      name: 'navigatingToFlightsPage',
      desc: '',
      args: [],
    );
  }

  /// `Flights`
  String get flights {
    return Intl.message('Flights', name: 'flights', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Current Language`
  String get currentLanguage {
    return Intl.message(
      'Current Language',
      name: 'currentLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsPageTitle {
    return Intl.message(
      'Settings',
      name: 'settingsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose your language`
  String get chooseYourLanguage {
    return Intl.message(
      'Choose your language',
      name: 'chooseYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Add another room`
  String get addAnotherRoom {
    return Intl.message(
      'Add another room',
      name: 'addAnotherRoom',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Passengers & Rooms`
  String get passengersRooms {
    return Intl.message(
      'Passengers & Rooms',
      name: 'passengersRooms',
      desc: '',
      args: [],
    );
  }

  /// `Adult`
  String get adult {
    return Intl.message('Adult', name: 'adult', desc: '', args: []);
  }

  /// `Above 11 Years`
  String get above11Years {
    return Intl.message(
      'Above 11 Years',
      name: 'above11Years',
      desc: '',
      args: [],
    );
  }

  /// `Child`
  String get child {
    return Intl.message('Child', name: 'child', desc: '', args: []);
  }

  /// `Children`
  String get children {
    return Intl.message('Children', name: 'children', desc: '', args: []);
  }

  /// `Years 2-11`
  String get years2To11 {
    return Intl.message('Years 2-11', name: 'years2To11', desc: '', args: []);
  }

  /// `Infant`
  String get infant {
    return Intl.message('Infant', name: 'infant', desc: '', args: []);
  }

  /// `Less than 1 Year`
  String get lessThan1Year {
    return Intl.message(
      'Less than 1 Year',
      name: 'lessThan1Year',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get room {
    return Intl.message('Room', name: 'room', desc: '', args: []);
  }

  /// `Dark mode enabled`
  String get darkModeEnabled {
    return Intl.message(
      'Dark mode enabled',
      name: 'darkModeEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode disabled`
  String get darkModeDisabled {
    return Intl.message(
      'Dark mode disabled',
      name: 'darkModeDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message('Dark mode', name: 'darkMode', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
