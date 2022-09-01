import 'package:equatable/equatable.dart';

class VendorProfile extends Equatable {
  final String id;
  final String userId;
  final String name;
  final String? facebookId;
  final String? country;
  final String? address;
  final String? instagramId;
  final String? logo;
  final String? phone;
  final String? createdAt;
  final String? status;
  final List<dynamic>? services;
  final VendorUser? user;

  const VendorProfile({
    required this.id,
    required this.userId,
    required this.name,
    required this.facebookId,
    required this.country,
    required this.address,
    required this.instagramId,
    required this.logo,
    required this.phone,
    required this.createdAt,
    required this.status,
    required this.services,
    required this.user,
  });

  VendorProfile copyWith({
    String? id,
    String? userId,
    String? name,
    String? facebookId,
    String? country,
    String? address,
    String? instagramId,
    String? logo,
    String? phone,
    String? createdAt,
    String? status,
    List<String>? services,
    VendorUser? user,
  }) =>
      VendorProfile(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        facebookId: facebookId ?? this.facebookId,
        country: country ?? this.country,
        address: address ?? this.address,
        instagramId: instagramId ?? this.instagramId,
        logo: logo ?? this.logo,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        status: status ?? this.status,
        services: services ?? this.services,
        user: user ?? this.user,
      );

  factory VendorProfile.fromJson(Map<String, dynamic> json) => VendorProfile(
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        facebookId: json["facebookId"],
        country: json["country"],
        address: json["address"],
        instagramId: json["instagramId"],
        logo: json["logo"],
        phone: json["phone"],
        createdAt: json["createdAt"],
        status: json["status"],
        services: json["services"],
        user: VendorUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'name': name,
        'facebookId': facebookId,
        'country': country,
        'instagramId': instagramId,
        'logo': logo,
        'phone': phone,
        'createdAt': createdAt,
        'status': status,
        'services': services,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        facebookId,
        country,
        address,
        logo,
        phone,
        createdAt,
        status,
        services,
        user
      ];
}

class VendorUser extends Equatable {
  final String id;
  final String fullName;
  final String? email;

  const VendorUser({
    required this.id,
    required this.fullName,
    required this.email,
  });

  VendorUser copyWith({
    String? id,
    String? fullName,
    String? email,
  }) =>
      VendorUser(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
      );

  factory VendorUser.fromJson(Map<String, dynamic> json) => VendorUser(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'fullName': fullName,
        'email': email,
      };

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
      ];
}
