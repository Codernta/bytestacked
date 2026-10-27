import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class DesignMeetsCodeSection extends StatelessWidget {
  const DesignMeetsCodeSection({super.key});

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
              vertical: isDesktop ? 80.0 : 48.0,
            ),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Visual Column (Left)
                      Expanded(
                        flex: 5,
                        child: _buildImageCard(),
                      ),
                      const SizedBox(width: 48),
                      // Details Column (Right)
                      Expanded(
                        flex: 7,
                        child: _buildDetailsContent(isDesktop: true),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailsContent(isDesktop: false),
                      const SizedBox(height: 36),
                      _buildImageCard(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/hardware.jpg',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 300,
                color: AppColors.surfaceContainerHigh,
                child: const Center(
                  child: Icon(Icons.settings_input_component, size: 48, color: AppColors.outline),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HARDWARE ANALOGY',
                      style: AppTextStyles.labelCaps(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tactile Precision',
                      style: AppTextStyles.headlineSm(color: AppColors.primary),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Engineered Rigor',
                    style: AppTextStyles.labelCaps(color: AppColors.onSurfaceVariant),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsContent({required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DESIGN MEETS CODE',
          style: AppTextStyles.labelCaps(
            color: AppColors.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Every detail engineered with absolute intent.',
          style: AppTextStyles.headlineLg(color: AppColors.primary),
        ),
        const SizedBox(height: 14),
        Text(
          'We treat software construction with the same discipline as industrial product fabrication. Fluid interfaces, zero dropped frames, and architectural structures that endure market shifts.',
          style: AppTextStyles.bodyLg(color: AppColors.onSurfaceVariant),
        ),
        const SizedBox(height: 32),

        // 2 Spec Cards
        isDesktop
            ? Row(
                children: [
                  Expanded(
                    child: _buildSpecCard(
                      number: '01 / ARCHITECTURE',
                      title: 'Modular & Decoupled',
                      description:
                          'Every layer has single responsibility, ensuring testability and zero-regression refactoring.',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSpecCard(
                      number: '02 / VELOCITY',
                      title: 'Predictable Delivery',
                      description:
                          'Automated pipelines release tested artifacts without high-stress manual intervention.',
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  _buildSpecCard(
                    number: '01 / ARCHITECTURE',
                    title: 'Modular & Decoupled',
                    description:
                        'Every layer has single responsibility, ensuring testability and zero-regression refactoring.',
                  ),
                  const SizedBox(height: 16),
                  _buildSpecCard(
                    number: '02 / VELOCITY',
                    title: 'Predictable Delivery',
                    description:
                        'Automated pipelines release tested artifacts without high-stress manual intervention.',
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildSpecCard({
    required String number,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: AppTextStyles.labelCaps(
              color: AppColors.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTextStyles.labelMd(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
