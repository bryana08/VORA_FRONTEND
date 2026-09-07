ElevatedButton(
  onPressed: () async {
    // 1. Apport des données
    final userData = {
      "fullName": nameController.text,
      "phone": phoneController.text,
      "role": "PASSENGER",
    };

    // 2. Appel API FastAPI
    final response = await ApiClient.register(userData);

    // 3. Navigation vers l'accueil si succès
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.passengerHome);
    }
  },
  child: const Text('Créer mon compte'),
)
