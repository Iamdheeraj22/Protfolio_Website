import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_outline.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';

class ZoomAnimations extends StatefulWidget {
  const ZoomAnimations({super.key});

  @override
  State<ZoomAnimations> createState() => _ZoomAnimationsState();
}

class _ZoomAnimationsState extends State<ZoomAnimations>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late Animation sizeAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    sizeAnimation = Tween(begin: 0.0, end: 0.2).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.40, 0.75, curve: Curves.easeOut)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    //
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double width = UI.width!;
    double baseSize = Responsive.isDesktop(context)
        ? width / 6
        : Responsive.isTablet(context)
            ? width / 4.5
            : width / 3.6;

    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          child: SizedBox(
            width: baseSize,
            height: baseSize,
            child: RepaintBoundary(
              child: Stack(
                children: [
                  // Glow Effect
                  if (_isHovered)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: theme.primaryColor.withValues(alpha: 0.5),
                              blurRadius: 30,
                              spreadRadius: 10,
                            ),
                            BoxShadow(
                              color: theme.secondaryColor.withValues(alpha: 0.3),
                              blurRadius: 40,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  AlignTransition(
                    alignment: _alignAnimation,
                    child: CustomOutline(
                      strokeWidth: AppDimensions.normalize(2),
                      radius: baseSize * 0.8,
                      padding: const EdgeInsets.all(5),
                      width: baseSize * (sizeAnimation.value * 5),
                      height: baseSize * (sizeAnimation.value * 5),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            theme.secondaryColor,
                            theme.secondaryColor.withValues(alpha: 0),
                            theme.primaryColor.withValues(alpha: 0.1),
                            theme.primaryColor
                          ],
                          stops: const [
                            0.2,
                            0.4,
                            0.6,
                            1
                          ]),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withValues(alpha: 0.8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: NetworkImage(
                                'https://raw.githubusercontent.com/Iamdheeraj22/Protfolio_Website/refs/heads/main/assets/imgs/IMG_0107.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
