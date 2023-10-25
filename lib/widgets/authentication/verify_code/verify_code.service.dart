import 'dart:convert';
import 'package:http/http.dart' as http;

Future _sendCode(Object? body) async {
  try {
    var client = http.Client();
    Uri serverURL =
        Uri.http('localhost:8000', '/administration/code-verification/');
    return client.post(serverURL, body: body);
  } catch (e) {
    return null;
  }
}

Future<String> sendVerificationCode(String code) async {
  var response = await _sendCode({'verification_code': code});

  /*if (loginResponse == null) {
    return "SERVER UNREACHED";
  }*/

  //! This will be represented in a class in future version
  int statusCode = response.statusCode;
  final data = json.decode(response.body);

  var error = data["error"];
  var state = data["state"];
  var message = data["message"];
  var responseData = data["data"];

  print(data);

  if (statusCode >= 200 && statusCode < 300) {
    if (error == false && state.toUpperCase() == "FAILURE") {
      //? Check if user is blocked
      if (responseData['is_blocked'] == true) {
        return "BLOCKED";
      } else {
        return "NOT BLOCKED";
      }
    } else if (error == false && state.toUpperCase() == "SUCCESS") {
      /*if (responseData['token'] != null) {
        return "SUCCESS";
      }*/
      return "SUCCESS";
    }

    return "UNKNOWN ERROR";
  } else if (statusCode >= 500) {
    return "INTERNAL SERVER ERROR";
  } else if (statusCode == 403) {
    return "BLOCKED";
  } else {
    return message; // "BAD REQUEST"
  }
}
