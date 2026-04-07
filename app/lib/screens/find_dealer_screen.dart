import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/andreani_app_bar.dart';

class FindDealerScreen extends StatefulWidget {
  const FindDealerScreen({super.key});

  @override
  State<FindDealerScreen> createState() => _FindDealerScreenState();
}

class _FindDealerScreenState extends State<FindDealerScreen> {
  String _activeFilter = 'All';

  final _filters = ['All', 'Motorcycle', 'Car', 'MTB', 'Ohlins', 'Service'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: andreaniAppBar(context, 'FIND DEALER'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map placeholder
            _buildMap(),
            const SizedBox(height: 16),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('NEAREST CENTRES', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textMuted, letterSpacing: 1)),
            ),
            const SizedBox(height: 12),
            // Dealer cards
            _DealerCard(
              name: 'TW Suspension Tech',
              distance: '12 mi',
              address: 'Unit 4, Silverstone Park, Northants NN12 8TN',
              tags: const [_Tag('Ohlins', Color(0xFF3d3000), Color(0xFFFFD700)), _Tag('Service', Color(0xFF0d2e1a), AppColors.green), _Tag('Moto', Color(0xFF2d1015), AppColors.red)],
              rating: 4.9,
              reviews: 127,
              onBook: () => Navigator.pushNamed(context, '/book-service'),
            ),
            _DealerCard(
              name: 'Andreani HQ — Pesaro',
              distance: '890 mi',
              address: 'Via Chiusa di Ginestreto 24, 61122 Pesaro, Italy',
              tags: const [_Tag('Ohlins', Color(0xFF3d3000), Color(0xFFFFD700)), _Tag('Service', Color(0xFF0d2e1a), AppColors.green), _Tag('Moto', Color(0xFF2d1015), AppColors.red), _Tag('Car', Color(0xFF1a2332), AppColors.blue), _Tag('MTB', Color(0xFF2d2010), Color(0xFFE67E22))],
              rating: 5.0,
              reviews: 312,
              onBook: () => Navigator.pushNamed(context, '/book-service'),
            ),
            _DealerCard(
              name: 'Andreani USA — Charlotte',
              distance: '3,800 mi',
              address: '5401 Performance Dr, Charlotte, NC 28214',
              tags: const [_Tag('Ohlins', Color(0xFF3d3000), Color(0xFFFFD700)), _Tag('Service', Color(0xFF0d2e1a), AppColors.green), _Tag('Moto', Color(0xFF2d1015), AppColors.red)],
              rating: 4.7,
              reviews: 54,
              onBook: () => Navigator.pushNamed(context, '/book-service'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      height: 260,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2332),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Stack(
        children: [
          // Grid lines
          CustomPaint(size: const Size.fromHeight(260), painter: _MapGridPainter()),
          // Your location
          Positioned(
            top: 120,
            left: 160,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [BoxShadow(color: AppColors.blue.withAlpha(80), blurRadius: 12, spreadRadius: 4)],
              ),
            ),
          ),
          // Pins
          _MapPin(top: 70, left: 80, selected: true),
          _MapPin(top: 130, left: 220),
          _MapPin(top: 180, left: 120),
          _MapPin(top: 50, left: 260),
          _MapPin(top: 150, left: 300),
          // Label
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(180),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('5 centres nearby', style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.blue.withAlpha(20)
      ..strokeWidth = 0.5;
    for (var i = 0.0; i < size.width; i += 40) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (var i = 0.0; i < size.height; i += 40) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _MapPin extends StatelessWidget {
  final double top, left;
  final bool selected;
  const _MapPin({required this.top, required this.left, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Icon(Icons.location_on, size: 28, color: selected ? AppColors.gold : AppColors.red),
    );
  }
}

class _Tag {
  final String label;
  final Color bg, text;
  const _Tag(this.label, this.bg, this.text);
}

class _DealerCard extends StatelessWidget {
  final String name, distance, address;
  final List<_Tag> tags;
  final double rating;
  final int reviews;
  final VoidCallback onBook;

  const _DealerCard({
    required this.name,
    required this.distance,
    required this.address,
    required this.tags,
    required this.rating,
    required this.reviews,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700)),
              Text(distance, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.gold)),
            ],
          ),
          const SizedBox(height: 4),
          Text(address, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: tags.map((t) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(color: t.bg, borderRadius: BorderRadius.circular(6)),
              child: Text(t.label, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w700, color: t.text, letterSpacing: 0.5)),
            )).toList(),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('★' * rating.floor(), style: const TextStyle(color: Color(0xFFFFD700), fontSize: 14)),
              const SizedBox(width: 4),
              Text('$rating ($reviews)', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textMuted)),
              const Spacer(),
              ElevatedButton(
                onPressed: onBook,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), minimumSize: Size.zero),
                child: const Text('Book'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
