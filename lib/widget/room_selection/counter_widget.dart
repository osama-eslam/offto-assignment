import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final String label;
  final String type;
  final int count;
  final String ageRange;
  final Function(String, int) updateCount;

  const CounterWidget({
    super.key,
    required this.label,
    required this.type,
    required this.count,
    required this.ageRange,
    required this.updateCount,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Text(
                ageRange,
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? Colors.white70 : Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove_circle_outline,
                  color:
                      isDarkMode ? Colors.blue[200] : const Color(0xFFB2DDF6),
                  size: 20,
                ),
                onPressed: count > (type == "adults" ? 1 : 0)
                    ? () => updateCount(type, -1)
                    : null,
              ),
              const SizedBox(width: 16),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color:
                      isDarkMode ? Colors.blue[400] : const Color(0xFF086D9E),
                  size: 24,
                ),
                onPressed: () => updateCount(type, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
