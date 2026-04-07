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
  int _activeStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: andreaniAppBar(context, 'SETUP WIZARD'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bike info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text('🏍️', style: TextStyle(fontSize: 50)),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Yamaha R1 2024', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text('Weight ', style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                          Text('82 kg', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 16),
                          Text('Style ', style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                          Text('Sport/Track', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('Experience: Advanced', style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Steps
            Row(
              children: [
                _StepTab(label: 'Start', active: _activeStep == 0, done: _activeStep > 0, onTap: () => setState(() => _activeStep = 0)),
                _StepTab(label: 'Front Fork Setup', active: _activeStep == 1, done: _activeStep > 1, onTap: () => setState(() => _activeStep = 1)),
                _StepTab(label: 'Rear Shock', active: _activeStep == 2, done: false, onTap: () => setState(() => _activeStep = 2)),
              ],
            ),
            const SizedBox(height: 20),
            // Sliders
            _buildSlider('Preload', _preload, 0, 20, 'mm', (v) => setState(() => _preload = v)),
            _buildSlider('Compression', _compression, 0, 25, 'click', (v) => setState(() => _compression = v)),
            _buildSlider('Rebound', _rebound, 0, 25, 'click', (v) => setState(() => _rebound = v)),
            const SizedBox(height: 8),
            // Recommended values
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('RECOMMENDED VALUES', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.green, letterSpacing: 1)),
                  const SizedBox(height: 8),
                  _recRow('Preload', '12 mm'),
                  _recRow('Compression', '12 click'),
                  _recRow('Rebound', '11 click'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () {}, child: const Text('Save Setup'))),
                  const SizedBox(width: 10),
                  Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Compare to Pro'))),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                'Based on Andreani racing data from 1,000+ track sessions',
                style: GoogleFonts.inter(fontSize: 11, color: AppColors.textMuted),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max, String unit, ValueChanged<double> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('${value.round()}', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.red)),
                  const SizedBox(width: 4),
                  Text(unit, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                ],
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
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 11, elevation: 0),
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
      ),
    );
  }

  Widget _recRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textMuted)),
          Text(value, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.green)),
        ],
      ),
    );
  }
}

class _StepTab extends StatelessWidget {
  final String label;
  final bool active, done;
  final VoidCallback onTap;
  const _StepTab({required this.label, required this.active, required this.done, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: active ? AppColors.red : done ? AppColors.green : AppColors.border,
                width: 3,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: active ? AppColors.red : done ? AppColors.green : AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
