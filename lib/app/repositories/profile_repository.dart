import 'package:flutter_20mob_project_final/app/models/profile_model.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/app_database.dart';
import 'package:flutter_20mob_project_final/app/repositories/db/profile_dao.dart';

class ProfileRepository {
  final AppDatabase _database;
  ProfileModelDao _profileModelDao;

  ProfileRepository(this._database) {
    _profileModelDao = _database.profileModelDao;
  }
  Future<ProfileModel> getProfile() {
    if (_database != null && _profileModelDao != null) {
      return _profileModelDao.findBy(0);
    }
    return null;
  }

  Future<int> insertProfile(ProfileModel profile) {
    if (_database != null && _profileModelDao != null) {
      _profileModelDao.insertProfile(profile);
    }
    return null;
  }
}