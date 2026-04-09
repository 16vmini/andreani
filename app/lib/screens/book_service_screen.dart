import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class BookServiceScreen extends StatefulWidget {
  const BookServiceScreen({super.key});

  @override
  State<BookServiceScreen> createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  int _selectedVehicle = 0;
  int _selectedService = 0;
  int _selectedDate = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Andreani',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textPrimary,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(width: 4, height: 26, color: AppColors.red,
                        transform: Matrix4.rotationZ(-0.12)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'BOOK A SERVICE',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      letterSpacing: 0.5,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),

            _sectionLabel('SELECT VEHICLE'),
            _VehicleOption(
              emoji: '🏍️',
              name: 'Ducati Panigale V4S',
              detail: 'Front: Öhlins NIX30',
              warning: 'Service due in 800 km',
              selected: _selectedVehicle == 0,
              onTap: () => setState(() => _selectedVehicle = 0),
            ),
            const SizedBox(height: 8),
            _VehicleOption(
              emoji: '🚗',
              name: 'BMW M3 G80',
              detail: 'Öhlins Road & Track',
              warning: null,
              goodStatus: 'Last serviced Jan 2026',
              selected: _selectedVehicle == 1,
              onTap: () => setState(() => _selectedVehicle = 1),
            ),

            const SizedBox(height: 24),
            _sectionLabel('SERVICE TYPE'),
            _ServiceOption(
              title: 'Fork Rebuild',
              subtitle: 'Full strip, new seals, oil change, dyno test',
              price: '€280',
              selected: _selectedService == 0,
              onTap: () => setState(() => _selectedService = 0),
            ),
            const SizedBox(height: 8),
            _ServiceOption(
              title: 'Fork Oil Change',
              subtitle: 'Oil replacement and basic inspection',
              price: '€120',
              selected: _selectedService == 1,
              onTap: () => setState(() => _selectedService = 1),
            ),
            const SizedBox(height: 8),
            _ServiceOption(
              title: 'Rear Shock Service',
              subtitle: 'Full service including nitrogen recharge',
              price: '€320',
              selected: _selectedService == 2,
              onTap: () => setState(() => _selectedService = 2),
            ),
            const SizedBox(height: 8),
            _ServiceOption(
              title: 'Full Suspension Service',
              subtitle: 'Front + rear, full dyno analysis, setup optimisation',
              price: '€550',
              selected: _selectedService == 3,
              onTap: () => setState(() => _selectedService = 3),
            ),

            const SizedBox(height: 24),
            _sectionLabel('SELECT DATE'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'TW SUSPENSION TECH · PESARO',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _DateCell(day: 'MON', date: '7', available: false, selected: false, onTap: () {}),
                  _DateCell(day: 'TUE', date: '8', available: false, selected: false, onTap: () {}),
                  _DateCell(day: 'WED', date: '9', available: true, selected: _selectedDate == 2, onTap: () => setState(() => _selectedDate = 2)),
                  _DateCell(day: 'THU', date: '10', available: true, selected: _selectedDate == 3, onTap: () => setState(() => _selectedDate = 3)),
                  _DateCell(day: 'FRI', date: '11', available: true, selected: _selectedDate == 4, onTap: () => setState(() => _selectedDate = 4)),
                  _DateCell(day: 'SAT', date: '12', available: false, selected: false, onTap: () {}),
                  _DateCell(day: 'MON', date: '14', available: true, selected: _selectedDate == 6, onTap: () => setState(() => _selectedDate = 6)),
                  _DateCell(day: 'TUE', date: '15', available: true, selected: _selectedDate == 7, onTap: () => setState(() => _selectedDate = 7)),
                ],
              ),
            ),

            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Booking confirmed — Fork Rebuild, Thu 10 Apr ✓',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, decoration: TextDecoration.none),
                      ),
                      backgroundColor: const Color(0xFF1A3A1A),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'CONFIRM BOOKING  ·  €280',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.5,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppColors.textMuted,
          letterSpacing: 2,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

class _VehicleOption extends StatelessWidget {
  final String emoji, name, detail;
  final String? warning, goodStatus;
  final bool selected;
  final VoidCallback onTap;

  const _VehicleOption({
    required this.emoji,
    required this.name,
    required this.detail,
    this.warning,
    this.goodStatus,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.red : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text(emoji, style: const TextStyle(fontSize: 26))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    detail,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textMuted,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  if (warning != null) ...[
                    const SizedBox(height: 4),
                    Row(children: [
                      const Icon(Icons.warning_amber_rounded, size: 14, color: Color(0xFFE8A019)),
                      const SizedBox(width: 4),
                      Text(
                        warning!,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: const Color(0xFFE8A019),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ]),
                  ],
                  if (goodStatus != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      goodStatus!,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: AppColors.textMuted,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle, color: AppColors.red, size: 20),
          ],
        ),
      ),
    );
  }
}

class _ServiceOption extends StatelessWidget {
  final String title, subtitle, price;
  final bool selected;
  final VoidCallback onTap;

  const _ServiceOption({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? AppColors.red.withOpacity(0.08) : AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.red : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textMuted,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              price,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: selected ? AppColors.textPrimary : AppColors.textMuted,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateCell extends StatelessWidget {
  final String day, date;
  final bool available, selected;
  final VoidCallback onTap;

  const _DateCell({
    required this.day,
    required this.date,
    required this.available,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: available ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: selected ? AppColors.red : AppColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.red : AppColors.border,
          ),
        ),
        child: Opacity(
          opacity: available ? 1.0 : 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: GoogleFonts.poppins(
                  fontSize: 9,
                  color: selected ? Colors.white70 : AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
