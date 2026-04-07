import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class CourseBookingScreen extends StatelessWidget {
  const CourseBookingScreen({super.key});

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
                  Text('COURSES', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1, color: AppColors.textMuted)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('UPCOMING COURSES', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 1)),
            ),
            const SizedBox(height: 12),
            _CourseCard(
              emoji: '🏍️',
              bannerColor: const Color(0xFF2d1015),
              name: 'Motorcycle Suspension Fundamentals',
              date: '12–14 May 2026',
              location: 'Pesaro, Italy',
              price: '€1,200',
              spots: '4 spots left',
              level: 'Beginner',
              levelColor: AppColors.green,
            ),
            _CourseCard(
              emoji: '🔧',
              bannerColor: const Color(0xFF1a1a1a),
              name: 'Advanced Valving & Dyno Tuning',
              date: '2–4 Jun 2026',
              location: 'Pesaro, Italy',
              price: '€1,800',
              spots: '2 spots left',
              level: 'Advanced',
              levelColor: AppColors.gold,
            ),
            _CourseCard(
              emoji: '🚗',
              bannerColor: const Color(0xFF1a2332),
              name: 'Car Coilover Setup & Damping',
              date: '18–19 Jun 2026',
              location: 'Charlotte, USA',
              price: '\$1,500',
              spots: '8 spots left',
              level: 'Beginner',
              levelColor: AppColors.green,
            ),
            _CourseCard(
              emoji: '🚲',
              bannerColor: const Color(0xFF2d2010),
              name: 'MTB Suspension Masterclass',
              date: '8–9 Jul 2026',
              location: 'Pesaro, Italy',
              price: '€900',
              spots: '12 spots left',
              level: 'Pro',
              levelColor: AppColors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String emoji, name, date, location, price, spots, level;
  final Color bannerColor, levelColor;

  const _CourseCard({
    required this.emoji,
    required this.bannerColor,
    required this.name,
    required this.date,
    required this.location,
    required this.price,
    required this.spots,
    required this.level,
    required this.levelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            height: 90,
            width: double.infinity,
            color: bannerColor,
            child: Stack(
              children: [
                Center(child: Text(emoji, style: const TextStyle(fontSize: 40))),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: levelColor, borderRadius: BorderRadius.circular(6)),
                    child: Text(level, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: levelColor == AppColors.red ? Colors.white : const Color(0xFF0D0D0D), letterSpacing: 0.5)),
                  ),
                ),
              ],
            ),
          ),
          // Info
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('📅 $date', style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                    const SizedBox(width: 14),
                    Text('📍 $location', style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(price, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.green)),
                        Text(spots, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.yellow)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
