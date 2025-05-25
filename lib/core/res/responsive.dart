import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  final Widget? extraLargeScreen;
  final Widget? largeMobile;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.extraLargeScreen,
    this.largeMobile,
  });

  // screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static bool isExtraLargeScreen(BuildContext context) =>
      MediaQuery.sizeOf(context).width > 1400;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 1400 && extraLargeScreen != null) {
      return SafeArea(child: extraLargeScreen!);
    } else if (size.width >= 1080) {
      return SafeArea(child: desktop);
    } else if (size.width >= 700) {
      return SafeArea(child: tablet);
    } else if (size.width >= 500 && largeMobile != null) {
      return SafeArea(child: largeMobile!);
    } else {
      return SafeArea(child: mobile);
    }
  }
}
