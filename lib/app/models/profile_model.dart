import 'package:floor/floor.dart';

@entity
class ProfileModel {

  @primaryKey
  int _id = 0;
  final int positionImage;
  final String name;
  final String email;

  ProfileModel(this.positionImage, this.name, this.email);

  Map<String, dynamic> toJson() {
    return {
      'id' : _id,
      'positionImage' : positionImage,
      'name' : name,
      'email' : email,
    };
  }
}