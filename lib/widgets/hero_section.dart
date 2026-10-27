import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class HeroSection extends StatefulWidget {
  final Function(String section) onExploreTap;
  final Function(String section) onStartProjectTap;

  const HeroSection({
    super.key,
    required this.onExploreTap,
    required this.onStartProjectTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1360),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48.0 : 20.0,
              vertical: isDesktop ? 64.0 : 36.0,
            ),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Column
                      Expanded(
                        flex: 7,
                        child: _buildLeftContent(isDesktop: true),
                      ),
                      const SizedBox(width: 48),
                      // Right Column
                      Expanded(
                        flex: 5,
                        child: _buildRightContent(),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLeftContent(isDesktop: false),
                      const SizedBox(height: 48),
                      _buildRightContent(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftContent({required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pulsing Pill Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.secondaryFixed.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(
                        alpha: 0.4 + (_pulseController.value * 0.6),
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withValues(
                            alpha: _pulseController.value * 0.4,
                          ),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              Text(
                'TECH • SOLUTIONS • IMPACT',
                style: AppTextStyles.labelCaps(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Main Headline
        Text(
          'Technology Built\nAround Your Ideas.',
          style: isDesktop
              ? AppTextStyles.headlineXl(color: AppColors.primary)
              : AppTextStyles.headlineXlMobile(color: AppColors.primary),
        ),
        const SizedBox(height: 18),

        // Subtitle
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: Text(
            'We design, develop, and support digital solutions that help businesses innovate, work smarter, and grow with confidence. Built for resilience and speed.',
            style: AppTextStyles.bodyLg(color: AppColors.onSurfaceVariant),
          ),
        ),
        const SizedBox(height: 32),

        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 14,
          children: [
            ElevatedButton(
              onPressed: () => widget.onExploreTap('services'),
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
                    'Explore Our Services',
                    style: AppTextStyles.labelMd(
                      color: AppColors.onSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_downward_rounded, size: 18, color: AppColors.onSecondary),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () => widget.onStartProjectTap('contact'),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.surfaceContainerLowest,
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.surfaceContainerHighest, width: 1.2),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Start a Project',
                    style: AppTextStyles.labelMd(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_rounded, size: 18, color: AppColors.secondary),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 44),

        // Micro Metric Proof
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Container(
            padding: const EdgeInsets.only(top: 24),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.surfaceContainerHigh, width: 1),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildMetricItem('SLA UPTIME', '99.98%', AppColors.primary),
                ),
                Expanded(
                  child: _buildMetricItem('AVG. LATENCY', '< 18ms', AppColors.secondary),
                ),
                Expanded(
                  child: _buildMetricItem('DELIVERY RATE', '100%', AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricItem(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelCaps(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.headlineSm(color: valueColor).copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Ambient Glow
        Positioned(
          top: -30,
          right: -30,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondaryFixed.withValues(alpha: 0.35),
            ),
          ),
        ),

        Column(
          children: [
            // Dark Code Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Window controls header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: AppColors.error,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: AppColors.secondaryContainer,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'architecture_stream.dart',
                            style: AppTextStyles.labelCaps(
                              color: AppColors.surfaceTint,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.tertiaryContainer.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Riverpod v2',
                          style: AppTextStyles.labelCaps(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Code Text
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.codeSnippet(),
                      children: const [
                        TextSpan(
                          text: '@riverpod\n',
                          style: TextStyle(color: AppColors.secondaryFixedDim),
                        ),
                        TextSpan(
                          text: 'class ',
                          style: TextStyle(color: AppColors.primaryFixedDim),
                        ),
                        TextSpan(
                          text: 'TelemetrySyncEngine ',
                          style: TextStyle(
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'extends ',
                          style: TextStyle(color: AppColors.primaryFixedDim),
                        ),
                        TextSpan(
                          text: '_\$TelemetrySyncEngine {\n',
                          style: TextStyle(color: AppColors.inverseOnSurface),
                        ),
                        TextSpan(
                          text: '  @override\n',
                          style: TextStyle(color: AppColors.secondaryFixedDim),
                        ),
                        TextSpan(
                          text: '  Stream<',
                          style: TextStyle(color: AppColors.inverseOnSurface),
                        ),
                        TextSpan(
                          text: 'EngineClusterState',
                          style: TextStyle(color: AppColors.onTertiaryContainer),
                        ),
                        TextSpan(
                          text: '> build() ',
                          style: TextStyle(color: AppColors.inverseOnSurface),
                        ),
                        TextSpan(
                          text: 'async* ',
                          style: TextStyle(color: AppColors.primaryFixedDim),
                        ),
                        TextSpan(
                          text: '{\n',
                          style: TextStyle(color: AppColors.inverseOnSurface),
                        ),
                        TextSpan(
                          text: '    // Multi-tenant reactive stream sync\n',
                          style: TextStyle(color: AppColors.surfaceTint),
                        ),
                        TextSpan(
                          text: '    yield* ',
                          style: TextStyle(color: AppColors.primaryFixedDim),
                        ),
                        TextSpan(
                          text: 'ref.watch(networkProvider)\n'
                              '      .connectSocket(heartbeat: ',
                          style: TextStyle(color: AppColors.inverseOnSurface),
                        ),
                        TextSpan(
                          text: '15.ms',
                          style: TextStyle(color: AppColors.secondaryFixed),
                        ),
                        TextSpan(
                          text: ')\n'
                              '      .map((packet) => packet.normalizeMetrics());\n'
                              '  }\n'
                              '}',
                          style: TextStyle(color: AppColors.inverseOnSurface),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Telemetry Live Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'CLIENT TELEMETRY LIVE',
                            style: AppTextStyles.labelCaps(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Region: us-east-1',
                          style: AppTextStyles.labelCaps(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Sparkline Canvas
                  SizedBox(
                    height: 44,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: SparklinePainter(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.speed,
                            size: 18,
                            color: AppColors.secondary,
                          ),
                          const SizedBox(width: 6),
                          RichText(
                            text: TextSpan(
                              style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant),
                              children: [
                                const TextSpan(text: 'Throughput: '),
                                TextSpan(
                                  text: '14,200 req/s',
                                  style: AppTextStyles.labelSm(
                                    color: AppColors.onSurface,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Passing',
                          style: AppTextStyles.labelCaps(
                            color: AppColors.onSecondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SparklinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = AppColors.secondary.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.15, size.width * 0.2, size.height * 0.6);
    path.cubicTo(
      size.width * 0.3,
      size.height * 0.85,
      size.width * 0.4,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.4,
    );
    path.cubicTo(
      size.width * 0.6,
      size.height * 0.7,
      size.width * 0.75,
      size.height * 0.2,
      size.width * 0.85,
      size.height * 0.5,
    );
    path.lineTo(size.width, size.height * 0.45);

    // Stroke
    canvas.drawPath(path, strokePaint);

    // Fill
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
