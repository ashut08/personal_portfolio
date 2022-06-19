import 'dart:convert';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:personal_portfolio/utils/emailjs_constant.dart';

class SenEmail {
  String url = "";
  static Future<Response> sendEmail(
      {required String name,
      required String email,
      required String message}) async {
    Response response = http.Response("", 400);
    final map = {
      'service_id': EmailJsConstant.serviceId,
      'template_id': EmailJsConstant.templateId,
      'user_id': EmailJsConstant.userId,
      'accessToken': EmailJsConstant.accessToken,
      'template_params': {
        'user_email': email,
        'user_name': name,
        'user_message': message
      }
    };
    final body = json.encode(map);

    try {
      response = await http.post(
          Uri.parse("https://api.emailjs.com/api/v1.0/email/send"),
          headers: {
            'Content-Type': 'application/json',
          },
          body: body);
      dev.log(response.statusCode.toString());
      dev.log(response.body);

      return response;
    } catch (e) {
      dev.log(
        e.toString(),
      );
      return response;
    }
  }
}
