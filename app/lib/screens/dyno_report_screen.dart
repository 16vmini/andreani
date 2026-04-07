import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_app_bar.dart';

class DynoReportScreen extends StatelessWidget {
  const DynoReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: andreaniAppBar(context, 'DYNO REPORT'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SUSPENSION DYNO REPORT', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  Text('Ducati Panigale V4S — Front Fork', style: GoogleFonts.inter(fontSize: 13, color: AppColors.textMuted)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Chart
            _buildChart(),
            const SizedBox(height: 16),
            // Stats grid
            _buildStats(),
            const SizedBox(height: 16),
            // Factory comparison button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                child: const Text('VS FACTORY SETTINGS'),
              ),
            ),
            const SizedBox(height: 16),
            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('SHARE REPORT'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('SAVE TO MY GARAGE'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                'Tested: 3 Apr 2026 • Pesaro HQ',
                style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FORCE VS VELOCITY',
            style: GoogleFonts.inter(fontSize: 11, color: AppColors.textMuted, letterSpacing: 1, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) => FlLine(color: AppColors.border, strokeWidth: 0.5),
                  getDrawingVerticalLine: (value) => FlLine(color: AppColors.border, strokeWidth: 0.5),
                ),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  // Compression (red)
                  LineChartBarData(
                    spots: List.generate(20, (i) {
                      final t = i / 19.0;
                      return FlSpot(t * 500, _compCurve(t) * 800);
                    }),
                    isCurved: true,
                    color: AppColors.red,
                    barWidth: 2.5,
                    dotData: const FlDotData(show: false),
                  ),
                  // Rebound (blue)
                  LineChartBarData(
                    spots: List.generate(20, (i) {
                      final t = i / 19.0;
                      return FlSpot(t * 500, _rebCurve(t) * 800);
                    }),
                    isCurved: true,
                    color: AppColors.blue,
                    barWidth: 2.5,
                    dotData: const FlDotData(show: false),
                  ),
                ],
                minX: 0, maxX: 500,
                minY: 0, maxY: 800,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _LegendDot(color: AppColors.red, label: 'Compression'),
              const SizedBox(width: 20),
              _LegendDot(color: AppColors.blue, label: 'Rebound'),
            ],
          ),
        ],
      ),
    );
  }

  static double _compCurve(double t) => 0.1 * t + 0.85 * math.pow(t, 0.6);
  static double _rebCurve(double t) => 0.05 * t + 0.75 * math.pow(t, 0.55);

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          _StatCard(label: 'COMPRESSION HSC', value: '14', unit: 'clicks'),
          _StatCard(label: 'REBOUND LSR', value: '8', unit: 'clicks'),
          _StatCard(label: 'SPRING RATE', value: '95', unit: 'N/mm'),
          _StatCard(label: 'SAG', value: '32mm', unit: '(30%)'),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label, value, unit;
  const _StatCard({required this.label, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 10, color: AppColors.textMuted, letterSpacing: 1, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(width: 4),
              Text(unit, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textMuted)),
            ],
          ),
        ],
      ),
    );
  }
}
