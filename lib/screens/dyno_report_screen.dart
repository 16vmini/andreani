import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_logo.dart';

class DynoReportScreen extends StatelessWidget {
  const DynoReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DIGITAL DYNO REPORT',
                      style: GoogleFonts.poppins(
                        color: AppTheme.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ducati Panigale V4S',
                      style: GoogleFonts.poppins(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildChart(),
                    const SizedBox(height: 8),
                    // Legend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _LegendItem(color: AppTheme.primaryRed, label: 'COMPRESSION'),
                        const SizedBox(width: 24),
                        _LegendItem(color: const Color(0xFF4A90D9), label: 'REBOUND'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildStatsGrid(),
                    const SizedBox(height: 16),
                    _buildVsFactory(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('SHARE REPORT'),
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
                              'SAVE TO\nMY GARAGE',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Tested: 3 Apr 2026  ·  Pesaro HQ',
                        style: GoogleFonts.poppins(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: const Icon(Icons.arrow_back, color: AppTheme.textPrimary, size: 22),
          ),
          const SizedBox(width: 16),
          const AndreaniLogoSmall(),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 200,
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.cardBorder),
      ),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.transparent,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            getDrawingVerticalLine: (_) => FlLine(color: Colors.white.withOpacity(0.07), strokeWidth: 1),
            getDrawingHorizontalLine: (_) => FlLine(color: Colors.white.withOpacity(0.07), strokeWidth: 1),
          ),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              axisNameWidget: RotatedBox(
                quarterTurns: 3,
                child: Text('FORCE', style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 9, letterSpacing: 1)),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                interval: 200,
                getTitlesWidget: (v, _) => Text(
                  v.toInt().toString(),
                  style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 9),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: Text('VELOCITY', style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 9, letterSpacing: 1)),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 24,
                interval: 100,
                getTitlesWidget: (v, _) => Text(
                  v == 500 ? '${v.toInt()}N' : v.toInt().toString(),
                  style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 9),
                ),
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0, maxX: 500, minY: -600, maxY: 800,
          lineBarsData: [
            // Compression - red
            LineChartBarData(
              spots: const [
                FlSpot(0, 0), FlSpot(100, 150), FlSpot(200, 320),
                FlSpot(300, 500), FlSpot(400, 650), FlSpot(500, 750),
              ],
              isCurved: true,
              color: AppTheme.primaryRed,
              barWidth: 2.5,
              dotData: const FlDotData(show: false),
            ),
            // Rebound - blue
            LineChartBarData(
              spots: const [
                FlSpot(0, 0), FlSpot(100, -100), FlSpot(200, -220),
                FlSpot(300, -380), FlSpot(400, -500), FlSpot(500, -580),
              ],
              isCurved: true,
              color: Color(0xFF4A90D9),
              barWidth: 2.5,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2.2,
      children: const [
        _StatTile(label: 'COMPRESSION HSC', value: '14 clicks'),
        _StatTile(label: 'REBOUND LSR', value: '8 clicks'),
        _StatTile(label: 'SPRING RATE', value: '95 N/mm'),
        _StatTile(label: 'SAG', value: '32mm (30%)'),
      ],
    );
  }

  Widget _buildVsFactory() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.cardBorder),
          bottom: BorderSide(color: AppTheme.cardBorder),
        ),
      ),
      child: Text(
        'vs FACTORY SETTINGS',
        style: GoogleFonts.poppins(
          color: AppTheme.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 20, height: 2, color: color),
        const SizedBox(width: 6),
        Text(label, style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1)),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 9, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
          const SizedBox(height: 2),
          Text(value, style: GoogleFonts.poppins(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}