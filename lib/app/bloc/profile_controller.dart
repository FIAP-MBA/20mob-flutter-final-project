
import 'package:flutter/material.dart';
import 'package:flutter_20mob_project_final/app/models/profile_model.dart';

class ProfileController extends ChangeNotifier {
  static ProfileController instance = ProfileController();

  ProfileModel profile;

  changeProfile(ProfileModel profile) {
    this.profile = profile;
    notifyListeners();
  }
}