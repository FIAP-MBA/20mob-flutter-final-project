import 'package:flutter_20mob_project_final/app/bloc/profile_controller.dart';
import 'package:flutter_20mob_project_final/app/models/profile_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/profile_repository.dart';

class ProfileBloc {
  ProfileRepository repository;
  getLocalProfile() async {
    try {
      ProfileModel profile = await repository.getProfile();
      if(profile == null) {
        profile = ProfileModel(1, "Insira seu nome", "Insira seu email");
      }
      ProfileController.instance.changeProfile(profile);
      print(profile);
    } catch (error) {
      print(error);
    }
  }

  insertLocalProfile(String name, String email, int position) async {
    try {
      ProfileModel profile = ProfileModel(position, name, email);
      repository.insertProfile(profile);
    } catch (error) {
      print(error);
    }
  }
}

final profileBloc = ProfileBloc();
