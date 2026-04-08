import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/vehicle_card.dart';

class MyGarageScreen extends StatelessWidget {
  const MyGarageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildGarageStats(),
                        const SizedBox(height: 30),
                        _buildVehiclesList(),
                        const SizedBox(height: 30),
                        _buildAddVehicleCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: AppTheme.textPrimary,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Garage',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '3 vehicles registered',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppTheme.accentGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryRed.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.notifications,
              color: AppTheme.textPrimary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGarageStats() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Total Mileage', '45,230 km', Icons.speed, AppTheme.primaryRed),
          Container(width: 1, height: 40, color: Colors.white.withOpacity(0.1)),
          _buildStatItem('Services Due', '1', Icons.build, AppTheme.accent),
          Container(width: 1, height: 40, color: Colors.white.withOpacity(0.1)),
          _buildStatItem('Total Vehicles', '3', Icons.garage, const Color(0xFF4CAF50)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 10,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildVehiclesList() {
    final vehicles = [
      {
        'name': '2020 Ducati Panigale V4',
        'model': 'Panigale V4',
        'mileage': '12,450 km',
        'suspension': 'Öhlins NIX30',
        'serviceStatus': 'Due in 30 days',
        'isServiceDue': true,
        'image': 'motorcycle',
        'color': AppTheme.primaryRed,
      },
      {
        'name': '2019 BMW M3',
        'model': 'M3 Competition',
        'mileage': '28,750 km',
        'suspension': 'Öhlins Road & Track',
        'serviceStatus': 'Next service: June 2024',
        'isServiceDue': false,
        'image': 'car',
        'color': const Color(0xFF2196F3),
      },
      {
        'name': '2021 KTM 450 SX-F',
        'model': '450 SX-F',
        'mileage': '4,030 km',
        'suspension': 'Andreani Cartridge Kit',
        'serviceStatus': 'Recently serviced',
        'isServiceDue': false,
        'image': 'motorcycle',
        'color': AppTheme.accent,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Vehicles',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ...vehicles.map((vehicle) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: VehicleCard(
            name: vehicle['name'] as String,
            model: vehicle['model'] as String,
            mileage: vehicle['mileage'] as String,
            suspension: vehicle['suspension'] as String,
            serviceStatus: vehicle['serviceStatus'] as String,
            isServiceDue: vehicle['isServiceDue'] as bool,
            vehicleIcon: vehicle['image'] == 'car' ? Icons.directions_car : Icons.motorcycle,
            color: vehicle['color'] as Color,
            onTap: () {},
          ),
        )),
      ],
    );
  }

  Widget _buildAddVehicleCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryRed.withOpacity(0.1),
            AppTheme.primaryRed.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.primaryRed.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: AppTheme.accentGradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryRed.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.add,
              color: AppTheme.textPrimary,
              size: 28,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Add New Vehicle',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Register your motorcycle, car, or MTB to track maintenance and suspension setup',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Register Vehicle'),
          ),
        ],
      ),
    );
  }
}