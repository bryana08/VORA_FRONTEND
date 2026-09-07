import '../services/api_client.dart';

ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
  onPressed: () async {
    // Alerte immédiate transmise à l'API
    final success = await ApiClient.triggerSOS("12345");

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
              ? 'ALERTE SOS ENVOYÉE AUX CONTACTS ET SERVICES D\'URGENCE !'
              : 'Erreur lors de l\'envoi de l\'alerte SOS.'
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  },
  child: const Text('BOUTON SOS'),
)
