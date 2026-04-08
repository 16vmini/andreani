import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBlack,
      body: Stack(
        children: [
          // Carbon fibre texture overlay
          Positioned.fill(child: _CarbonFibreBackground()),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                const AndreaniLogo(),
                const SizedBox(height: 8),
                Text(
                  'Suspension Excellence Since 1987',
                  style: GoogleFonts.poppins(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.1,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _HomeTile(
                          label: 'My Suspension',
                          icon: Icons.settings_input_component,
                          color: AppTheme.primaryRed,
                          onTap: () {},
                        ),
                        _HomeTile(
                          label: 'Book Service',
                          icon: Icons.build_outlined,
                          color: AppTheme.tileGray,
                          onTap: () {},
                        ),
                        _HomeTile(
                          label: 'Dyno Reports',
                          icon: Icons.show_chart,
                          color: AppTheme.tileBlue,
                          onTap: () {},
                        ),
                        _HomeTile(
                          label: 'Öhlins Catalogue',
                          icon: Icons.menu_book_outlined,
                          color: AppTheme.ohlinsGold,
                          isOhlins: true,
                          onTap: () {},
                        ),
                        _HomeTile(
                          label: 'Find Dealer',
                          icon: Icons.location_on_outlined,
                          color: AppTheme.tileGreen,
                          onTap: () {},
                        ),
                        _HomeTile(
                          label: 'Racing Service',
                          icon: Icons.flag_outlined,
                          color: AppTheme.primaryRed,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom badge strip
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.ohlinsGold,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'ÖHLINS\nOFFICIAL PARTNER',
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 16),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '35 ',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            TextSpan(
                              text: 'YEARS',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textSecondary,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool isOhlins;

  const _HomeTile({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.isOhlins = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: isOhlins ? Colors.black : Colors.white,
                size: 36,
              ),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isOhlins ? Colors.black : Colors.white,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CarbonFibreBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarbonFibrePainter(),
    );
  }
}

class _CarbonFibrePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF161616)
      ..style = PaintingStyle.fill;

    canvas.drawRect(Offset.zero & size, paint);

    final tilePaint = Paint()
      ..color = const Color(0xFF1C1C1C)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFF0A0A0A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    const tileSize = 12.0;
    for (double y = 0; y < size.height; y += tileSize) {
      for (double x = 0; x < size.width; x += tileSize) {
        final isOffset = (y / tileSize).floor() % 2 == 0;
        final xPos = isOffset ? x : x + tileSize / 2;
        
        final rect = Rect.fromLTWH(xPos % size.width, y, tileSize - 0.5, tileSize - 0.5);
        canvas.drawRect(rect, tilePaint);
        canvas.drawRect(rect, borderPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}