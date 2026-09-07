import 'package:flutter/material.dart';
import 'app_routes.dart';

// Importe tes écrans passager (ajuste les chemins selon tes fichiers)
import '../screens/passenger_home_screen.dart';
import '../screens/ride_negotiation_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.passengerHome:
        return MaterialPageRoute(builder: (_) => const PassengerHomeScreen());

      case AppRoutes.rideNegotiation:
        // Récupération des arguments transmis (destination, prix proposé, etc.)
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => RideNegotiationScreen(rideData: args),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route non trouvée : ${settings.name}'),
            ),
ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(
      context,
      AppRoutes.rideNegotiation,
      arguments: {
        'destination': 'Marché Mokolo',
        'estimatedPrice': 500,
        'mode': 'Covoiturage',
      },
    );
  },
  child: const Text('Rechercher un Taxi'),
)
          ),
        );
    }
  }
}
