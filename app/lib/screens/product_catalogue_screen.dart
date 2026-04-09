import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ProductCatalogueScreen extends StatefulWidget {
  const ProductCatalogueScreen({super.key});

  @override
  State<ProductCatalogueScreen> createState() => _ProductCatalogueScreenState();
}

class _ProductCatalogueScreenState extends State<ProductCatalogueScreen> {
  String _activeFilter = 'All';
  final _filters = ['All', 'Ohlins', 'Andreani', 'Mivv', 'Tools', 'Samco', 'PFC'];

  final _products = const [
    _Product('🔱', 'Ohlins', 'NIX30 Fork Cartridge Kit', '€1,890', null),
    _Product('🔱', 'Ohlins', 'TTX36 GP Rear Shock', '€2,450', null),
    _Product('⚙️', 'Andreani', 'Misano EVO Cartridge Kit', '€890', null),
    _Product('📊', 'Andreani Tools', 'DB4 Suspension Dyno', '€12,500', 'B2B Only'),
    _Product('🔧', 'Andreani Tools', 'Vacuum Pump VP1', '€3,200', 'B2B Only'),
    _Product('💨', 'Mivv', 'GP Pro Exhaust — Titanium', '€890', null),
    _Product('🔴', 'Samco', 'Coolant Hose Kit — Red', '€185', null),
    _Product('🛑', 'PFC Brakes', 'Carbon Ceramic Pads', '€320', null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Row(
              children: [
                Text('Andreani ', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                Text('CATALOGUE', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1, color: AppColors.textMuted)),
              ],
            ),
          ),
          // Filters
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final f = _filters[i];
                final active = f == _activeFilter;
                return GestureDetector(
                  onTap: () => setState(() => _activeFilter = f),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: active ? AppColors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: active ? AppColors.red : AppColors.border),
                    ),
                    alignment: Alignment.center,
                    child: Text(f, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: active ? Colors.white : AppColors.textMuted)),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Product grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.72,
              ),
              itemCount: _products.length,
              itemBuilder: (context, i) => _ProductCard(product: _products[i]),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Product {
  final String emoji, brand, name, price;
  final String? badge;
  const _Product(this.emoji, this.brand, this.name, this.price, this.badge);
}

class _ProductCard extends StatelessWidget {
  final _Product product;
  const _ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image area
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF1a1a1a), Color(0xFF222222)]),
            ),
            child: Center(child: Text(product.emoji, style: const TextStyle(fontSize: 50))),
          ),
          // Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.brand, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.gold, letterSpacing: 0.5)),
                const SizedBox(height: 2),
                Text(product.name, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700, height: 1.3), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                Text(product.price, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.green)),
                if (product.badge != null) ...[
                  const SizedBox(height: 2),
                  Text(product.badge!, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.blue)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
