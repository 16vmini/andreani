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
  int _selectedDate = 3; // Thu 10

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
                  Text('BOOK SERVICE', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1, color: AppColors.textMuted)),
                ],
              ),
            ),
            // Vehicle selection
            _sectionTitle('SELECT VEHICLE'),
            _SelectOption(
              title: '🏍️ Ducati Panigale V4S',
              subtitle: 'Front: Ohlins NIX30 — Service due in 800 km',
              selected: _selectedVehicle == 0,
              onTap: () => setState(() => _selectedVehicle = 0),
            ),
            _SelectOption(
              title: '🚗 BMW M3 G80',
              subtitle: 'All good — last serviced Jan 2026',
              selected: _selectedVehicle == 1,
              onTap: () => setState(() => _selectedVehicle = 1),
            ),
            const SizedBox(height: 12),
            // Service type
            _sectionTitle('SERVICE TYPE'),
            _SelectOption(
              title: 'Fork Rebuild',
              subtitle: 'Full strip, new seals, oil change, dyno test',
              price: 'From €280',
              selected: _selectedService == 0,
              onTap: () => setState(() => _selectedService = 0),
            ),
            _SelectOption(
              title: 'Fork Oil Change',
              subtitle: 'Oil replacement and basic inspection',
              price: 'From €120',
              selected: _selectedService == 1,
              onTap: () => setState(() => _selectedService = 1),
            ),
            _SelectOption(
              title: 'Rear Shock Service',
              subtitle: 'Full service including nitrogen recharge',
              price: 'From €320',
              selected: _selectedService == 2,
              onTap: () => setState(() => _selectedService = 2),
            ),
            _SelectOption(
              title: 'Full Suspension Service',
              subtitle: 'Front + rear, full dyno analysis, setup optimisation',
              price: 'From €550',
              selected: _selectedService == 3,
              onTap: () => setState(() => _selectedService = 3),
            ),
            const SizedBox(height: 12),
            // Date selection
            _sectionTitle('SELECT DATE — TW SUSPENSION TECH'),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _DateCell(day: 'Mon', date: '7', available: false, selected: false, onTap: () {}),
                  _DateCell(day: 'Tue', date: '8', available: false, selected: false, onTap: () {}),
                  _DateCell(day: 'Wed', date: '9', available: true, selected: _selectedDate == 2, onTap: () => setState(() => _selectedDate = 2)),
                  _DateCell(day: 'Thu', date: '10', available: true, selected: _selectedDate == 3, onTap: () => setState(() => _selectedDate = 3)),
                  _DateCell(day: 'Fri', date: '11', available: true, selected: _selectedDate == 4, onTap: () => setState(() => _selectedDate = 4)),
                  _DateCell(day: 'Sat', date: '12', available: false, selected: false, onTap: () {}),
                  _DateCell(day: 'Mon', date: '14', available: true, selected: _selectedDate == 6, onTap: () => setState(() => _selectedDate = 6)),
                  _DateCell(day: 'Tue', date: '15', available: true, selected: _selectedDate == 7, onTap: () => setState(() => _selectedDate = 7)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Confirm button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Booking confirmed! ✅ Fork Rebuild — Thu 10 Apr', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                      backgroundColor: AppColors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                  textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                child: const Text('Confirm Booking — €280'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
      child: Text(text, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 1)),
    );
  }
}

class _SelectOption extends StatelessWidget {
  final String title, subtitle;
  final String? price;
  final bool selected;
  final VoidCallback onTap;

  const _SelectOption({
    required this.title,
    required this.subtitle,
    this.price,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? AppColors.red : AppColors.border, width: selected ? 2 : 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(subtitle, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
            if (price != null) ...[
              const SizedBox(height: 4),
              Text(price!, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.green)),
            ],
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
      child: Container(
        decoration: BoxDecoration(
          color: selected ? AppColors.red : AppColors.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? AppColors.red : AppColors.border),
        ),
        child: Opacity(
          opacity: available ? 1.0 : 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(day, style: GoogleFonts.inter(fontSize: 10, color: AppColors.textMuted)),
              const SizedBox(height: 2),
              Text(date, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}
