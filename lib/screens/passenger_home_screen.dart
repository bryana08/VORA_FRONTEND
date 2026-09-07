import '../services/voice_service.dart';

// Dans l'action du bouton Micro VORA Voice :
IconButton(
  icon: const Icon(Icons.mic, color: Color(0xFF10B981)), // Vert Émeraude
  onPressed: () async {
    // Simulation d'une commande vocale transmise
    final result = await VoiceService.processVoiceCommand("Trouve-moi un covoiturage pour Mokolo");
   
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('VORA AI: $result')),
      );
    }
  },
)
