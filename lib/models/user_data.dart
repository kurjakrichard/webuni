import 'package:flutter/rendering.dart';

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final ImageProvider avatarProvider;

  const UserData(
      this.id, this.name, this.email, this.phone, this.avatarProvider);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          phone == other.phone &&
          avatarProvider == other.avatarProvider;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      avatarProvider.hashCode;
}
