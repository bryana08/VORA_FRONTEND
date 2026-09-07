import '../services/api_client.dart';

// Dans le bouton de confirmation :
ElevatedButton(
  onPressed: () async {
    final response = await ApiClient.createRide({
      "destination": "Marché Mokolo",
      "price": 500,
      "payment_mode": "MOMO_ESCROW",
    });

    if (context.mounted) {
      // Redirection vers l'écran de suivi de la course
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.passengerActiveRide,
      );
    }
  },
  child: const Text('Confirmer & Verrouiller Séquestre'),
)
