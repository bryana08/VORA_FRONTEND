import '../services/api_client.dart';

// Dans ton widget de saisie du code :
final TextEditingController codeController = TextEditingController();

ElevatedButton(
  onPressed: () async {
    final codeInput = codeController.text;
    const rideId = "12345"; // Ou récupéré depuis widget.rideData

    // Appel au backend FastAPI pour débloquer les fonds
    final isValid = await ApiClient.validateCode(rideId, codeInput);

    if (isValid && context.mounted) {
      // Succès : Afficher un message et retourner à l'accueil
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Paiement Débloqué avec Succès !')),
      );
      Navigator.pushReplacementNamed(context, AppRoutes.driverHome);
    } else if (context.mounted) {
      // Erreur de code
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Code Invalide. Réessayez.')),
      );
    }
  },
  child: const Text('Valider & Débloquer Paiement'),
)
