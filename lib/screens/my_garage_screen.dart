import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_logo.dart';

class MyGarageScreen extends StatelessWidget {
  const MyGarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBlack,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _VehicleCard(
                    name: 'Ducati Panigale V4S',
                    frontSuspension: 'Öhlins NIX30',
                    rearSuspension: 'Öhlins TTX36',
                    frontStatus: 'Service due in 800 km',
                    frontStatusBad: true,
                    rearStatus: 'Good',
                    rearStatusBad: false,
                    vehicleEmoji: '🏍️',
                    vehicleColor: const Color(0xFFCC0000),
                  ),
                  const SizedBox(height: 12),
                  _VehicleCard(
                    name: 'BMW M3 G80',
                    frontSuspension: 'Öhlins R&T',
                    rearSuspension: 'Öhlins R&T',
                    frontStatus: 'Last serviced: Jan 2026',
                    frontStatusBad: false,
                    rearStatus: 'Good',
                    rearStatusBad: false,
                    vehicleEmoji: '🚗',
                    vehicleColor: const Color(0xFF1A1A2E),
                  ),
                  const SizedBox(height: 12),
                  _VehicleCard(
                    name: 'Santa Cruz Megatower MTB',
                    frontSuspension: 'Fox 33 with Andreani',
                    rearSuspension: 'Cartridge Kit',
                    frontStatus: 'Good',
                    frontStatusBad: false,
                    rearStatus: 'Good',
                    rearStatusBad: false,
                    vehicleEmoji: '🚵',
                    vehicleColor: const Color(0xFF8B1A1A),
                  ),
                  const SizedBox(height: 20),
                  // Add Vehicle button
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.primaryRed, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: AppTheme.primaryRed),
                      label: Text(
                        'Add Vehicle',
                        style: GoogleFonts.poppins(
                          color: AppTheme.primaryRed,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size(double.infinity, 0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          const AndreaniLogoSmall(),
          const SizedBox(width: 12),
          Text(
            'MY GARAGE',
            style: GoogleFonts.poppins(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _VehicleCard extends StatelessWidget {
  final String name;
  final String frontSuspension;
  final String rearSuspension;
  final String frontStatus;
  final bool frontStatusBad;
  final String rearStatus;
  final bool rearStatusBad;
  final String vehicleEmoji;
  final Color vehicleColor;

  const _VehicleCard({
    required this.name,
    required this.frontSuspension,
    required this.rearSuspension,
    required this.frontStatus,
    required this.frontStatusBad,
    required this.rearStatus,
    required this.rearStatusBad,
    required this.vehicleEmoji,
    required this.vehicleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.cardBorder, width: 1),
      ),
      child: Column(
        children: [
          // Vehicle name + image
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          color: AppTheme.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _StatusRow(label: 'Front: $frontSuspension', status: frontStatus, isBad: frontStatusBad),
                      const SizedBox(height: 4),
                      _StatusRow(label: 'Rear: $rearSuspension', status: rearStatus, isBad: rearStatusBad),
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  height: 70,
                  decoration: BoxDecoration(
                    color: vehicleColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      vehicleEmoji,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Action buttons
          const SizedBox(height: 12),
          const Divider(color: AppTheme.cardBorder, height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                _ActionBtn(label: 'Service History', onTap: () {}),
                const SizedBox(width: 8),
                _ActionBtn(label: 'Setup Notes', onTap: () {}),
                const SizedBox(width: 8),
                _ActionBtn(label: 'Book Service', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String label;
  final String status;
  final bool isBad;

  const _StatusRow({required this.label, required this.status, required this.isBad});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppTheme.textSecondary,
            fontSize: 12,
          ),
        ),
        Row(
          children: [
            Text(
              status,
              style: GoogleFonts.poppins(
                color: isBad ? AppTheme.serviceWarning : AppTheme.statusGood,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              isBad ? Icons.warning_amber_rounded : Icons.check_circle,
              color: isBad ? AppTheme.serviceWarning : AppTheme.statusGood,
              size: 14,
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ActionBtn({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xFF252525),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF333333), width: 1),
          ),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: AppTheme.textPrimary,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}