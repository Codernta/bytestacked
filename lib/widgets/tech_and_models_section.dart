import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class TechAndModelsSection extends StatelessWidget {
  final Function(String section) onSelectModel;

  const TechAndModelsSection({super.key, required this.onSelectModel});

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
            child: Column(
              children: [
                // Top: Tech Standards
                Column(
                  children: [
                    Text(
                      'TECHNOLOGY STANDARDS',
                      style: AppTextStyles.labelCaps(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Built on Modern, Resilient Foundational Stacks',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headlineMd(color: AppColors.primary),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: const [
                          _TechPill(text: 'Flutter & Dart', hasDot: true),
                          _TechPill(text: 'Riverpod / BLoC'),
                          _TechPill(text: 'TypeScript & Next.js'),
                          _TechPill(text: 'PostgreSQL / Supabase'),
                          _TechPill(text: 'Firebase Realtime'),
                          _TechPill(text: 'OpenAI / Claude LLM APIs'),
                          _TechPill(text: 'Docker & Kubernetes'),
                          _TechPill(text: 'AWS / Google Cloud'),
                          _TechPill(text: 'Fastlane CI/CD'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 64),

                // 3 Engagement Models
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: _buildModel1()),
                      const SizedBox(width: 20),
                      Expanded(child: _buildModel2()),
                      const SizedBox(width: 20),
                      Expanded(child: _buildModel3()),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildModel1(),
                      const SizedBox(height: 20),
                      _buildModel2(),
                      const SizedBox(height: 20),
                      _buildModel3(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModel1() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MODEL 01',
                    style: AppTextStyles.labelCaps(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(Icons.rocket_launch_rounded, size: 22, color: AppColors.primary),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'New Product Development',
                style: AppTextStyles.headlineSm(color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                'Full lifecycle build from scoping and architecture to production store deployment. Best for brand new MVPs and startup launches.',
                style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 20),
              _buildCheckItem('Fixed scope & timeline milestones', false),
              _buildCheckItem('Dedicated engineering squad', false),
              _buildCheckItem('Complete code ownership', false),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => onSelectModel('contact'),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.surfaceContainer,
                foregroundColor: AppColors.primary,
                side: BorderSide.none,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'Select New Build',
                style: AppTextStyles.labelMd(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModel2() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MODEL 02',
                    style: AppTextStyles.labelCaps(
                      color: AppColors.secondaryFixed,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'POPULAR',
                      style: AppTextStyles.labelCaps(
                        color: AppColors.onSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Product Enhancement',
                style: AppTextStyles.headlineSm(color: AppColors.onPrimary),
              ),
              const SizedBox(height: 10),
              Text(
                'Targeted sprint bursts to implement complex features, refactor performance bottlenecks, or integrate modern AI capabilities.',
                style: AppTextStyles.bodySm(color: AppColors.primaryFixedDim),
              ),
              const SizedBox(height: 20),
              _buildCheckItem('Flexible bi-weekly sprints', true),
              _buildCheckItem('Performance & jank audits', true),
              _buildCheckItem('Rapid onboarding to existing code', true),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => onSelectModel('contact'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.onSecondary,
                elevation: 2,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'Start Sprint Burst',
                style: AppTextStyles.labelMd(color: AppColors.onSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModel3() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MODEL 03',
                    style: AppTextStyles.labelCaps(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(Icons.security_rounded, size: 22, color: AppColors.primary),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Technical Support & SLA',
                style: AppTextStyles.headlineSm(color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                'Continuous monitoring, security patch management, store compliance maintenance, and high-priority bug resolution retainers.',
                style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 20),
              _buildCheckItem('Guaranteed response SLA', false),
              _buildCheckItem('Automated CI/CD health checks', false),
              _buildCheckItem('OS & SDK upgrade guarantees', false),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => onSelectModel('contact'),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.surfaceContainer,
                foregroundColor: AppColors.primary,
                side: BorderSide.none,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'Retainer Inquiry',
                style: AppTextStyles.labelMd(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            Icons.check_rounded,
            size: 16,
            color: isDark ? AppColors.secondaryFixed : AppColors.secondary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodySm(
                color: isDark ? AppColors.primaryFixedDim : AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechPill extends StatelessWidget {
  final String text;
  final bool hasDot;

  const _TechPill({required this.text, this.hasDot = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasDot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: AppTextStyles.labelMd(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
