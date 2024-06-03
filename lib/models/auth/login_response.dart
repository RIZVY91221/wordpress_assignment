import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 1)
class LoginResponse extends HiveObject {
  @HiveField(0)
  String? token;
  @HiveField(1)
  String? userEmail;
  @HiveField(2)
  String? userNicename;
  @HiveField(3)
  String? userDisplayName;

  LoginResponse({this.token, this.userEmail, this.userNicename, this.userDisplayName});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
