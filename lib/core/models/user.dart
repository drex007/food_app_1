import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String? email;
  final String? authStatus;
  final String? token;
  final String? lock;
  final String? userType;
  final bool? emailVerified;
  final bool? verified;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.authStatus,
    required this.token,
    required this.lock,
    required this.userType,
    required this.emailVerified,
    required this.verified,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? authStatus,
    String? token,
    String? lock,
    String? userType,
    bool? emailVerified,
    bool? verified,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        authStatus: authStatus ?? this.authStatus,
        token: token ?? this.token,
        lock: lock ?? this.lock,
        userType: userType ?? this.userType,
        emailVerified: emailVerified ?? this.emailVerified,
        verified: verified ?? this.verified,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        authStatus: json["authStatus"],
        token: json["token"],
        lock: json["lock"],
        userType: json["userType"],
        emailVerified: json["emailVerified"].toString().toLowerCase() == 'true' ,
        verified: json["verified"].toString().toLowerCase() == 'true',
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'authStatus': authStatus,
        'token': token,
        'lock': lock,
        'userType': userType,
        'emailVerified': emailVerified,
        'verified': verified,
      };

  @override
  List<Object?> get props => [id, firstName, lastName, email, authStatus, lock, userType, emailVerified, verified];
}
