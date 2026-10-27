import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AnimatedHoverCard extends StatefulWidget {
  final Widget child;
  final double liftOffset;
  final Color? hoverBorderColor;
  final Color? normalBorderColor;
  final double borderRadius;
  final Color? backgroundColor;
  final List<BoxShadow>? normalShadows;
  final List<BoxShadow>? hoverShadows;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const AnimatedHoverCard({
    super.key,
    required this.child,
    this.liftOffset = -6.0,
    this.hoverBorderColor,
    this.normalBorderColor,
    this.borderRadius = 16.0,
    this.backgroundColor,
    this.normalShadows,
    this.hoverShadows,
    this.padding,
    this.onTap,
  });

  @override
  State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
}

class _AnimatedHoverCardState extends State<AnimatedHoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final defaultNormalShadows = [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.03),
        blurRadius: 10,
        offset: const Offset(0, 2),
      ),
    ];

    final defaultHoverShadows = [
      BoxShadow(
        color: (widget.hoverBorderColor ?? AppColors.secondary).withValues(alpha: 0.12),
        blurRadius: 24,
        offset: const Offset(0, 10),
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 16,
        offset: const Offset(0, 4),
      ),
    ];

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _isHovered ? widget.liftOffset : 0, 0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: _isHovered
                  ? (widget.hoverBorderColor ?? AppColors.secondary.withValues(alpha: 0.35))
                  : (widget.normalBorderColor ?? Colors.transparent),
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? (widget.hoverShadows ?? defaultHoverShadows)
                : (widget.normalShadows ?? defaultNormalShadows),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
