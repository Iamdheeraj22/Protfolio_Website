import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/analytics_tracking/analytics_tracking.dart';
import 'package:mysite/app/sections/projects/bloc/projects_cubit.dart';
import 'package:mysite/app/sections/skills/controller/skill_controller.dart';
import 'package:mysite/core/configs/connection/bloc/connected_bloc.dart';
import 'package:mysite/core/configs/connection/network_check.dart';
import 'package:mysite/core/providers/drawer_provider.dart';
import 'package:mysite/core/providers/scroll_provider.dart';
import 'package:mysite/core/theme/app_theme.dart';
import 'package:mysite/core/theme/cubit/theme_cubit.dart';
import 'package:mysite/env/env.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Env.firebaseApiKey,
      authDomain: Env.firebaseAuthDomain,
      projectId: Env.firebaseProjectId,
      storageBucket: Env.firebaseStorageBucket,
      messagingSenderId: Env.firebaseMessagingSenderId,
      appId: Env.firebaseAppId,
      measurementId: Env.firebaseMeasurementId,
    ),
  );
  AnalyticsTracking.init();
  runApp(const PortfolioWeb());
}

class PortfolioWeb extends StatelessWidget {
  const PortfolioWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<ProjectsCubit>(create: (_) => ProjectsCubit()),
        BlocProvider<ConnectedBloc>(
            create: (context) => ConnectedBloc()..add(OnConnectedCheckEvent())),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DrawerProvider()),
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
          ChangeNotifierProvider(
              create: (_) => SkillController()..selectSkill(0)),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Sizer(
              builder: (context, orientation, deviceType) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Dheeraj Prajapat | Mobile Application Developer',
                  theme: AppTheme.themeData(state.isDarkThemeOn, context),
                  initialRoute: "/",
                  routes: {
                    "/": (context) => const NChecking(),
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
