import 'package:floor/floor.dart';
import 'package:flutter_20mob_project_final/app/models/profile_model.dart';

@dao
abstract class ProfileModelDao {
  @Query("SELECT * FROM ProfileModel WHERE id = :id")
  Future<ProfileModel> findBy(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertProfile(ProfileModel profile);
}
