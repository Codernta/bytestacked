import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class Navbar extends StatelessWidget {
  final Function(String section) onNavTap;
  final VoidCallback onMobileMenuToggle;
  final bool isMobileMenuOpen;

  const Navbar({
    super.key,
    required this.onNavTap,
    required this.onMobileMenuToggle,
    required this.isMobileMenuOpen,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 992;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.85),
            border: Border(
              bottom: BorderSide(
                color: AppColors.onSurface.withValues(alpha: 0.04),
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1360),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 48.0 : 20.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left: Logo + Mobile Hamburger
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isDesktop) ...[
                          IconButton(
                            icon: Icon(
                              isMobileMenuOpen ? Icons.close : Icons.menu,
                              color: AppColors.onSurface,
                            ),
                            onPressed: onMobileMenuToggle,
                            splashRadius: 20,
                          ),
                          const SizedBox(width: 8),
                        ],
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => onNavTap('home'),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'bytestacked',
                                    style: AppTextStyles.headlineMd(
                                      color: const Color(0xFF171717),
                                    ).copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: isDesktop ? 24 : 20,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '.',
                                    style: AppTextStyles.headlineMd(
                                      color: AppColors.primary,
                                    ).copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontSize: isDesktop ? 24 : 20,
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.top,
                                    child: Transform.translate(
                                      offset: const Offset(2, -4),
                                      child: Text(
                                        '®',
                                        style: TextStyle(
                                          fontSize: isDesktop ? 12 : 10,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF171717),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Center: Navigation links for desktop
                    if (isDesktop)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNavLink('Home', () => onNavTap('home'), isActive: true),
                          const SizedBox(width: 28),
                          _buildNavLink('Services', () => onNavTap('services')),
                          const SizedBox(width: 28),
                          _buildNavLink('Solutions', () => onNavTap('solutions')),
                          const SizedBox(width: 28),
                          _buildNavLink('Our Work', () => onNavTap('flutter-engineering')),
                          const SizedBox(width: 28),
                          _buildNavLink('About', () => onNavTap('why')),
                          const SizedBox(width: 28),
                          _buildNavLink('Contact', () => onNavTap('contact')),
                        ],
                      ),

                    // Right: "Let's Talk" CTA + Profile Avatar
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () => onNavTap('contact'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            foregroundColor: AppColors.onSecondary,
                            elevation: 2,
                            shadowColor: AppColors.secondary.withValues(alpha: 0.3),
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 20 : 14,
                              vertical: isDesktop ? 14 : 10,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Let's Talk",
                                style: AppTextStyles.labelMd(
                                  color: AppColors.onSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 16,
                                color: AppColors.onSecondary,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 14),
                        // Avatar Badge
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.surfaceVariant,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/avatar.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: AppColors.surfaceContainerHigh,
                                child: const Icon(
                                  Icons.person,
                                  size: 18,
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavLink(String title, VoidCallback onTap, {bool isActive = false}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: AppTextStyles.labelMd(
            color: isActive ? AppColors.secondary : AppColors.onSurfaceVariant,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
