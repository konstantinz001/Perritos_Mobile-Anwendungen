


import 'package:flutter_application/common/models/dog_model.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_model.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_view.dart';

import '../../common/services/db_service.dart';

const userName = "Alex";
const dogName = "dog1";
const email = "k@web.de";

class DogProfileInfoImplementation extends DogProfileInfoController {

  final DatabaseService _databaseService;
  final DogModel _dog;

  DogProfileInfoImplementation({
    required DatabaseService databaseService,
    required DogModel dog,
    DogProfileModel? model,
  })  : _dog = dog,
        _databaseService = databaseService,
        super(
        model ??
            DogProfileModel(dog: dog)
      );

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}