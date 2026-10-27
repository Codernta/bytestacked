import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'theme/app_text_styles.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/services_section.dart';
import 'widgets/flutter_focus_section.dart';
import 'widgets/design_meets_code_section.dart';
import 'widgets/solutions_section.dart';
import 'widgets/process_section.dart';
import 'widgets/why_section.dart';
import 'widgets/tech_and_models_section.dart';
import 'widgets/faq_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer_section.dart';

void main() {
  runApp(const BytestackedApp());
}

class BytestackedApp extends StatelessWidget {
  const BytestackedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bytestacked. — Official Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.surface,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.secondary,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _flutterEngineeringKey = GlobalKey();
  final GlobalKey _designKey = GlobalKey();
  final GlobalKey _solutionsKey = GlobalKey();
  final GlobalKey _processKey = GlobalKey();
  final GlobalKey _whyKey = GlobalKey();
  final GlobalKey _techKey = GlobalKey();
  final GlobalKey _faqKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isMobileMenuOpen = false;

  void _scrollToSection(String section) {
    setState(() {
      _isMobileMenuOpen = false;
    });

    GlobalKey? targetKey;
    switch (section) {
      case 'home':
        targetKey = _homeKey;
        break;
      case 'services':
        targetKey = _servicesKey;
        break;
      case 'flutter-engineering':
      case 'our-work':
        targetKey = _flutterEngineeringKey;
        break;
      case 'design':
        targetKey = _designKey;
        break;
      case 'solutions':
        targetKey = _solutionsKey;
        break;
      case 'process':
        targetKey = _processKey;
        break;
      case 'why':
      case 'about':
        targetKey = _whyKey;
        break;
      case 'tech':
        targetKey = _techKey;
        break;
      case 'faq':
        targetKey = _faqKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Spacer for fixed navbar
                const SizedBox(height: 72),

                // Hero Section
                Container(
                  key: _homeKey,
                  child: HeroSection(
                    onExploreTap: _scrollToSection,
                    onStartProjectTap: _scrollToSection,
                  ),
                ),

                // Services Section
                Container(
                  key: _servicesKey,
                  child: const ServicesSection(),
                ),

                // Specialized Flutter Engineering Showcase
                Container(
                  key: _flutterEngineeringKey,
                  child: FlutterFocusSection(
                    onDiscussTap: _scrollToSection,
                  ),
                ),

                // Design Meets Code Visual Break
                Container(
                  key: _designKey,
                  child: const DesignMeetsCodeSection(),
                ),

                // Solutions Section
                Container(
                  key: _solutionsKey,
                  child: SolutionsSection(
                    onExploreSolution: _scrollToSection,
                  ),
                ),

                // Development Process Section
                Container(
                  key: _processKey,
                  child: const ProcessSection(),
                ),

                // Why Bytestacked Section
                Container(
                  key: _whyKey,
                  child: const WhySection(),
                ),

                // Technology Stack & Engagement Models Section
                Container(
                  key: _techKey,
                  child: TechAndModelsSection(
                    onSelectModel: _scrollToSection,
                  ),
                ),

                // FAQ Section
                Container(
                  key: _faqKey,
                  child: FaqSection(
                    onContactTap: _scrollToSection,
                  ),
                ),

                // Contact Section
                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),

                // Footer Section
                FooterSection(
                  onNavTap: _scrollToSection,
                ),

                // Padding at bottom for mobile nav bar if visible
                if (!isDesktop) const SizedBox(height: 70),
              ],
            ),
          ),

          // Fixed Top Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onNavTap: _scrollToSection,
              onMobileMenuToggle: () {
                setState(() {
                  _isMobileMenuOpen = !_isMobileMenuOpen;
                });
              },
              isMobileMenuOpen: _isMobileMenuOpen,
            ),
          ),

          // Mobile Drawer overlay if open
          if (!isDesktop && _isMobileMenuOpen)
            Positioned(
              top: 72,
              left: 0,
              right: 0,
              child: Container(
                color: AppColors.surface.withValues(alpha: 0.98),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'NAVIGATION MENU',
                          style: AppTextStyles.labelCaps(
                            color: AppColors.outline,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'v2026.1',
                          style: AppTextStyles.labelCaps(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildMobileNavItem('Home', 'home'),
                    _buildMobileNavItem('Services', 'services'),
                    _buildMobileNavItem('Solutions', 'solutions'),
                    _buildMobileNavItem('Our Work', 'flutter-engineering'),
                    _buildMobileNavItem('About', 'why'),
                    _buildMobileNavItem('Contact', 'contact', isAccent: true),
                  ],
                ),
              ),
            ),

          // Mobile Bottom Navigation Bar (Matching Stitch Mobile Spec)
          if (!isDesktop)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: 0.92),
                  border: Border(
                    top: BorderSide(
                      color: AppColors.onSurface.withValues(alpha: 0.05),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBottomBarItem(Icons.home_rounded, 'Home', 'home'),
                    _buildBottomBarItem(Icons.dashboard_customize_rounded, 'Services', 'services'),
                    _buildBottomBarItem(Icons.terminal_rounded, 'Solutions', 'solutions'),
                    _buildBottomBarItem(Icons.grid_view_rounded, 'Work', 'flutter-engineering'),
                    _buildBottomBarItem(Icons.info_outline_rounded, 'About', 'why'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMobileNavItem(String title, String section, {bool isAccent = false}) {
    return InkWell(
      onTap: () => _scrollToSection(section),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.labelMd(
                color: isAccent ? AppColors.secondary : AppColors.onSurface,
                fontWeight: isAccent ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
            Icon(
              isAccent ? Icons.mail_rounded : Icons.north_east_rounded,
              size: 18,
              color: isAccent ? AppColors.secondary : AppColors.outline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarItem(IconData icon, String label, String section) {
    return InkWell(
      onTap: () => _scrollToSection(section),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: AppColors.onSurfaceVariant),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTextStyles.labelSm(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ).copyWith(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
