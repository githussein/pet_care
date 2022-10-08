import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/presentation/planned_meds/planned_meds.dart';
import 'package:pet_care/presentation/schedule_activity/schedule_activity.dart';
import 'package:pet_care/presentation/schedule_meds/schedule_meds.dart';
import 'package:pet_care/presentation/splash/splash.dart';

class Routes {
  static const String splash = '/';
  static const String plannedMeds = '/plannedMeds';
  static const String scheduleMed = '/scheduleMed';
  static const String scheduleActivity = '/scheduleActivity';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
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
                child: Text('We are lost here!'),
              ),
            ));
  }
}
