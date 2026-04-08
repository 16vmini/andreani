import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_logo.dart';

class SetupWizardScreen extends StatefulWidget {
  const SetupWizardScreen({super.key});

  @override
  State<SetupWizardScreen> createState() => _SetupWizardScreenState();
}

class _SetupWizardScreenState extends State<SetupWizardScreen> {
  double preload = 10;
  double compression = 12;
  double rebound = 11;

  // Andreani recommended values
  static const double recPreload = 10;
  static const double recCompression = 12;
  static const double recRebound = 11;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildVehicleProfile(),
                    const SizedBox(height: 16),
                    _buildStepBreadcrumb(),
                    const SizedBox(height: 20),
                    _buildSetupSection(),
                    const SizedBox(height: 24),
                    _buildRecommendedValues(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Save Setup'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.textPrimary,
                              side: const BorderSide(color: Color(0xFF444444)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              'Compare to\nPro Settings',
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 13),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Based on Andreani racing data\nfrom 1000+ track sessions',
                      style: GoogleFonts.poppins(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: const AndreaniLogoSmall(),
    );
  }

  Widget _buildVehicleProfile() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text('🏍️', style: TextStyle(fontSize: 28)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yamaha R1 2024',
                  style: GoogleFonts.poppins(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _ProfileChip(label: 'Weight', value: '82 kg'),
                    const SizedBox(width: 16),
                    _ProfileChip(label: 'Riding Style', value: 'Sport/Track'),
                  ],
                ),
                const SizedBox(height: 4),
                _ProfileChip(label: 'Experience', value: 'Advanced'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepBreadcrumb() {
    return Container(
      height: 34,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF252525),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              border: Border.all(color: AppTheme.cardBorder),
            ),
            child: Center(
              child: Text(
                'Start',
                style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 13),
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: AppTheme.textSecondary, size: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppTheme.primaryRed,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: Center(
                child: Text(
                  'Front Fork Setup',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSetupSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Fork diagram
        Container(
          width: 70,
          height: 200,
          decoration: BoxDecoration(
            color: AppTheme.cardDark,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.cardBorder),
          ),
          child: const Center(
            child: _ForkDiagram(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SetupSlider(
                label: 'Preload',
                value: preload,
                min: 0, max: 20,
                unit: 'mm',
                onChanged: (v) => setState(() => preload = v),
              ),
              const SizedBox(height: 16),
              _SetupSlider(
                label: 'Compression',
                value: compression,
                min: 0, max: 20,
                unit: 'click',
                onChanged: (v) => setState(() => compression = v),
              ),
              const SizedBox(height: 16),
              _SetupSlider(
                label: 'Rebound',
                value: rebound,
                min: 0, max: 20,
                unit: 'click',
                onChanged: (v) => setState(() => rebound = v),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedValues() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended values',
          style: GoogleFonts.poppins(
            color: AppTheme.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        _RecommendedRow(label: '${recPreload.toInt()} mm', max: 20, value: recPreload, suffix: '10 m'),
        const SizedBox(height: 8),
        _RecommendedRow(label: 'Compression', max: 20, value: recCompression, suffix: '12 click'),
        const SizedBox(height: 8),
        _RecommendedRow(label: 'Rebound', max: 20, value: recRebound, suffix: '11 click'),
      ],
    );
  }
}

class _ProfileChip extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$label  ', style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 11)),
        Text(value, style: GoogleFonts.poppins(color: AppTheme.textPrimary, fontSize: 11, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _SetupSlider extends StatelessWidget {
  final String label;
  final double value;
  final double min, max;
  final String unit;
  final ValueChanged<double> onChanged;

  const _SetupSlider({
    required this.label, required this.value,
    required this.min, required this.max,
    required this.unit, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 13)),
            Text(
              '${value.round()} $unit',
              style: GoogleFonts.poppins(color: AppTheme.statusGood, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppTheme.primaryRed,
            inactiveTrackColor: const Color(0xFF333333),
            thumbColor: AppTheme.primaryRed,
            overlayColor: AppTheme.primaryRed.withOpacity(0.15),
            trackHeight: 3,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
          ),
          child: Slider(value: value, min: min, max: max, divisions: max.toInt(), onChanged: onChanged),
        ),
      ],
    );
  }
}

class _RecommendedRow extends StatelessWidget {
  final String label;
  final double value;
  final double max;
  final String suffix;

  const _RecommendedRow({required this.label, required this.value, required this.max, required this.suffix});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 12),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppTheme.primaryRed.withOpacity(0.6),
              inactiveTrackColor: const Color(0xFF2A2A2A),
              thumbColor: AppTheme.primaryRed,
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(value: value, min: 0, max: max, onChanged: (_) {}),
          ),
        ),
        SizedBox(
          width: 52,
          child: Text(
            suffix,
            style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 11),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _ForkDiagram extends StatelessWidget {
  const _ForkDiagram();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(50, 160),
      painter: _ForkPainter(),
    );
  }
}

class _ForkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF555555)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final redPaint = Paint()
      ..color = AppTheme.primaryRed
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final cx = size.width / 2;

    // Main fork tube (outer)
    canvas.drawLine(Offset(cx - 8, 10), Offset(cx - 8, size.height - 20), paint);
    canvas.drawLine(Offset(cx + 8, 10), Offset(cx + 8, size.height - 20), paint);

    // Spring section (red coil)
    for (int i = 0; i < 6; i++) {
      final y1 = 20.0 + i * 14;
      final y2 = y1 + 7;
      canvas.drawLine(Offset(cx - 8, y1), Offset(cx + 8, y2), redPaint);
      canvas.drawLine(Offset(cx + 8, y2), Offset(cx - 8, y2 + 7), redPaint);
    }

    // Bottom cap
    canvas.drawLine(Offset(cx - 12, size.height - 20), Offset(cx + 12, size.height - 20), paint);
    canvas.drawLine(Offset(cx - 8, size.height - 20), Offset(cx - 8, size.height - 5), paint);
    canvas.drawLine(Offset(cx + 8, size.height - 20), Offset(cx + 8, size.height - 5), paint);
    canvas.drawLine(Offset(cx - 12, size.height - 5), Offset(cx + 12, size.height - 5), paint);

    // Adjustment dots
    final dotPaint = Paint()..color = AppTheme.primaryRed..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, 10), 5, dotPaint);
    canvas.drawCircle(Offset(cx, size.height - 5), 5, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}