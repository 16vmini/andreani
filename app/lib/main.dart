import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/garage_screen.dart';
import 'screens/dyno_report_screen.dart';
import 'screens/setup_wizard_screen.dart';
import 'screens/find_dealer_screen.dart';
import 'screens/course_booking_screen.dart';
import 'screens/service_book_screen.dart';
import 'screens/book_service_screen.dart';
import 'screens/racing_service_screen.dart';
import 'screens/product_catalogue_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const AndreaniApp());
}

class AndreaniApp extends StatelessWidget {
  const AndreaniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andreani Group',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const AppShell(),
      routes: {
        '/garage': (context) => const GarageScreen(),
        '/dyno': (context) => const DynoReportScreen(),
        '/setup': (context) => const SetupWizardScreen(),
        '/dealers': (context) => const FindDealerScreen(),
        '/courses': (context) => const CourseBookingScreen(),
        '/service-book': (context) => const ServiceBookScreen(),
        '/book-service': (context) => const BookServiceScreen(),
        '/racing': (context) => const RacingServiceScreen(),
        '/products': (context) => const ProductCatalogueScreen(),
      },
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    ProductCatalogueScreen(),
    BookServiceScreen(),
    RacingServiceScreen(),
    CourseBookingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        height: 64,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: AppColors.red), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), selectedIcon: Icon(Icons.shopping_bag, color: AppColors.red), label: 'Products'),
          NavigationDestination(icon: Icon(Icons.build_outlined), selectedIcon: Icon(Icons.build, color: AppColors.red), label: 'Service'),
          NavigationDestination(icon: Icon(Icons.flag_outlined), selectedIcon: Icon(Icons.flag, color: AppColors.red), label: 'Racing'),
          NavigationDestination(icon: Icon(Icons.more_horiz), selectedIcon: Icon(Icons.more_horiz, color: AppColors.red), label: 'More'),
        ],
      ),
    );
  }
}
