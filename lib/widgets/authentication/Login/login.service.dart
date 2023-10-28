import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> submitForm(String email, String password) async {
  try {
    var loginResponse = await _LoginService.submitCredentials(email, password);
    var response = _LoginService.extractResponse(loginResponse);

    if (response['statusCode'] >= 200 && response['statusCode'] < 300) {
      if (response['state'] == 'FAILURE') {
        //! Return WRONG CREDENTIALS
        return response['message'];
      } else {
        //! Return SUCCESS
        return response['state'];
      }
    } else if (response['statusCode'] < 500) {
      if (response['message'] == "BAD REQUEST") {
        return response['details']; //! Return the error details
      }
      //! To handle other error format (Unauthorised ...)
      return response['details'] ?? response['message'];
    } else {
      return "INTERNAL SERVER ERROR";
    }
  } catch (e) {
    rethrow;
  }
}

class _LoginService {
  static submitCredentials(String email, String password) {
    var userCredentials = {'email': email, 'password': password};
    var client = http.Client();
    Uri serverURL = Uri.http('localhost:8000', '/administration/login/');

    return client.post(serverURL, body: userCredentials);
  }

  static extractResponse(response) {
    try {
      final int statusCode = response.statusCode;
      final data = json.decode(response.body);

      var error;
      var state;
      var message;
      var details;

      if (data["error"] != null) {
        error = data["error"];
      }

      if (data["state"] != null) {
        state = data["state"].toString().toUpperCase();
      }

      if (data["message"] != null) {
        message = data["message"];
      }

      if (data["data"] != null) {
        if (data["data"]["details"] != null) {
          details = data["data"]["details"];
        }
      }

      return {
        'statusCode': statusCode,
        'error': error,
        'state': state,
        'message': message,
        'details': details
      };
    } catch (e) {
      rethrow;
    }
  }
}
