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
            // Title — large bold, matching mockup
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
              child: Text(
                'SUSPENSION DYNO REPORT',
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: -0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: Text(
                'Ducati Panigale V4S',
                style: GoogleFonts.inter(fontSize: 14, color: AppColors.textMuted),
              ),
            ),

            // Chart — force vs velocity with axis labels (matching mockup)
            _buildChart(),
            const SizedBox(height: 16),

            // Stats grid — 2x2 boxes matching mockup layout
            _buildStatsGrid(),
            const SizedBox(height: 12),

            // VS Factory Settings button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.border)),
                ),
                child: Center(
                  child: Text(
                    'VS FACTORY SETTINGS',
                    style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textMuted, letterSpacing: 1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Action buttons — Share (red) + Save (outlined), matching mockup
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
                      child: const Text('SHARE REPORT'),
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
                      child: const Text('SAVE TO\nMY GARAGE', textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Footer
            Center(
              child: Text(
                'Tested: 3 Apr 2026  •  Pesaro HQ',
                style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Chart matching mockup: FORCE (y-axis, -600 to 800) vs VELOCITY (x-axis, 100 to 500N)
  /// Red = compression, Blue = rebound. Curves go into negative territory.
  Widget _buildChart() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Y-axis label
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text('FORCE', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 1)),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 220,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 200,
                  verticalInterval: 100,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: value == 0 ? AppColors.textMuted.withAlpha(80) : AppColors.border.withAlpha(100),
                    strokeWidth: value == 0 ? 1.0 : 0.5,
                    dashArray: value == 0 ? null : [4, 4],
                  ),
                  getDrawingVerticalLine: (value) => FlLine(
                    color: AppColors.border.withAlpha(100),
                    strokeWidth: 0.5,
                    dashArray: [4, 4],
                  ),
                ),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 200,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: GoogleFonts.inter(fontSize: 9, color: AppColors.textMuted),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      interval: 100,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            '${value.toInt()}',
                            style: GoogleFonts.inter(fontSize: 9, color: AppColors.textMuted),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  // Compression curve (red) — starts low-left, curves up to top-right
                  LineChartBarData(
                    spots: _compressionSpots(),
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: AppColors.red,
                    barWidth: 2.5,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                  // Rebound curve (blue) — similar shape, slightly below compression
                  LineChartBarData(
                    spots: _reboundSpots(),
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: AppColors.blue,
                    barWidth: 2.5,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                minX: 0,
                maxX: 500,
                minY: -600,
                maxY: 800,
                lineTouchData: const LineTouchData(enabled: false),
              ),
            ),
          ),
          // X-axis label + legend
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('VELOCITY', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 1)),
                Row(
                  children: [
                    Container(width: 16, height: 3, color: AppColors.red),
                    const SizedBox(width: 4),
                    Text('COMPRESSION', style: GoogleFonts.inter(fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.textMuted)),
                    const SizedBox(width: 12),
                    Container(width: 16, height: 3, color: AppColors.blue),
                    const SizedBox(width: 4),
                    Text('REBOUND', style: GoogleFonts.inter(fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.textMuted)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Compression curve data — matches the mockup shape (starting negative, curving up)
  List<FlSpot> _compressionSpots() {
    final spots = <FlSpot>[];
    for (var i = 0; i <= 50; i++) {
      final t = i / 50.0;
      final x = t * 500;
      // Starts around -300, curves through 0, then up to ~750
      final y = -300.0 + 1100.0 * math.pow(t, 0.55).toDouble();
      spots.add(FlSpot(x, y));
    }
    return spots;
  }

  /// Rebound curve data — similar but slightly less aggressive
  List<FlSpot> _reboundSpots() {
    final spots = <FlSpot>[];
    for (var i = 0; i <= 50; i++) {
      final t = i / 50.0;
      final x = t * 500;
      final y = -250.0 + 900.0 * math.pow(t, 0.5).toDouble();
      spots.add(FlSpot(x, y));
    }
    return spots;
  }

  /// 2x2 stat boxes matching mockup exactly
  Widget _buildStatsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _StatBox(label: 'COMPRESSION HSC', value: '14', unit: 'clicks')),
              const SizedBox(width: 10),
              Expanded(child: _StatBox(label: 'REBOUND LSR', value: '8', unit: 'clicks')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _StatBox(label: 'SPRING RATE', value: '95', unit: 'N/mm')),
              const SizedBox(width: 10),
              Expanded(child: _StatBox(label: 'SAG', value: '32mm', unit: '(30%)')),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label, value, unit;
  const _StatBox({required this.label, required this.value, required this.unit});

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
        children: [
          Text(label, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 0.5)),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w800)),
              const SizedBox(width: 4),
              Text(unit, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textMuted, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}
