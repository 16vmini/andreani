import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Brand header
            _buildHero(),
            const SizedBox(height: 24),
            // Tile grid
            _buildTileGrid(context),
            const SizedBox(height: 16),
            // Badges
            _buildBadges(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'ANDREANI',
            style: GoogleFonts.inter(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
          Text(
            'GROUP',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 8,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Suspension Excellence Since 1987',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTileGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _HomeTile(
            icon: Icons.two_wheeler,
            label: 'My Suspension',
            gradient: const [AppColors.red, AppColors.redDark],
            onTap: () => Navigator.pushNamed(context, '/garage'),
          ),
          _HomeTile(
            icon: Icons.build,
            label: 'Book Service',
            gradient: const [Color(0xFF333333), Color(0xFF1A1A1A)],
            border: true,
            onTap: () => Navigator.pushNamed(context, '/book-service'),
          ),
          _HomeTile(
            icon: Icons.show_chart,
            label: 'Dyno Reports',
            gradient: const [Color(0xFF333333), Color(0xFF1A1A1A)],
            border: true,
            onTap: () => Navigator.pushNamed(context, '/dyno'),
          ),
          _HomeTile(
            icon: Icons.shopping_bag,
            label: 'Catalogue',
            gradient: const [AppColors.gold, Color(0xFFB8912E)],
            textColor: const Color(0xFF1A1A1A),
            onTap: () => Navigator.pushNamed(context, '/products'),
          ),
          _HomeTile(
            icon: Icons.location_on,
            label: 'Find Dealer',
            gradient: const [Color(0xFF27AE60), Color(0xFF1A8C4E)],
            onTap: () => Navigator.pushNamed(context, '/dealers'),
          ),
          _HomeTile(
            icon: Icons.flag,
            label: 'Racing Service',
            gradient: const [AppColors.red, Color(0xFF7D0A1D)],
            onTap: () => Navigator.pushNamed(context, '/racing'),
          ),
        ],
      ),
    );
  }

  Widget _buildBadges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'OHLINS',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: const Color(0xFFFFD700),
            letterSpacing: 1,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'OFFICIAL PARTNER',
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          '|',
          style: GoogleFonts.inter(color: AppColors.textMuted),
        ),
        const SizedBox(width: 16),
        Text(
          '35 YEARS',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _HomeTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final List<Color> gradient;
  final Color textColor;
  final bool border;
  final VoidCallback onTap;

  const _HomeTile({
    required this.icon,
    required this.label,
    required this.gradient,
    this.textColor = Colors.white,
    this.border = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradient,
            ),
            borderRadius: BorderRadius.circular(16),
            border: border ? Border.all(color: const Color(0xFF444444)) : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: textColor),
              const SizedBox(height: 10),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
