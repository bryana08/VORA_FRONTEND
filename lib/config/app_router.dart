import 'package:flutter/material.dart';
import 'app_routes.dart';

import '../screens/onboarding_screen.dart';
import '../screens/profile_choice_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/driver_signup_screen.dart';
import '../screens/home_screen.dart';
import '../screens/price_negotiation_screen.dart';
import '../screens/ride_in_progress_screen.dart';
import '../screens/driver_home_screen.dart';
import '../screens/driver_validate_arrival_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.roleSelection:
        return MaterialPageRoute(builder: (_) => const ProfileChoiceScreen());
      case AppRoutes.registerPassenger:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.registerDriver:
        return MaterialPageRoute(builder: (_) => const DriverSignupScreen());
      case AppRoutes.passengerHome:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.rideNegotiation:
        return MaterialPageRoute(builder: (_) => const PriceNegotiationScreen());
      case AppRoutes.passengerActiveRide:
        return MaterialPageRoute(builder: (_) => const RideInProgressScreen());
      case AppRoutes.driverHome:
        return MaterialPageRoute(builder: (_) => const DriverHomeScreen());
      case AppRoutes.driverValidation:
        return MaterialPageRoute(builder: (_) => const DriverValidateArrivalScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Route inconnue : ${settings.name}'))),
        );
    }
  }
}
