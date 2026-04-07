import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_app_bar.dart';

class ServiceBookScreen extends StatefulWidget {
  const ServiceBookScreen({super.key});

  @override
  State<ServiceBookScreen> createState() => _ServiceBookScreenState();
}

class _ServiceBookScreenState extends State<ServiceBookScreen> {
  int _selectedVehicle = 0;
  final _vehicles = ['Ducati Panigale V4S', 'BMW M3 G80', 'Santa Cruz MTB'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: andreaniAppBar(context, 'SERVICE BOOK'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle chips
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _vehicles.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final active = i == _selectedVehicle;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedVehicle = i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: active ? AppColors.red : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: active ? AppColors.red : AppColors.border),
                      ),
                      alignment: Alignment.center,
                      child: Text(_vehicles[i], style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: active ? Colors.white : AppColors.textMuted)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('SERVICE HISTORY', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 1)),
            ),
            const SizedBox(height: 16),
            // Timeline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _ServiceEntry(
                    type: '⚠️ Fork Service — Due',
                    date: 'Due by approx. May 2026',
                    centre: 'Recommended: TW Suspension Tech',
                    details: null,
                    dotColor: AppColors.yellow,
                    showBookButton: true,
                    onBook: () => Navigator.pushNamed(context, '/book-service'),
                  ),
                  _ServiceEntry(
                    type: '✅ Fork Rebuild — Complete',
                    date: '3 April 2026',
                    centre: 'Andreani HQ, Pesaro',
                    details: 'Full fork strip, new seals, Andreani gold valve kit installed. Oil: Ohlins #5. Dyno tested post-service.',
                    dotColor: AppColors.green,
                  ),
                  _ServiceEntry(
                    type: '✅ Rear Shock Oil Change',
                    date: '15 January 2026',
                    centre: 'Andreani HQ, Pesaro',
                    details: 'Nitrogen recharge, Ohlins R&T oil. Bladder inspected — OK.',
                    dotColor: AppColors.green,
                  ),
                  _ServiceEntry(
                    type: '✅ Spring Rate Change',
                    date: '28 November 2025',
                    centre: 'TW Suspension Tech, UK',
                    details: 'Rear spring: 95 N/mm → 100 N/mm. Rider weight increase + track use.',
                    dotColor: AppColors.green,
                  ),
                  _ServiceEntry(
                    type: '✅ Initial Setup & Registration',
                    date: '5 August 2025',
                    centre: 'Andreani HQ, Pesaro',
                    details: 'Full Ohlins NIX30/TTX36 install. Baseline dyno report saved. Sag set: 32mm front, 28mm rear.',
                    dotColor: AppColors.green,
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Export button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Text('📄', style: TextStyle(fontSize: 16)),
                label: Text('Export Service Book as PDF', style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceEntry extends StatelessWidget {
  final String type, date, centre;
  final String? details;
  final Color dotColor;
  final bool isLast, showBookButton;
  final VoidCallback? onBook;

  const _ServiceEntry({
    required this.type,
    required this.date,
    required this.centre,
    this.details,
    required this.dotColor,
    this.isLast = false,
    this.showBookButton = false,
    this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line + dot
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.background, width: 3),
                  ),
                ),
                if (!isLast) Expanded(child: Container(width: 2, color: AppColors.border)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(type, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(date, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                  const SizedBox(height: 4),
                  Text(centre, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.gold)),
                  if (details != null) ...[
                    const SizedBox(height: 6),
                    Text(details!, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted, height: 1.5)),
                  ],
                  if (showBookButton) ...[
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: onBook, child: const Text('Book Now')),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
