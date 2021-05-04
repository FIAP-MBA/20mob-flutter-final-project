import 'package:floor/floor.dart';

@entity
class ProfileModel {

  @primaryKey
  int id = 0;
  final int positionImage;
  final String name;
  final String email;

  ProfileModel(this.positionImage, this.name, this.email);

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'positionImage' : positionImage,
      'name' : name,
      'email' : email,
    };
  }
}