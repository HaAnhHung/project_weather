import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resource/assets/app_assets.dart';
import '../resource/dimens/app_dimen.dart';

class AppLogo extends StatelessWidget {
  final double? size;
  final Color? color;
  final bool showText;
  final String? customText;
  final bool useRoundedStyle;

  const AppLogo({
    super.key,
    this.size,
    this.color,
    this.showText = false,
    this.customText,
    this.useRoundedStyle = true, // Default to iOS-style rounded
  });

  @override
  Widget build(BuildContext context) {
    final logoSize = size ?? AppDimen.current.logoSize();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo
        Container(
          width: logoSize,
          height: logoSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              useRoundedStyle ? logoSize * 0.22 : logoSize * 0.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.3),
                blurRadius: 12.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              useRoundedStyle ? logoSize * 0.22 : logoSize * 0.2,
            ),
            child: SvgPicture.asset(
              useRoundedStyle
                  ? AppAssets.weatherLogoRounded
                  : AppAssets.weatherLogo,
              width: logoSize,
              height: logoSize,
              colorFilter:
                  color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Text (optional)
        if (showText) ...[
          SizedBox(height: 12.h),
          Text(
            customText ?? 'Weather App',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: color ?? Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ],
    );
  }
}

// App Icon variant for smaller spaces
class AppIconMini extends StatelessWidget {
  final double? size;
  final Color? color;
  final bool useRoundedStyle;

  const AppIconMini({
    super.key,
    this.size,
    this.color,
    this.useRoundedStyle = true, // Default to iOS-style rounded
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = size ?? 40.w;

    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          useRoundedStyle ? iconSize * 0.22 : iconSize * 0.25,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          useRoundedStyle ? iconSize * 0.22 : iconSize * 0.25,
        ),
        child: SvgPicture.asset(
          useRoundedStyle
              ? AppAssets.weatherLogoRounded
              : AppAssets.weatherLogo,
          width: iconSize,
          height: iconSize,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// Animated logo for splash screens
class AnimatedAppLogo extends StatefulWidget {
  final double? size;
  final Duration duration;
  final VoidCallback? onAnimationComplete;
  final bool useRoundedStyle;

  const AnimatedAppLogo({
    super.key,
    this.size,
    this.duration = const Duration(milliseconds: 1500),
    this.onAnimationComplete,
    this.useRoundedStyle = true, // Default to iOS-style rounded
  });

  @override
  State<AnimatedAppLogo> createState() => _AnimatedAppLogoState();
}

class _AnimatedAppLogoState extends State<AnimatedAppLogo>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _rotateController;
  late AnimationController _fadeController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2),
      vsync: this,
    );

    _rotateController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 3),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    _startAnimation();
  }

  void _startAnimation() async {
    await _fadeController.forward();
    await _scaleController.forward();
    _rotateController.forward();

    if (widget.onAnimationComplete != null) {
      widget.onAnimationComplete!();
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotateController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _scaleAnimation,
        _rotateAnimation,
        _fadeAnimation,
      ]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotateAnimation.value * 0.1, // Subtle rotation
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: AppLogo(
                size: widget.size,
                showText: true,
                useRoundedStyle: widget.useRoundedStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
