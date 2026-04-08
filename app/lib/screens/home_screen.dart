import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildLogo(),
              const SizedBox(height: 24),
              _buildTileGrid(context),
              const SizedBox(height: 20),
              _buildBadges(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  /// Actual Andreani Group logo from website + GROUP text + tagline
  Widget _buildLogo() {
    return Column(
      children: [
        // Real logo image
        Image.asset(
          'assets/images/andreani_logo.png',
          width: 260,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 4),
        Text(
          'GROUP',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 12,
            color: AppColors.textMuted,
            height: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Suspension Excellence Since 1987',
          style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted),
        ),
      ],
    );
  }

  Widget _buildTileGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        // More compact tiles — closer to square
        childAspectRatio: 1.25,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // My Suspension — RED
          _HomeTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 52, height: 52, child: CustomPaint(painter: _SuspensionCoilPainter())),
                const SizedBox(height: 8),
                _tileLabel('My Suspension'),
              ],
            ),
            colors: const [Color(0xFFD4192F), Color(0xFF9B0D23)],
            onTap: () => Navigator.pushNamed(context, '/garage'),
          ),
          // Book Service — DARK
          _HomeTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.build_rounded, size: 52, color: Colors.white),
                const SizedBox(height: 8),
                _tileLabel('Book Service'),
              ],
            ),
            colors: const [Color(0xFF3A3A3A), Color(0xFF222222)],
            borderColor: const Color(0xFF555555),
            onTap: () => Navigator.pushNamed(context, '/book-service'),
          ),
          // Dyno Reports — DARK
          _HomeTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 52, height: 52, child: CustomPaint(painter: _ChartIconPainter())),
                const SizedBox(height: 8),
                _tileLabel('Dyno Reports'),
              ],
            ),
            colors: const [Color(0xFF3A3A3A), Color(0xFF222222)],
            borderColor: const Color(0xFF555555),
            onTap: () => Navigator.pushNamed(context, '/dyno'),
          ),
          // Öhlins Catalogue — GOLD
          _HomeTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ÖHLINS',
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1A1A1A),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                _tileLabel('Öhlins Catalogue', dark: true),
              ],
            ),
            colors: const [Color(0xFFE8C84A), Color(0xFFD4A843)],
            onTap: () => Navigator.pushNamed(context, '/products'),
          ),
          // Find Dealer — GREEN
          _HomeTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 52, color: Colors.white),
                const SizedBox(height: 8),
                _tileLabel('Find Dealer'),
              ],
            ),
            colors: const [Color(0xFF27AE60), Color(0xFF1E8449)],
            onTap: () => Navigator.pushNamed(context, '/dealers'),
          ),
          // Racing Service — RED
          _HomeTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 52, height: 52, child: CustomPaint(painter: _CheckeredFlagPainter())),
                const SizedBox(height: 8),
                _tileLabel('Racing Service'),
              ],
            ),
            colors: const [Color(0xFFC8102E), Color(0xFF7D0A1D)],
            onTap: () => Navigator.pushNamed(context, '/racing'),
          ),
        ],
      ),
    );
  }

  Widget _tileLabel(String text, {bool dark = false}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: dark ? const Color(0xFF1A1A1A) : Colors.white,
      ),
    );
  }

  Widget _buildBadges() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Öhlins badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF444444)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Text(
                  'ÖHLINS',
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w900, color: const Color(0xFFFFD700), letterSpacing: 1),
                ),
                const SizedBox(width: 6),
                Text(
                  'OFFICIAL PARTNER',
                  style: GoogleFonts.inter(fontSize: 8, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 0.5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // 35 Years
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '35',
                style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white, height: 1),
              ),
              const SizedBox(width: 3),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('YEARS', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.textMuted, letterSpacing: 2, height: 1)),
                  const SizedBox(height: 3),
                  Container(height: 2.5, width: 44, color: AppColors.red),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Suspension coil/spring icon — bold, fills the space like the mockup
class _SuspensionCoilPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final w = size.width;
    final h = size.height;
    final cx = w / 2;

    // Top bar
    canvas.drawLine(Offset(cx - 10, 3), Offset(cx + 10, 3), paint);

    // Coil zigzag — big and bold
    final path = Path();
    path.moveTo(cx, 3);
    const coils = 5;
    final coilH = (h - 10) / coils;
    for (var i = 0; i < coils; i++) {
      final y1 = 5 + i * coilH + coilH * 0.5;
      final y2 = 5 + (i + 1) * coilH;
      path.lineTo(i.isEven ? cx + 14 : cx - 14, y1);
      path.lineTo(cx, y2);
    }
    canvas.drawPath(path, paint);

    // Bottom bar
    canvas.drawLine(Offset(cx - 10, h - 3), Offset(cx + 10, h - 3), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Chart/dyno icon — bold line chart matching the mockup's zigzag style
class _ChartIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Box outline
    final boxPaint = Paint()
      ..color = Colors.white.withAlpha(80)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(2, 6, w - 4, h - 10), const Radius.circular(4)),
      boxPaint,
    );

    // Chart line — zigzag upward trend
    final path = Path();
    path.moveTo(10, h - 14);
    path.lineTo(w * 0.25, h * 0.55);
    path.lineTo(w * 0.4, h * 0.65);
    path.lineTo(w * 0.6, h * 0.3);
    path.lineTo(w * 0.75, h * 0.4);
    path.lineTo(w - 10, 14);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Checkered flag icon — matching the mockup's racing flag
class _CheckeredFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Flag pole
    final polePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(12, 8), Offset(12, h - 4), polePaint);

    // Flag body — checkered pattern
    final flagRect = Rect.fromLTWH(14, 6, w - 20, h * 0.55);
    final cellW = flagRect.width / 4;
    final cellH = flagRect.height / 3;

    for (var row = 0; row < 3; row++) {
      for (var col = 0; col < 4; col++) {
        final isWhite = (row + col) % 2 == 0;
        final cellPaint = Paint()
          ..color = isWhite ? Colors.white : AppColors.red;
        canvas.drawRect(
          Rect.fromLTWH(
            flagRect.left + col * cellW,
            flagRect.top + row * cellH,
            cellW,
            cellH,
          ),
          cellPaint,
        );
      }
    }

    // Flag outline
    final outlinePaint = Paint()
      ..color = Colors.white.withAlpha(60)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawRect(flagRect, outlinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HomeTile extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final Color? borderColor;
  final VoidCallback onTap;

  const _HomeTile({
    required this.child,
    required this.colors,
    this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
            borderRadius: BorderRadius.circular(22),
            border: borderColor != null ? Border.all(color: borderColor!, width: 1) : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
