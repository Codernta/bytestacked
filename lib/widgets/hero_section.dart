import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'animated_hover_card.dart';
import 'fade_slide_in.dart';

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

class _HeroSectionState extends State<HeroSection> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _waveController;
  late AnimationController _glowController;

  Timer? _telemetryTimer;
  int _liveThroughput = 14200;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _telemetryTimer = Timer.periodic(const Duration(milliseconds: 1800), (timer) {
      if (mounted) {
        setState(() {
          _liveThroughput = 14180 + Random().nextInt(65);
        });
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    _glowController.dispose();
    _telemetryTimer?.cancel();
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
        FadeSlideIn(
          delay: const Duration(milliseconds: 100),
          child: Container(
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
                              alpha: _pulseController.value * 0.5,
                            ),
                            blurRadius: 8,
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
        ),
        const SizedBox(height: 20),

        // Main Headline
        FadeSlideIn(
          delay: const Duration(milliseconds: 200),
          child: Text(
            'Technology Built\nAround Your Ideas.',
            style: isDesktop
                ? AppTextStyles.headlineXl(color: AppColors.primary)
                : AppTextStyles.headlineXlMobile(color: AppColors.primary),
          ),
        ),
        const SizedBox(height: 18),

        // Subtitle
        FadeSlideIn(
          delay: const Duration(milliseconds: 300),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 580),
            child: Text(
              'We design, develop, and support digital solutions that help businesses innovate, work smarter, and grow with confidence. Built for resilience and speed.',
              style: AppTextStyles.bodyLg(color: AppColors.onSurfaceVariant),
            ),
          ),
        ),
        const SizedBox(height: 32),

        // CTA Buttons
        FadeSlideIn(
          delay: const Duration(milliseconds: 400),
          child: Wrap(
            spacing: 16,
            runSpacing: 14,
            children: [
              _HoverButton(
                onPressed: () => widget.onExploreTap('services'),
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.onSecondary,
                label: 'Explore Our Services',
                icon: Icons.arrow_downward_rounded,
                isPrimary: true,
              ),
              _HoverButton(
                onPressed: () => widget.onStartProjectTap('contact'),
                backgroundColor: AppColors.surfaceContainerLowest,
                foregroundColor: AppColors.primary,
                label: 'Start a Project',
                icon: Icons.arrow_forward_rounded,
                isPrimary: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 44),

        // Micro Metric Proof
        FadeSlideIn(
          delay: const Duration(milliseconds: 500),
          child: ConstrainedBox(
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
    return FadeSlideIn(
      delay: const Duration(milliseconds: 250),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Breathing Ambient Glow
          AnimatedBuilder(
            animation: _glowController,
            builder: (context, child) {
              final scale = 0.9 + (_glowController.value * 0.25);
              final opacity = 0.25 + (_glowController.value * 0.2);
              return Positioned(
                top: -30,
                right: -30,
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondaryFixed.withValues(alpha: opacity),
                    ),
                  ),
                ),
              );
            },
          ),

          Column(
            children: [
              // Dark Code Card with Hover Glow
              AnimatedHoverCard(
                backgroundColor: AppColors.primaryContainer,
                hoverBorderColor: AppColors.secondary.withValues(alpha: 0.5),
                normalShadows: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
                hoverShadows: [
                  BoxShadow(
                    color: AppColors.secondary.withValues(alpha: 0.25),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  ),
                ],
                padding: const EdgeInsets.all(22),
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

              // Telemetry Live Card with Animated Realtime Sparkline
              AnimatedHoverCard(
                backgroundColor: AppColors.surfaceContainerLowest,
                hoverBorderColor: AppColors.secondary.withValues(alpha: 0.4),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Double Pulsing Dot
                            AnimatedBuilder(
                              animation: _pulseController,
                              builder: (context, child) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.secondary.withValues(
                                          alpha: 0.3 * (1 - _pulseController.value),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: AppColors.secondary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                );
                              },
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

                    // Live Animated Sparkline Canvas
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: AnimatedBuilder(
                        animation: _waveController,
                        builder: (context, child) {
                          return CustomPaint(
                            painter: AnimatedSparklinePainter(
                              phase: _waveController.value * 2 * pi,
                            ),
                          );
                        },
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
                                    text: '$_liveThroughput req/s',
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
      ),
    );
  }
}

class _HoverButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;
  final IconData icon;
  final bool isPrimary;

  const _HoverButton({
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.label,
    required this.icon,
    required this.isPrimary,
  });

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered
                    ? AppColors.secondary.withValues(alpha: 0.9)
                    : AppColors.secondary)
                : (_isHovered
                    ? AppColors.surfaceContainerHigh
                    : AppColors.surfaceContainerLowest),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : (_isHovered ? AppColors.secondary : AppColors.surfaceContainerHighest),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.isPrimary
                    ? AppColors.secondary.withValues(alpha: _isHovered ? 0.4 : 0.25)
                    : Colors.black.withValues(alpha: _isHovered ? 0.08 : 0.03),
                blurRadius: _isHovered ? 14 : 8,
                offset: Offset(0, _isHovered ? 6 : 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: AppTextStyles.labelMd(
                  color: widget.foregroundColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                  _isHovered ? (widget.icon == Icons.arrow_downward_rounded ? 0 : 3) : 0,
                  _isHovered ? (widget.icon == Icons.arrow_downward_rounded ? 3 : 0) : 0,
                  0,
                ),
                child: Icon(
                  widget.icon,
                  size: 18,
                  color: widget.isPrimary ? widget.foregroundColor : AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSparklinePainter extends CustomPainter {
  final double phase;

  AnimatedSparklinePainter({required this.phase});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = AppColors.secondary.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    final path = Path();
    const int sampleCount = 60;
    final stepX = size.width / sampleCount;

    for (int i = 0; i <= sampleCount; i++) {
      final x = i * stepX;
      // Multi-sine wave function for realistic jittery telemetry
      final normX = i / sampleCount;
      final y = size.height * 0.55 +
          sin(normX * 4 * pi + phase) * (size.height * 0.22) +
          cos(normX * 8 * pi - phase * 1.5) * (size.height * 0.12) +
          sin(normX * 12 * pi + phase * 0.7) * (size.height * 0.06);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Draw stroke
    canvas.drawPath(path, strokePaint);

    // Draw gradient fill
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant AnimatedSparklinePainter oldDelegate) =>
      oldDelegate.phase != phase;
}
