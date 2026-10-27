import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class FlutterFocusSection extends StatelessWidget {
  final Function(String section) onDiscussTap;

  const FlutterFocusSection({super.key, required this.onDiscussTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1360),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48.0 : 20.0,
              vertical: isDesktop ? 80.0 : 48.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Header
                Text(
                  'FLUTTER ENGINEERING',
                  style: AppTextStyles.labelCaps(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Your Flutter Partner,\nFrom First Build to What's Next.",
                  style: AppTextStyles.headlineLg(color: AppColors.primary),
                ),
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 620),
                  child: Text(
                    'Cross-platform without compromise. We construct pixel-precise, highly performant mobile applications backed by rock-solid architecture.',
                    style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
                  ),
                ),
                const SizedBox(height: 48),

                // 4 Pillars
                LayoutBuilder(
                  builder: (context, constraints) {
                    final pillars = [
                      _PillarData(
                        tag: '01 / Greenfield',
                        icon: Icons.add_box_rounded,
                        title: 'Custom App Development',
                        description:
                            'Turn your concept into a unified iOS and Android app. High-velocity development cycles with zero code bifurcation.',
                      ),
                      _PillarData(
                        tag: '02 / Expansion',
                        icon: Icons.auto_awesome_rounded,
                        title: 'Feature Enhancements',
                        description:
                            'Incorporate payment gateways, push notifications, offline databases, and bespoke canvas animations into existing builds.',
                      ),
                      _PillarData(
                        tag: '03 / Optimization',
                        icon: Icons.speed_rounded,
                        title: 'Maintenance & Support',
                        description:
                            'Eradicate render lag, eliminate memory leaks, patch dependency vulnerabilities, and modernize aging state models.',
                      ),
                      _PillarData(
                        tag: '04 / Release',
                        icon: Icons.rocket_launch_rounded,
                        title: 'Store Deployment',
                        description:
                            'Flawless App Store & Google Play submissions, compliance guidelines traversal, and continuous Fastlane automated delivery.',
                      ),
                    ];

                    if (isDesktop) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: pillars.map((p) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _buildPillarCard(p),
                          ),
                        )).toList(),
                      );
                    } else if (isTablet) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: _buildPillarCard(pillars[0])),
                              const SizedBox(width: 16),
                              Expanded(child: _buildPillarCard(pillars[1])),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(child: _buildPillarCard(pillars[2])),
                              const SizedBox(width: 16),
                              Expanded(child: _buildPillarCard(pillars[3])),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: pillars.map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildPillarCard(p),
                        )).toList(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 32),

                // Deliverables Pill Matrix & CTA
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: isDesktop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: _buildGuaranteesList()),
                            const SizedBox(width: 32),
                            _buildCtaButton(),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildGuaranteesList(),
                            const SizedBox(height: 24),
                            _buildCtaButton(),
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

  Widget _buildPillarCard(_PillarData data) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryFixed,
                  shape: BoxShape.circle,
                ),
                child: Icon(data.icon, size: 20, color: AppColors.secondary),
              ),
              const SizedBox(height: 20),
              Text(
                data.title,
                style: AppTextStyles.headlineSm(color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                data.description,
                style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            data.tag,
            style: AppTextStyles.labelCaps(
              color: AppColors.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuaranteesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'STANDARD ENGINEERING GUARANTEES',
          style: AppTextStyles.labelCaps(
            color: AppColors.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _GuaranteePill(text: 'Architecture Guidance'),
            _GuaranteePill(text: 'BLoC / Riverpod State Control'),
            _GuaranteePill(text: 'Firebase Realtime Sync'),
            _GuaranteePill(text: '60fps Performance Profiling'),
            _GuaranteePill(text: 'Rigorous Code Reviews'),
          ],
        ),
      ],
    );
  }

  Widget _buildCtaButton() {
    return ElevatedButton(
      onPressed: () => onDiscussTap('contact'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.onSecondary,
        elevation: 3,
        shadowColor: AppColors.secondary.withValues(alpha: 0.3),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Let's Discuss Your Flutter App",
            style: AppTextStyles.labelMd(
              color: AppColors.onSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_rounded, size: 18, color: AppColors.onSecondary),
        ],
      ),
    );
  }
}

class _PillarData {
  final String tag;
  final IconData icon;
  final String title;
  final String description;

  _PillarData({
    required this.tag,
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _GuaranteePill extends StatelessWidget {
  final String text;

  const _GuaranteePill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        text,
        style: AppTextStyles.labelMd(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
