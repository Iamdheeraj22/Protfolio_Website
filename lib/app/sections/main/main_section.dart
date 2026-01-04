import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/analytics_tracking/analytics_tracking.dart';
import 'package:mysite/app/sections/projects/projects.dart';
import 'package:mysite/app/utils/navbar_utils.dart';
import 'package:mysite/app/utils/utils.dart';
import 'package:mysite/app/widgets/arrow_on_top.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';
import 'package:mysite/app/widgets/navbar_actions_button.dart';
import 'package:mysite/app/widgets/navbar_logo.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/core/apis/links.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/app.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/providers/drawer_provider.dart';
import 'package:mysite/core/providers/scroll_provider.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/theme/cubit/theme_cubit.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';

import '../../../core/configs/connection/bloc/connected_bloc.dart';

part 'widgets/_body.dart';
part 'widgets/_mobile_drawer.dart';
part 'widgets/_navbar_desktop.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final state = context.read<ConnectedBloc>().state;
      var analytics = <String, Object>{};
      if (!kIsWeb) {
        if (Platform.isAndroid) {
          analytics.addAll({"platform": "android"});
        }
        if (Platform.isIOS) {
          analytics.addAll({"platform": "ios"});
        }
        if (Platform.isLinux) {
          analytics.addAll({"platform": "linux"});
        }
        if (Platform.isWindows) {
          analytics.addAll({"platform": "windows"});
        }
        if (Platform.isMacOS) {
          analytics.addAll({"platform": "macos"});
        }
        if (state is ConnectedFailureState) {
          analytics.addAll({"connection": "failed"});
        }
        analytics.addAll({"version": Platform.version});
      } else {
        analytics.addAll({"platform": "web"});
      }

      await AnalyticsTracking.logOtherEvent(
          name: "systemInfo", section: analytics);
    });
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Responsive(
          desktop: _NavbarDesktop(),
          largeMobile: _NavBarTablet(),
          mobile: _NavBarTablet(),
          tablet: _NavBarTablet(),
        ),
      ),
      drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                top: height * 0.2,
                left: -88,
                child: Container(
                  height: height / 3,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -100,
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor.withValues(alpha: 0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 500,
                      sigmaY: 500,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              if (!state.isDarkThemeOn)
                Align(
                  alignment: Alignment.center,
                  // BG01.png
                  child: Image.network(
                    'https://raw.githubusercontent.com/Iamdheeraj22/Protfolio_Website/refs/heads/main/assets/imgs/5424482.png',
                    opacity: const AlwaysStoppedAnimation<double>(0.2),
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              _Body(),
              const ArrowOnTop()
            ],
          );
        },
      ),
    );
  }
}
