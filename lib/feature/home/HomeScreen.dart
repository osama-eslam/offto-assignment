import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/feature/bloc/bloc_DatePicker.dart';
import 'package:hotel_booking_app/generated/l10n.dart';
import 'package:hotel_booking_app/widget/home/category_button.dart';
import 'package:hotel_booking_app/widget/home/menu_button.dart';
import 'package:hotel_booking_app/widget/home/search_section.dart';
import 'package:hotel_booking_app/widget/home/search_button.dart';

class HomeScreen extends StatefulWidget {
  final Function(String) changeLanguage;
  const HomeScreen({super.key, required this.changeLanguage});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => DatePickerCubit(),
      child: Scaffold(
        backgroundColor: isDarkMode
            ? const Color.fromARGB(221, 0, 0, 0)
            : const Color(0xFFE6F5F5),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: MenuButton(changeLanguage: widget.changeLanguage),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryButton(
                    icon: Icons.flight_takeoff_sharp,
                    text: S.of(context).flights,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  CategoryButton(
                    icon: Icons.beach_access,
                    text: S.of(context).packages,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SearchSection(
                onCitySelected: (String) {},
                onGuestsChanged: (String) {},
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 70,
                  child: SearchButton(
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
