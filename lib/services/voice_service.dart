import 'dart:convert';
import 'package:http/http.dart' as http;

class VoiceService {
  static const String baseUrl = "http://10.0.2.2:8000/api/v1";

  // Envoi d'une commande vocale texte ou audio au backend
  static Future<String> processVoiceCommand(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/ai/command'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'command': prompt}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] ?? 'Commande traitée avec succès.';
      }
      return 'Désolé, je n\'ai pas compris votre demande.';
    } catch (e) {
      return 'Erreur de connexion avec VORA AI.';
    }
  }
}

