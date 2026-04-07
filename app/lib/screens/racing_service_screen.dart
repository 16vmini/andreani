import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class RacingServiceScreen extends StatelessWidget {
  const RacingServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Row(
                children: [
                  Text('Andreani ', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                  Text('RACING SERVICE', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1, color: AppColors.textMuted)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('2026 RACE CALENDAR', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 1)),
            ),
            const SizedBox(height: 12),
            const _RaceCard(
              month: 'Apr', day: '18',
              series: 'WORLD SUPERBIKE',
              name: 'Assen — Dutch Round',
              location: 'TT Circuit Assen, Netherlands',
              availability: 'Slots available',
              availColor: AppColors.green,
              buttonLabel: 'Request',
            ),
            const _RaceCard(
              month: 'May', day: '9',
              series: 'WORLD SUPERBIKE',
              name: 'Misano — Italian Round',
              location: 'Misano World Circuit, Italy',
              availability: '2 slots remaining',
              availColor: AppColors.yellow,
              buttonLabel: 'Request',
            ),
            const _RaceCard(
              month: 'May', day: '23',
              series: 'BSB',
              name: 'Donington Park — Round 4',
              location: 'Donington Park, UK',
              availability: 'Slots available',
              availColor: AppColors.green,
              buttonLabel: 'Request',
            ),
            const _RaceCard(
              month: 'Jun', day: '14',
              series: 'MX WORLD CHAMPIONSHIP',
              name: 'MXGP of Germany',
              location: 'Teutschenthal, Germany',
              availability: 'Fully booked',
              availColor: AppColors.red,
              buttonLabel: 'Waitlist',
              disabled: true,
            ),
            const _RaceCard(
              month: 'Jul', day: '5',
              series: 'ENDURO WORLD',
              name: 'EnduroGP — Round 5',
              location: 'Santiago de Compostela, Spain',
              availability: 'Slots available',
              availColor: AppColors.green,
              buttonLabel: 'Request',
            ),
          ],
        ),
      ),
    );
  }
}

class _RaceCard extends StatelessWidget {
  final String month, day, series, name, location, availability, buttonLabel;
  final Color availColor;
  final bool disabled;

  const _RaceCard({
    required this.month,
    required this.day,
    required this.series,
    required this.name,
    required this.location,
    required this.availability,
    required this.availColor,
    required this.buttonLabel,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(month, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1, color: Colors.white.withAlpha(200))),
                Text(day, style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          const SizedBox(width: 14),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(series, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.gold, letterSpacing: 0.5)),
                const SizedBox(height: 2),
                Text(name, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                Text('📍 $location', style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(width: 8, height: 8, decoration: BoxDecoration(color: availColor, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text(availability, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: availColor)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: disabled ? AppColors.border : AppColors.red,
              foregroundColor: disabled ? AppColors.textMuted : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              minimumSize: Size.zero,
              textStyle: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700),
            ),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}
