import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  // IP pour l'émulateur Android (ou ton IP locale 192.168.x.x pour téléphone physique)
  static const String baseUrl = "http://10.0.2.2:8000/api/v1";

  // Inscription
  static Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );
    return jsonDecode(response.body);
  }

  // Demande de course
  static Future<Map<String, dynamic>> createRide(Map<String, dynamic> rideData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/rides/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(rideData),
    );
    return jsonDecode(response.body);
  }

  // Validation Code Ticket (Chauffeur)
  static Future<bool> validateCode(String rideId, String code) async {
    final response = await http.post(
      Uri.parse('$baseUrl/rides/$rideId/validate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'ticket_code': code}),
    );
    return response.statusCode == 200;
  }
}
