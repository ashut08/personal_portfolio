import 'dart:convert';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SenEmail {
  static Future<Response> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    Response response = http.Response("", 400);

    // Load from --dart-define in production, fallback to dotenv in local
    const String serviceID =
        String.fromEnvironment('SERVICE_ID', defaultValue: '');
    const String templateID =
        String.fromEnvironment('TEMPLATE_ID', defaultValue: '');
    const String userID = String.fromEnvironment('USER_ID', defaultValue: '');
    const String accessToken =
        String.fromEnvironment('ACCESS_TOKEN', defaultValue: '');

    final map = {
      'service_id': serviceID,
      'template_id': templateID,
      'user_id': userID,
      'accessToken': accessToken,
      'template_params': {
        'user_email': email,
        'user_name': name,
        'user_message': message,
      }
    };
    final body = json.encode(map);

    try {
      response = await http.post(
        Uri.parse("https://api.emailjs.com/api/v1.0/email/send"),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      dev.log(response.statusCode.toString());
      dev.log(response.body);

      return response;
    } catch (e) {
      dev.log(e.toString());
      return response;
    }
  }
}
