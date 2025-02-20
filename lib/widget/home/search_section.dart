import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/feature/navigation/navigation_screen_%20DatePickerModal.dart';
import 'package:hotel_booking_app/feature/navigation/room_selection_screen.dart';
import 'package:hotel_booking_app/feature/navigation/CitySearchPage.dart';
import 'package:hotel_booking_app/generated/l10n.dart';
import 'package:hotel_booking_app/feature/bloc/bloc_DatePicker.dart';
import 'package:hotel_booking_app/feature/bloc/block_Translation.dart';
import 'package:intl/intl.dart';

class SearchSection extends StatefulWidget {
  final Function(String?) onCitySelected;
  final Function(String) onGuestsChanged;

  const SearchSection({
    super.key,
    required this.onCitySelected,
    required this.onGuestsChanged,
  });

  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  int rooms = 1, adults = 1, children = 0, infants = 0;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final locale = Localizations.localeOf(context).languageCode;
    final localization = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            final selected = await showModalBottomSheet<String>(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (modalContext) => CitySearchModal(),
            );

            if (selected != null) {
              setState(() {
                selectedCity = selected;
              });
              widget.onCitySelected(selected);
            }
          },
          child: _buildTextField(
              selectedCity ?? localization.travelTo, isDarkMode),
        ),
        const SizedBox(height: 15),
        BlocBuilder<DatePickerCubit, Map<String, DateTime?>>(
          builder: (context, state) {
            String formattedDepart = state['depart'] != null
                ? DateFormat.yMMMd(locale).format(state['depart']!)
                : localization.depart;

            String formattedArrive = state['arrive'] != null
                ? DateFormat.yMMMd(locale).format(state['arrive']!)
                : localization.arrive;

            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (modalContext) => BlocProvider.value(
                    value: BlocProvider.of<DatePickerCubit>(context),
                    child: DatePickerModal(),
                  ),
                );
              },
              child: _buildTextField(
                "📅 $formattedDepart - $formattedArrive",
                isDarkMode,
              ),
            );
          },
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () async {
            final result = await showModalBottomSheet<Map<String, int>>(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              builder: (modalContext) => RoomSelectionScreen(),
            );

            if (result != null) {
              setState(() {
                rooms = result['rooms'] ?? 1;
                adults = result['adults'] ?? 1;
                children = result['children'] ?? 0;
                infants = result['infants'] ?? 0;
              });
              widget.onGuestsChanged(
                  "$rooms ${localization.room}, $adults ${localization.adult}, "
                  "$children ${localization.children}, $infants ${localization.infant}");
            }
          },
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              final localization = S.of(context);

              bool isDefault =
                  rooms == 1 && adults == 1 && children == 0 && infants == 0;

              String guestsSummary = isDefault
                  ? localization.guests
                  : "$rooms ${localization.room}, "
                      "$adults ${localization.adult}, "
                      "$children ${localization.children}, "
                      "$infants ${localization.infant}";

              return _buildTextField(
                guestsSummary,
                isDarkMode,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String hint, bool isDarkMode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.grey[700]! : Colors.grey.shade300,
        ),
      ),
      child: Text(
        hint,
        style: TextStyle(
          fontSize: 16,
          color: isDarkMode ? Colors.white70 : Colors.black54,
        ),
      ),
    );
  }
}
