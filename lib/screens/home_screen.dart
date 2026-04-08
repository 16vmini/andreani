import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/feature_card.dart';
import '../widgets/stats_card.dart';
import 'my_garage_screen.dart';
import 'dyno_report_screen.dart';
import 'setup_wizard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 30),
                  _buildStatsSection(),
                  const SizedBox(height: 30),
                  _buildQuickActions(context),
                  const SizedBox(height: 30),
                  _buildFeaturesGrid(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'ANDREANI',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryRed,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'PRO',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: AppTheme.accentGradient,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryRed.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.settings,
                color: AppTheme.textPrimary,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Suspension Excellence Since 1987',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return Row(
      children: [
        Expanded(
          child: StatsCard(
            title: 'Active Vehicles',
            value: '3',
            subtitle: 'In your garage',
            icon: Icons.motorcycle,
            gradient: AppTheme.accentGradient,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatsCard(
            title: 'Service Due',
            value: '1',
            subtitle: 'Next 30 days',
            icon: Icons.build,
            gradient: const LinearGradient(
              colors: [AppTheme.accent, Color(0xFFFF8C00)],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildQuickActionCard(
                context,
                'Book Service',
                Icons.calendar_today,
                AppTheme.primaryRed,
                () {},
              ),
              _buildQuickActionCard(
                context,
                'Find Centre',
                Icons.location_on,
                AppTheme.accent,
                () {},
              ),
              _buildQuickActionCard(
                context,
                'Setup Guide',
                Icons.tune,
                const Color(0xFF4CAF50),
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SetupWizardScreen()),
                ),
              ),
              _buildQuickActionCard(
                context,
                'Racing Support',
                Icons.speed,
                const Color(0xFF9C27B0),
                () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.2),
                  color.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: color.withOpacity(0.3),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 28,
                  color: color,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore Features',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: FeatureCard(
                    title: 'My Garage',
                    subtitle: 'Manage your vehicles',
                    icon: Icons.garage,
                    gradient: AppTheme.accentGradient,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyGarageScreen()),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FeatureCard(
                    title: 'Dyno Reports',
                    subtitle: 'View performance data',
                    icon: Icons.analytics,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DynoReportScreen()),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FeatureCard(
                    title: 'Course Booking',
                    subtitle: 'Training & education',
                    icon: Icons.school,
                    gradient: const LinearGradient(
                      colors: [AppTheme.accent, Color(0xFFFF8C00)],
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FeatureCard(
                    title: 'Product Catalog',
                    subtitle: 'Browse & order parts',
                    icon: Icons.shopping_bag,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}