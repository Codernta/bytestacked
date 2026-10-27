import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SolutionsSection extends StatelessWidget {
  final Function(String section) onExploreSolution;

  const SolutionsSection({super.key, required this.onExploreSolution});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    final solutions = [
      _SolutionData(
        objective: 'Objective 01',
        title: 'Launch a New Product',
        description:
            'Turn wireframes into a production-grade MVP ready for market validation, paying users, and investor scrutiny without architectural debt.',
        actionText: 'Explore MVP track',
      ),
      _SolutionData(
        objective: 'Objective 02',
        title: 'Modernize Existing Software',
        description:
            'Refactor monolithic legacy systems into clean, reactive modular microservices. Cut downtime and reduce maintenance overhead.',
        actionText: 'Explore Refactoring',
      ),
      _SolutionData(
        objective: 'Objective 03',
        title: 'Streamline Business Operations',
        description:
            'Consolidate disparate spreadsheets and manual emails into customized internal portals, unified dashboards, and automated sync hooks.',
        actionText: 'Explore Internal Tools',
      ),
      _SolutionData(
        objective: 'Objective 04',
        title: 'Improve Customer Experiences',
        description:
            'Deliver fluid mobile interfaces, lightning-fast web checkout paths, and zero-friction customer journeys that boost retention.',
        actionText: 'Explore UX Engineering',
      ),
      _SolutionData(
        objective: 'Objective 05',
        title: 'Integrate AI into Your Workflow',
        description:
            'Augment your human workforce with deterministic AI pipelines, automated document summaries, and intelligent triaging bots.',
        actionText: 'Explore AI Integration',
      ),
      _SolutionData(
        objective: 'Objective 06',
        title: 'Scale Your Digital Product',
        description:
            'Prepare infrastructure for hyper-growth traffic spikes. Edge-caching, distributed read replicas, and resilient message brokers.',
        actionText: 'Explore Scale Solutions',
      ),
    ];

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
                // Header
                Text(
                  'SOLUTIONS',
                  style: AppTextStyles.labelCaps(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Technology That Solves\nReal Problems.',
                  style: AppTextStyles.headlineLg(color: AppColors.primary),
                ),
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    'Whether you are launching an early-stage venture or scaling an existing enterprise stack, we adapt our engineering to your current inflection point.',
                    style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
                  ),
                ),
                const SizedBox(height: 48),

                // 6 Cards Grid
                if (isDesktop)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: _buildSolutionCard(solutions[0])),
                          const SizedBox(width: 20),
                          Expanded(child: _buildSolutionCard(solutions[1])),
                          const SizedBox(width: 20),
                          Expanded(child: _buildSolutionCard(solutions[2])),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: _buildSolutionCard(solutions[3])),
                          const SizedBox(width: 20),
                          Expanded(child: _buildSolutionCard(solutions[4])),
                          const SizedBox(width: 20),
                          Expanded(child: _buildSolutionCard(solutions[5])),
                        ],
                      ),
                    ],
                  )
                else if (isTablet)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: _buildSolutionCard(solutions[0])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildSolutionCard(solutions[1])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: _buildSolutionCard(solutions[2])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildSolutionCard(solutions[3])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: _buildSolutionCard(solutions[4])),
                          const SizedBox(width: 16),
                          Expanded(child: _buildSolutionCard(solutions[5])),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    children: solutions.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildSolutionCard(s),
                    )).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSolutionCard(_SolutionData data) {
    return Container(
      padding: const EdgeInsets.all(28),
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
              Text(
                data.objective,
                style: AppTextStyles.labelCaps(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
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
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onExploreSolution('contact'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.actionText,
                    style: AppTextStyles.labelMd(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 16,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SolutionData {
  final String objective;
  final String title;
  final String description;
  final String actionText;

  _SolutionData({
    required this.objective,
    required this.title,
    required this.description,
    required this.actionText,
  });
}
