import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_app_bar.dart';

class SetupWizardScreen extends StatefulWidget {
  const SetupWizardScreen({super.key});

  @override
  State<SetupWizardScreen> createState() => _SetupWizardScreenState();
}

class _SetupWizardScreenState extends State<SetupWizardScreen> {
  double _preload = 10;
  double _compression = 12;
  double _rebound = 11;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: andreaniAppBar(context, 'GROUP'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bike info row — thumbnail + details (matching mockup)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
              child: Row(
                children: [
                  // Bike thumbnail — real image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/ducati.jpg',
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Yamaha R1 2024', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            _InfoLabel('Weight', '82 kg'),
                            const SizedBox(width: 24),
                            _InfoLabel('Riding Style', 'Sport/Track'),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            _InfoLabel('Experience', 'Advanced'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Step breadcrumbs — "Start > Front Fork Setup" (matching mockup)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('Start', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textMuted)),
                  ),
                  Text(' › ', style: GoogleFonts.inter(fontSize: 16, color: AppColors.textMuted)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF222222),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text('Front Fork Setup', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Fork diagram + sliders section (matching mockup layout)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fork illustration — left side
                  SizedBox(
                    width: 80,
                    height: 220,
                    child: CustomPaint(painter: _ForkDiagramPainter()),
                  ),
                  const SizedBox(width: 12),
                  // Sliders — right side
                  Expanded(
                    child: Column(
                      children: [
                        _SliderRow(
                          label: 'Preload',
                          value: _preload,
                          min: 0, max: 20,
                          unit: 'mm',
                          onChanged: (v) => setState(() => _preload = v),
                        ),
                        const SizedBox(height: 16),
                        _SliderRow(
                          label: 'Compression',
                          value: _compression,
                          min: 0, max: 25,
                          unit: 'click',
                          onChanged: (v) => setState(() => _compression = v),
                        ),
                        const SizedBox(height: 16),
                        _SliderRow(
                          label: 'Rebound',
                          value: _rebound,
                          min: 0, max: 25,
                          unit: 'click',
                          onChanged: (v) => setState(() => _rebound = v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recommended values section (matching mockup)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'Recommended values',
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textMuted),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _RecSlider(label: 'Compression', value: 12, max: 25, unit: 'click'),
                  const SizedBox(height: 8),
                  _RecSlider(label: 'Rebound', value: 11, max: 25, unit: 'click'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Buttons — Save Setup (red) + Compare to Pro (outlined)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      child: const Text('Save Setup'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      child: const Text('Compare to\nPro Settings', textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Footer note
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Based on Andreani racing data\nfrom 1,000+ track sessions',
                style: GoogleFonts.inter(fontSize: 11, color: AppColors.textMuted, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoLabel extends StatelessWidget {
  final String label, value;
  const _InfoLabel(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
        const SizedBox(width: 6),
        Text(value, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
      ],
    );
  }
}

class _SliderRow extends StatelessWidget {
  final String label, unit;
  final double value, min, max;
  final ValueChanged<double> onChanged;

  const _SliderRow({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textMuted)),
            Text(
              '${value.round()} $unit',
              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.green),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: AppColors.red,
            inactiveTrackColor: AppColors.border,
            thumbColor: AppColors.red,
            overlayColor: AppColors.red.withAlpha(30),
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8, elevation: 0),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: (max - min).round(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class _RecSlider extends StatelessWidget {
  final String label, unit;
  final double value, max;
  const _RecSlider({required this.label, required this.value, required this.max, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${value.round()} $unit', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.red)),
        const SizedBox(width: 8),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: AppColors.red,
              inactiveTrackColor: AppColors.border,
              thumbColor: AppColors.red,
              overlayColor: Colors.transparent,
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6, elevation: 0),
            ),
            child: Slider(value: value, min: 0, max: max, onChanged: null),
          ),
        ),
        Text('${max.round()} $unit', style: GoogleFonts.inter(fontSize: 11, color: AppColors.textMuted)),
      ],
    );
  }
}

/// Custom painter for the fork diagram illustration (matching mockup's technical drawing)
class _ForkDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.textMuted
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final cx = size.width / 2;
    final h = size.height;

    // Upper tube
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(cx - 8, 0, 16, h * 0.45), const Radius.circular(4)),
      paint,
    );

    // Lower tube (wider)
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(cx - 12, h * 0.4, 24, h * 0.55), const Radius.circular(6)),
      paint,
    );

    // Adjustment knobs (red dots — compression/rebound points)
    final knobPaint = Paint()..color = AppColors.red..style = PaintingStyle.fill;
    // Top knob (preload)
    canvas.drawCircle(Offset(cx + 18, h * 0.08), 5, knobPaint);
    // Middle knob (compression)
    canvas.drawCircle(Offset(cx + 22, h * 0.48), 5, knobPaint);
    // Bottom knob (rebound)
    canvas.drawCircle(Offset(cx + 22, h * 0.78), 5, knobPaint);

    // Connection lines from knobs
    final linePaint = Paint()
      ..color = AppColors.red.withAlpha(100)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(cx + 8, h * 0.08), Offset(cx + 13, h * 0.08), linePaint);
    canvas.drawLine(Offset(cx + 12, h * 0.48), Offset(cx + 17, h * 0.48), linePaint);
    canvas.drawLine(Offset(cx + 12, h * 0.78), Offset(cx + 17, h * 0.78), linePaint);

    // Spring coil inside upper tube
    final springPaint = Paint()
      ..color = AppColors.textMuted.withAlpha(120)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final springPath = Path();
    const coils = 6;
    final coilStart = h * 0.06;
    final coilEnd = h * 0.38;
    final coilH = (coilEnd - coilStart) / coils;
    springPath.moveTo(cx, coilStart);
    for (var i = 0; i < coils; i++) {
      final y1 = coilStart + i * coilH + coilH * 0.5;
      final y2 = coilStart + (i + 1) * coilH;
      springPath.lineTo(i.isEven ? cx + 5 : cx - 5, y1);
      springPath.lineTo(cx, y2);
    }
    canvas.drawPath(springPath, springPaint);

    // Axle circle at bottom
    canvas.drawCircle(Offset(cx, h * 0.92), 6, paint);
    final axleFill = Paint()..color = AppColors.textMuted.withAlpha(50)..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, h * 0.92), 6, axleFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
