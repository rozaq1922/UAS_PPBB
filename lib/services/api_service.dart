import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uas_prak/models/pertandingan_model.dart';
import 'package:uas_prak/models/stadium_model.dart';

class ApiService {
  final String apiUrlPertandingan =
      'https://f888-2001-448a-6040-25a4-e17e-f52f-abc2-f9c9.ngrok-free.app/api/v1/rutes';
  final String apiUrlStadium =
      'https://f888-2001-448a-6040-25a4-e17e-f52f-abc2-f9c9.ngrok-free.app/api/v1/transportasis';

  Future<List<Pertandingan>> getPertandingan() async {
    try {
      final response = await http.get(Uri.parse(apiUrlPertandingan));
      _handleStatusCode(response);
      final responseBody = jsonDecode(response.body);
      print(
          'Response Body: $responseBody'); // Tambahkan baris ini untuk debugging
      if (responseBody is List) {
        return responseBody.map((item) => Pertandingan.fromJson(item)).toList();
      } else if (responseBody is Map<String, dynamic>) {
        return [Pertandingan.fromJson(responseBody)];
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<List<Stadium>> getStadium() async {
    try {
      final response = await http.get(Uri.parse(apiUrlStadium));
      _handleStatusCode(response);
      final responseBody = jsonDecode(response.body);
      print(
          'Response Body: $responseBody'); // Tambahkan baris ini untuk debugging
      if (responseBody is List) {
        return responseBody.map((item) => Stadium.fromJson(item)).toList();
      } else if (responseBody is Map<String, dynamic>) {
        return [Stadium.fromJson(responseBody)];
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleStatusCode(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  void _handleError(dynamic e) {
    print('Error: $e');
  }
}
