import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_app_bar.dart';

class GarageScreen extends StatelessWidget {
  const GarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: andreaniAppBar(context, 'MY GARAGE'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            const SizedBox(height: 4),
            _VehicleCard(
              name: 'Ducati Panigale V4S',
              frontLabel: 'Front: Öhlins NIX30',
              frontStatus: 'Service due in 800 km',
              frontWarning: true,
              rearLabel: 'Rear: Öhlins TTX36',
              rearStatus: 'Good',
              rearWarning: false,
              imagePath: 'assets/images/ducati.jpg',
              onTap: () => Navigator.pushNamed(context, '/dyno'),
              onServiceHistory: () => Navigator.pushNamed(context, '/service-book'),
              onSetupNotes: () => Navigator.pushNamed(context, '/setup'),
              onBookService: () => Navigator.pushNamed(context, '/book-service'),
            ),
            _VehicleCard(
              name: 'BMW M3 G80',
              frontLabel: 'Front: Öhlins R&T',
              frontStatus: 'Last serviced: Jan 2026',
              frontWarning: false,
              rearLabel: 'Rear: Öhlins R&T',
              rearStatus: 'Good',
              rearWarning: false,
              imagePath: 'assets/images/bmw_m3.jpg',
              onTap: () {},
              onServiceHistory: () => Navigator.pushNamed(context, '/service-book'),
              onSetupNotes: () => Navigator.pushNamed(context, '/setup'),
              onBookService: () => Navigator.pushNamed(context, '/book-service'),
            ),
            _VehicleCard(
              name: 'Santa Cruz Megatower MTB',
              frontLabel: 'Fox 33 with Andreani',
              frontStatus: 'Cartridge Kit',
              frontWarning: false,
              rearLabel: null,
              rearStatus: null,
              rearWarning: false,
              imagePath: 'assets/images/mtb.jpg',
              onTap: () {},
              onServiceHistory: () => Navigator.pushNamed(context, '/service-book'),
              onSetupNotes: () => Navigator.pushNamed(context, '/setup'),
              onBookService: () => Navigator.pushNamed(context, '/book-service'),
            ),
            const SizedBox(height: 12),
            // Add Vehicle button — matching mockup's red + centered style
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 18),
                label: Text('Add Vehicle', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(46),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VehicleCard extends StatelessWidget {
  final String name;
  final String frontLabel, frontStatus;
  final bool frontWarning;
  final String? rearLabel, rearStatus;
  final bool rearWarning;
  final String imagePath;
  final VoidCallback onTap, onServiceHistory, onSetupNotes, onBookService;

  const _VehicleCard({
    required this.name,
    required this.frontLabel,
    required this.frontStatus,
    required this.frontWarning,
    this.rearLabel,
    this.rearStatus,
    required this.rearWarning,
    required this.imagePath,
    required this.onTap,
    required this.onServiceHistory,
    required this.onSetupNotes,
    required this.onBookService,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: text left, image right (matching mockup layout)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: name + suspension info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      // Front suspension
                      Text(frontLabel, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textMuted)),
                      Row(
                        children: [
                          Text(
                            frontStatus,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: frontWarning ? AppColors.yellow : AppColors.green,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            frontWarning ? '⚠' : '✓',
                            style: TextStyle(fontSize: 13, color: frontWarning ? AppColors.yellow : AppColors.green),
                          ),
                        ],
                      ),
                      if (rearLabel != null) ...[
                        const SizedBox(height: 6),
                        Text(rearLabel!, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textMuted)),
                        Row(
                          children: [
                            Text(
                              rearStatus ?? 'Good',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: rearWarning ? AppColors.yellow : AppColors.green,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text('✓', style: TextStyle(fontSize: 13, color: AppColors.green)),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                // Right: actual vehicle photo (matching mockup)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    width: 110,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Bottom action buttons — matching mockup's 3-button row
            Row(
              children: [
                _ActionButton(label: 'Service History', onTap: onServiceHistory),
                const SizedBox(width: 8),
                _ActionButton(label: 'Setup Notes', onTap: onSetupNotes),
                const SizedBox(width: 8),
                _ActionButton(label: 'Book Service', onTap: onBookService),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _ActionButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
