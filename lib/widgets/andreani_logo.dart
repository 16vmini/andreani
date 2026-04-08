import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class AndreaniLogo extends StatelessWidget {
  final double size;
  const AndreaniLogo({super.key, this.size = 1.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Andreani',
              style: GoogleFonts.poppins(
                fontSize: 30 * size,
                fontWeight: FontWeight.w900,
                color: AppTheme.textPrimary,
                fontStyle: FontStyle.italic,
                height: 1.0,
                letterSpacing: -0.5,
              ),
            ),
            Text(
              'GROUP',
              style: GoogleFonts.poppins(
                fontSize: 12 * size,
                fontWeight: FontWeight.w700,
                color: AppTheme.textSecondary,
                letterSpacing: 3,
                height: 1.0,
              ),
            ),
          ],
        ),
        const SizedBox(width: 4),
        // Red slash mark
        Container(
          width: 6 * size,
          height: 42 * size,
          decoration: BoxDecoration(
            color: AppTheme.primaryRed,
            borderRadius: BorderRadius.circular(2),
          ),
          transform: Matrix4.rotationZ(-0.15),
        ),
      ],
    );
  }
}

// Smaller version for screen headers
class AndreaniLogoSmall extends StatelessWidget {
  const AndreaniLogoSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Andreani',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.textPrimary,
            fontStyle: FontStyle.italic,
            height: 1.0,
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 4,
          height: 28,
          margin: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            color: AppTheme.primaryRed,
            borderRadius: BorderRadius.circular(1),
          ),
          transform: Matrix4.rotationZ(-0.15),
        ),
      ],
    );
  }
}