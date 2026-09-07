import 'package:flutter/material.dart';
import 'app_routes.dart';

// Imports Passager
import '../screens/passenger_home_screen.dart';
import '../screens/ride_negotiation_screen.dart';

// Imports Chauffeur (ajuste les noms de fichiers selon ton projet)
import '../screens/driver_home_screen.dart';
import '../screens/driver_validation_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.passengerHome:
        return MaterialPageRoute(builder: (_) => const PassengerHomeScreen());

      case AppRoutes.rideNegotiation:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => RideNegotiationScreen(rideData: args),
        );

      // --- NOUVEAUX ÉCRANS CHAUFFEUR ---
      case AppRoutes.driverHome:
        return MaterialPageRoute(builder: (_) => const DriverHomeScreen());

      case AppRoutes.driverValidation:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => DriverValidationScreen(rideData: args),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route non trouvée : ${settings.name}'),
            ),
          ),
        );
    }
  }
}

