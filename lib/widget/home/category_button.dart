import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const CategoryButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    double containerWidth = screenWidth * 0.4;
    containerWidth = containerWidth.clamp(140.0, 200.0);

    double iconSize = containerWidth * 0.15;
    double fontSize = containerWidth * 0.09;

    return InkWell(
      onTap: onPressed,
      splashColor: Colors.teal.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: containerWidth,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF222222) : const Color(0xFFF0FAFA),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: containerWidth * 0.08,
          horizontal: containerWidth * 0.1,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: iconSize * 1.5,
              height: iconSize * 1.5,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF333333)
                    : const Color(0xFFE6F0F5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: isDarkMode
                      ? const Color(0xFF00E5FF)
                      : const Color(0xFF00B9C3),
                  size: iconSize,
                ),
              ),
            ),
            SizedBox(width: containerWidth * 0.05),
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
