import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class FooterSection extends StatelessWidget {
  final Function(String section) onNavTap;

  const FooterSection({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      color: AppColors.surfaceContainerLow,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1360),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48.0 : 20.0,
              vertical: isDesktop ? 64.0 : 40.0,
            ),
            child: Column(
              children: [
                // Top Grid
                isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Brand Info
                          Expanded(
                            flex: 5,
                            child: _buildBrandInfo(),
                          ),
                          const Spacer(),
                          // Navigation
                          Expanded(
                            flex: 3,
                            child: _buildNavLinks(),
                          ),
                          // Services
                          Expanded(
                            flex: 3,
                            child: _buildServicesLinks(),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBrandInfo(),
                          const SizedBox(height: 36),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildNavLinks()),
                              const SizedBox(width: 24),
                              Expanded(child: _buildServicesLinks()),
                            ],
                          ),
                        ],
                      ),
                const SizedBox(height: 48),

                // Bottom Divider & Legal
                Container(
                  padding: const EdgeInsets.only(top: 24),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: AppColors.surfaceContainerHighest)),
                  ),
                  child: isDesktop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '© 2026 bytestacked. All rights reserved. bytestacked.github.io',
                              style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant),
                            ),
                            Row(
                              children: [
                                _buildLegalLink('Privacy Policy'),
                                const SizedBox(width: 20),
                                _buildLegalLink('Terms of Service'),
                                const SizedBox(width: 20),
                                _buildLegalLink('System Status'),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '© 2026 bytestacked. All rights reserved.',
                              style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'bytestacked.github.io',
                              style: AppTextStyles.labelCaps(color: AppColors.onSurfaceVariant),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 16,
                              runSpacing: 8,
                              children: [
                                _buildLegalLink('Privacy Policy'),
                                _buildLegalLink('Terms of Service'),
                                _buildLegalLink('System Status'),
                              ],
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      fontSize: 24,
                      letterSpacing: -0.5,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                    style: AppTextStyles.headlineMd(
                      color: AppColors.primary,
                    ).copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: Transform.translate(
                      offset: const Offset(2, -4),
                      child: const Text(
                        '®',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF171717),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'TECH • SOLUTIONS • IMPACT',
          style: AppTextStyles.labelCaps(
            color: AppColors.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Text(
            'Engineering resilient digital systems, high-velocity software architectures, and human-centered design for forward-thinking enterprises.',
            style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.public_rounded, size: 18, color: AppColors.secondary),
            const SizedBox(width: 8),
            Text(
              'bytestacked.github.io',
              style: AppTextStyles.labelCaps(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NAVIGATION',
          style: AppTextStyles.labelCaps(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        _buildFooterLink('Home', () => onNavTap('home')),
        const SizedBox(height: 10),
        _buildFooterLink('About', () => onNavTap('why')),
        const SizedBox(height: 10),
        _buildFooterLink('Our Work', () => onNavTap('flutter-engineering')),
        const SizedBox(height: 10),
        _buildFooterLink('Solutions', () => onNavTap('solutions')),
        const SizedBox(height: 10),
        _buildFooterLink('Contact', () => onNavTap('contact')),
      ],
    );
  }

  Widget _buildServicesLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CORE SERVICES',
          style: AppTextStyles.labelCaps(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        _buildFooterLink('Cloud & Infrastructure', () => onNavTap('services')),
        const SizedBox(height: 10),
        _buildFooterLink('Full-Stack Architecture', () => onNavTap('services')),
        const SizedBox(height: 10),
        _buildFooterLink('Data Platforms & AI', () => onNavTap('services')),
        const SizedBox(height: 10),
        _buildFooterLink('Technical Strategy', () => onNavTap('services')),
        const SizedBox(height: 10),
        _buildFooterLink('Security & Compliance', () => onNavTap('services')),
      ],
    );
  }

  Widget _buildFooterLink(String title, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: AppTextStyles.labelMd(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLegalLink(String title) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text(
        title,
        style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant),
      ),
    );
  }
}
