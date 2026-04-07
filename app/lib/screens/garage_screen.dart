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
            _VehicleCard(
              name: 'Ducati Panigale V4S',
              type: 'Motorcycle',
              emoji: '🏍️',
              suspensions: const [
                _SuspInfo('Front: Ohlins NIX30', 'Service due in 800 km', SuspStatus.warning),
                _SuspInfo('Rear: Ohlins TTX36', 'Good', SuspStatus.good),
              ],
              onTap: () => Navigator.pushNamed(context, '/dyno'),
              onServiceHistory: () => Navigator.pushNamed(context, '/service-book'),
              onSetupNotes: () => Navigator.pushNamed(context, '/setup'),
              onBookService: () => Navigator.pushNamed(context, '/book-service'),
            ),
            _VehicleCard(
              name: 'BMW M3 G80',
              type: 'Car',
              emoji: '🚗',
              suspensions: const [
                _SuspInfo('Front: Ohlins R&T', 'Last serviced: Jan 2026', SuspStatus.good),
                _SuspInfo('Rear: Ohlins R&T', 'Good', SuspStatus.good),
              ],
              onTap: () {},
              onServiceHistory: () => Navigator.pushNamed(context, '/service-book'),
              onSetupNotes: () => Navigator.pushNamed(context, '/setup'),
              onBookService: () => Navigator.pushNamed(context, '/book-service'),
            ),
            _VehicleCard(
              name: 'Santa Cruz Megatower',
              type: 'Mountain Bike',
              emoji: '🚲',
              suspensions: const [
                _SuspInfo('Fox 36 + Andreani Cartridge Kit', 'Good', SuspStatus.good),
              ],
              onTap: () {},
              onServiceHistory: () => Navigator.pushNamed(context, '/service-book'),
              onSetupNotes: () => Navigator.pushNamed(context, '/setup'),
              onBookService: () => Navigator.pushNamed(context, '/book-service'),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: AppColors.red),
                label: Text('Add Vehicle', style: GoogleFonts.inter(color: AppColors.red, fontWeight: FontWeight.w700)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(color: AppColors.border, width: 2, style: BorderStyle.solid),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum SuspStatus { good, warning, due }

class _SuspInfo {
  final String label;
  final String status;
  final SuspStatus level;
  const _SuspInfo(this.label, this.status, this.level);
}

class _VehicleCard extends StatelessWidget {
  final String name, type, emoji;
  final List<_SuspInfo> suspensions;
  final VoidCallback onTap, onServiceHistory, onSetupNotes, onBookService;

  const _VehicleCard({
    required this.name,
    required this.type,
    required this.emoji,
    required this.suspensions,
    required this.onTap,
    required this.onServiceHistory,
    required this.onSetupNotes,
    required this.onBookService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700)),
                      Text(type, style: GoogleFonts.inter(fontSize: 11, color: AppColors.textMuted, letterSpacing: 1)),
                    ],
                  ),
                  Text(emoji, style: const TextStyle(fontSize: 40)),
                ],
              ),
              const SizedBox(height: 12),
              ...suspensions.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(s.label, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                    Text(
                      s.level == SuspStatus.warning ? '${s.status} ⚠️' : '${s.status} ✓',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: s.level == SuspStatus.good
                            ? AppColors.green
                            : s.level == SuspStatus.warning
                                ? AppColors.yellow
                                : AppColors.red,
                      ),
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onServiceHistory,
                      child: const Text('History'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onSetupNotes,
                      child: const Text('Setup'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onBookService,
                      child: const Text('Book'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
