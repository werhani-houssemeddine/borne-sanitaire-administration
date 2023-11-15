//! This file is only for developement purpose and will be removed in future version
//! this will contain the user token and information and global state also

class User {
  final String token;
  final String email;
  final String username;
  final String phoneNumber;

  User({
    required this.token,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  Map<String, String> value() {
    return {
      'email': email,
      'token': token,
      'username': username,
      'phoneNumber': phoneNumber
    };
  }
}

class MySingleton {
  static MySingleton? _instance;
  late User user;

  MySingleton._internal(this.user);

  static User get getUserInstance => _instance!.user;

  factory MySingleton(User user) {
    _instance ??= MySingleton._internal(user);
    return _instance!;
  }
}
