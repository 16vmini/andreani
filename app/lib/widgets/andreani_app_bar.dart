import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

PreferredSizeWidget andreaniAppBar(BuildContext context, String title, {bool showBack = true}) {
  return AppBar(
    leading: showBack
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Andreani ',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            color: AppColors.textMuted,
          ),
        ),
      ],
    ),
  );
}
