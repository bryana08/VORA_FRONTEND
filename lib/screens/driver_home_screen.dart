ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(
      context,
      AppRoutes.driverValidation,
      arguments: {
        'rideId': '12345',
        'destination': 'Marché Mokolo',
        'amount': 500,
      },
    );
  },
  child: const Text('Accepter la course'),
)
