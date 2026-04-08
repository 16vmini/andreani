import 'dart:math' as math;
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
                        _HomeTileCustom(
                          label: 'My Suspension',
                          color: AppTheme.primaryRed,
                          child: CustomPaint(size: const Size(48, 48), painter: _SpringIconPainter()),
                          onTap: () {},
                        ),
                        _HomeTileCustom(
                          label: 'Book Service',
                          color: AppTheme.tileGray,
                          child: CustomPaint(size: const Size(48, 48), painter: _SpannerIconPainter()),
                          onTap: () {},
                        ),
                        _HomeTileCustom(
                          label: 'Dyno Reports',
                          color: AppTheme.tileBlue,
                          child: CustomPaint(size: const Size(48, 48), painter: _DynoIconPainter()),
                          onTap: () {},
                        ),
                        _OhlinsTile(onTap: () {}),
                        _HomeTileCustom(
                          label: 'Find Dealer',
                          color: AppTheme.tileGreen,
                          child: const Icon(Icons.location_on, color: Colors.white, size: 42),
                          onTap: () {},
                        ),
                        _HomeTileCustom(
                          label: 'Racing Service',
                          color: AppTheme.primaryRed,
                          child: CustomPaint(size: const Size(48, 48), painter: _CheckeredFlagPainter()),
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

class _HomeTileCustom extends StatelessWidget {
  final String label;
  final Color color;
  final Widget child;
  final VoidCallback onTap;

  const _HomeTileCustom({
    required this.label,
    required this.color,
    required this.child,
    required this.onTap,
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              child,
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
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

// Öhlins tile — text-based, gold background
class _OhlinsTile extends StatelessWidget {
  final VoidCallback onTap;
  const _OhlinsTile({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.ohlinsGold,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ÖHLINS bold text logo
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  'ÖHLINS',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Text(
                'Öhlins Catalogue',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
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

// --- Custom Icon Painters ---

class _SpringIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final cx = size.width / 2;
    final top = size.height * 0.05;
    final bottom = size.height * 0.95;
    final coils = 7;
    final coilHeight = (bottom - top) / coils;
    final amplitude = size.width * 0.32;

    final path = Path();
    path.moveTo(cx, top);
    for (int i = 0; i < coils; i++) {
      final y1 = top + i * coilHeight;
      final y2 = y1 + coilHeight / 2;
      final y3 = y1 + coilHeight;
      path.cubicTo(cx + amplitude, y1 + coilHeight * 0.25, cx + amplitude, y2 - coilHeight * 0.05, cx, y2);
      path.cubicTo(cx - amplitude, y2 + coilHeight * 0.05, cx - amplitude, y3 - coilHeight * 0.25, cx, y3);
    }
    canvas.drawPath(path, paint);

    // End caps
    canvas.drawLine(Offset(cx - amplitude * 0.8, top), Offset(cx + amplitude * 0.8, top), paint);
    canvas.drawLine(Offset(cx - amplitude * 0.8, bottom), Offset(cx + amplitude * 0.8, bottom), paint);
  }
  @override bool shouldRepaint(_) => false;
}

class _SpannerIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw a spanner/wrench shape
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Shaft
    final path = Path();
    path.moveTo(cx - 5, cy - 14);
    path.lineTo(cx + 5, cy - 14);
    path.lineTo(cx + 7, cy + 14);
    path.lineTo(cx - 7, cy + 14);
    path.close();
    canvas.drawPath(path, paint);

    // Top circle (head)
    canvas.drawCircle(Offset(cx, cy - 16), 9, paint);
    canvas.drawCircle(Offset(cx, cy - 16), 4, fillPaint);

    // Bottom rounded end
    final rrect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx, cy + 16), width: 16, height: 10),
      const Radius.circular(5),
    );
    canvas.drawRRect(rrect, paint);
  }
  @override bool shouldRepaint(_) => false;
}

class _DynoIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final axisPaint = Paint()
      ..color = Colors.white54
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final left = size.width * 0.15;
    final right = size.width * 0.92;
    final bottom = size.height * 0.85;
    final top = size.height * 0.15;

    // Axes
    canvas.drawLine(Offset(left, top), Offset(left, bottom), axisPaint);
    canvas.drawLine(Offset(left, bottom), Offset(right, bottom), axisPaint);

    // Waveform line
    final path = Path();
    path.moveTo(left, bottom);
    path.cubicTo(
      left + (right - left) * 0.2, bottom,
      left + (right - left) * 0.3, top + (bottom - top) * 0.4,
      left + (right - left) * 0.5, top + (bottom - top) * 0.15,
    );
    path.cubicTo(
      left + (right - left) * 0.65, top,
      left + (right - left) * 0.8, top + (bottom - top) * 0.1,
      right, top + (bottom - top) * 0.05,
    );
    canvas.drawPath(path, linePaint);
  }
  @override bool shouldRepaint(_) => false;
}

class _CheckeredFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final whitePaint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    final blackPaint = Paint()..color = Colors.black54..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Flag pole
    canvas.drawLine(Offset(size.width * 0.18, size.height * 0.1), Offset(size.width * 0.18, size.height * 0.92), strokePaint);

    // Flag body - checkered pattern clipped to a waving shape
    final flagRect = Rect.fromLTWH(size.width * 0.18, size.height * 0.1, size.width * 0.72, size.height * 0.5);
    canvas.save();
    final flagClip = Path();
    flagClip.moveTo(flagRect.left, flagRect.top);
    flagClip.lineTo(flagRect.right, flagRect.top + flagRect.height * 0.15);
    flagClip.lineTo(flagRect.right, flagRect.bottom - flagRect.height * 0.15);
    flagClip.lineTo(flagRect.left, flagRect.bottom);
    flagClip.close();
    canvas.clipPath(flagClip);

    // 3x3 grid of squares
    final sq = flagRect.width / 3;
    final sqH = flagRect.height / 3;
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        final isWhite = (row + col) % 2 == 0;
        canvas.drawRect(
          Rect.fromLTWH(flagRect.left + col * sq, flagRect.top + row * sqH, sq, sqH),
          isWhite ? whitePaint : blackPaint,
        );
      }
    }
    canvas.restore();
  }
  @override bool shouldRepaint(_) => false;
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