import 'package:flutter/material.dart';
import '../onboarding/onboarding.dart';
import '../planned_meds/planned_meds.dart';
import '../resources/strings_manager.dart';
import '../schedule_activity/schedule_activity.dart';
import '../schedule_meds/schedule_meds.dart';
import '../splash/splash.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String plannedMeds = '/plannedMeds';
  static const String scheduleMed = '/scheduleMed';
  static const String scheduleActivity = '/scheduleActivity';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.plannedMeds:
        return MaterialPageRoute(builder: (_) => const PlannedMedsView());
      case Routes.scheduleMed:
        return MaterialPageRoute(builder: (_) => const ScheduleMedsView());
      case Routes.scheduleActivity:
        return MaterialPageRoute(builder: (_) => const ScheduleActivityView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text(StringManager.undefinedRoute),
              ),
            ));
  }
}
