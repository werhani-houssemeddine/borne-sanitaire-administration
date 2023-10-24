import 'dart:convert';
import 'package:http/http.dart' as http;

Future _sentFormData(Object? body) async {
  try {
    var client = http.Client();
    Uri serverURL = Uri.http('localhost:8000', '/administration/login/');
    return client.post(serverURL, body: body);
  } catch (e) {
    return null;
  }
}

Future<String> submitForm(String email, String password) async {
  var loginResponse =
      await _sentFormData({'email': email, 'password': password});

  /*if (loginResponse == null) {
    return "SERVER UNREACHED";
  }*/

  //! This will be represented in a class in future version
  int statusCode = loginResponse.statusCode;
  final data = json.decode(loginResponse.body);
  var error = data["error"];
  var state = data["state"];
  var message = data["message"];

  if (statusCode >= 200 && statusCode < 300) {
    //! the logic behind this API Is to send error and state to indicate
    //! if the request is made properly [error refers that the request in not valid]
    //! and state will indicate the if the request made successfully
    if (error == false && state == "FAILURE") {
      return "FAILURE";
    } else if (error == false && state == "SUCCESS") {
      return "SUCCESS";
    }

    return "UNKNOWN ERROR";
  } else if (statusCode >= 500) {
    return "INTERNAL SERVER ERROR";
  } else {
    return message; // "BAD REQUEST"
  }
}
