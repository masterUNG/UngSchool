import 'dart:convert';

class AuthenModel {
  final int id;
  final int user_id;
  final String user_login;
  final String api_pass;
  final int user_activation;
  final int user_status;
  AuthenModel({
    required this.id,
    required this.user_id,
    required this.user_login,
    required this.api_pass,
    required this.user_activation,
    required this.user_status,
  });

  AuthenModel copyWith({
    int? id,
    int? user_id,
    String? user_login,
    String? api_pass,
    int? user_activation,
    int? user_status,
  }) {
    return AuthenModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      user_login: user_login ?? this.user_login,
      api_pass: api_pass ?? this.api_pass,
      user_activation: user_activation ?? this.user_activation,
      user_status: user_status ?? this.user_status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'user_login': user_login,
      'api_pass': api_pass,
      'user_activation': user_activation,
      'user_status': user_status,
    };
  }

  factory AuthenModel.fromMap(Map<String, dynamic> map) {
    return AuthenModel(
      id: map['id'],
      user_id: map['user_id'],
      user_login: map['user_login'],
      api_pass: map['api_pass'],
      user_activation: map['user_activation'],
      user_status: map['user_status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenModel.fromJson(String source) => AuthenModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthenModel(id: $id, user_id: $user_id, user_login: $user_login, api_pass: $api_pass, user_activation: $user_activation, user_status: $user_status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthenModel &&
      other.id == id &&
      other.user_id == user_id &&
      other.user_login == user_login &&
      other.api_pass == api_pass &&
      other.user_activation == user_activation &&
      other.user_status == user_status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      user_login.hashCode ^
      api_pass.hashCode ^
      user_activation.hashCode ^
      user_status.hashCode;
  }
}
