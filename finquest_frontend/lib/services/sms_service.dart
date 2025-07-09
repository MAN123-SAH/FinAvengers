import 'dart:convert';
import 'package:http/http.dart' as http;

class SmsService {
  final String apiUrl = 'https://your-backend.com/api/parse-sms'; // 🔁 Replace with actual URL

  // Function to fetch parsed SMS transaction data
  Future<List<Map<String, dynamic>>> fetchSmsTransactions() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map<Map<String, dynamic>>((tx) => tx as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      print('SMS API Error: $e');
      return [];
    }
  }
}
