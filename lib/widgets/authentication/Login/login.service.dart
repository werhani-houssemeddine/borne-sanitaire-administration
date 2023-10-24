import 'package:http/http.dart' as http;

Future<String> submitForm(String email, String password) async {
  var client = http.Client();
  var response = await client.post(
      Uri.http('localhost:8000', '/administration/login/'),
      body: {'email': email, 'password': password});

  print(response.body);
  if (response.statusCode == 200) {
    print('data sent successfully');
  } else {
    print('error occurred while sending data to server');
  }
  if (response.body ==
      'Authentication done and verification code send successfully') {
    print('dooooone');
  }
  return response.body;
}
