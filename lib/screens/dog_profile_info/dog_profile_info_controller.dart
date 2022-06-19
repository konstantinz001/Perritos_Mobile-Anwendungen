import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/common/models/actions/action_walking_model.dart';
import 'package:flutter_application/common/models/statistics/weekday_data.model.dart';
import 'package:flutter_application/common/models/users/dog_model.dart';
import 'package:flutter_application/common/models/users/user_model.dart';
import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_model.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_view.dart';

class DogProfileInfoImplementation extends DogProfileInfoController {
  final DatabaseService _databaseService;
  final DogModel _dog;

  DogProfileInfoImplementation({
    required DatabaseService databaseService,
    required DogModel dog,
    DogProfileModel? model,
  })  : _dog = dog,
        _databaseService = databaseService,
        super(model ?? DogProfileModel(dog: dog));

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

  @override
  Future<List<DogModel>> loadAllDogsFromDB(String email) async {
    return await _databaseService.getAllDogs(emailID: email);
  }

  @override
  Future<DogModel> loadDogFromDB(String email, List<String> dogName) async {
    if (dogName.length <= 1) {
      var dogList = await _databaseService.getAllDogs(emailID: email);
      try {
        return dogList.firstWhere((dog) => dog.name == dogName[0]);
      } catch (e) {
        return DogModel(
            email, "Perritos", false, "", "", "", Timestamp.now(), "");
      }
    } else {
      return DogModel(
          email, "Perritos", false, "", "", "", Timestamp.now(), "");
    }
  }

  @override
  Future<List<UserModel>> loadAllUsersFromDB(String email) async {
    return await _databaseService.getAllUsers(emailID: email);
  }

  @override
  Widget bottomTitles(double value, TitleMeta meta) {
    List<String> titles = [
      "Mo",
      "Mo",
      "Di",
      "Mi",
      "Do",
      "Fr",
      "Sa",
      "So",
    ];

    Widget text = Text(
      titles[value.toInt()],
      style: perritosParagon,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5, //margin top
      child: text,
    );
  }

  @override
  Future<WeekdayDataModel> getWalkingData(
      String email, DogModel? dog, bool? perritos) async {
    List<ActionWalkingModel> actionWalkings =
        await _databaseService.getAllActionWalkings(emailID: email);

    bool perrito = (perritos == null || perritos == false) ? false : true;
    String dogName = (dog == null) ? '' : dog.name;

    //monday:
    List<double> mondaysData = [];
    double mondayAverage = 0;

    actionWalkings
        .where((walking) => perrito
            ? walking.begin.toDate().weekday == DateTime.monday
            : walking.begin.toDate().weekday == DateTime.monday &&
                walking.dogs.contains(dogName))
        .forEach((mondayWalking) {
      mondaysData.add(mondayWalking.end
          .toDate()
          .difference(mondayWalking.begin.toDate())
          .inHours
          .toDouble());
    });
    mondayAverage = (mondaysData.isEmpty)
        ? 0
        : (mondaysData.reduce((a, b) => a + b) / mondaysData.length);

    //tuesday:
    List<double> tuesdayData = [];
    double tuesdayAverage = 0;

    actionWalkings
        .where((walking) => perrito
            ? walking.begin.toDate().weekday == DateTime.tuesday
            : walking.begin.toDate().weekday == DateTime.tuesday &&
                walking.dogs.contains(dogName))
        .forEach((tuesdayWalking) {
      tuesdayData.add(tuesdayWalking.end
          .toDate()
          .difference(tuesdayWalking.begin.toDate())
          .inHours
          .toDouble());
    });
    tuesdayAverage = (tuesdayData.isEmpty)
        ? 0
        : (tuesdayData.reduce((a, b) => a + b) / tuesdayData.length);

    //wednesday:
    List<double> wednesdayData = [];
    double wednesdayAverage = 0;

    actionWalkings
        .where((walking) => perrito
            ? walking.begin.toDate().weekday == DateTime.wednesday
            : walking.begin.toDate().weekday == DateTime.wednesday &&
                walking.dogs.contains(dogName))
        .forEach((wednesdayWalking) {
      wednesdayData.add(wednesdayWalking.end
          .toDate()
          .difference(wednesdayWalking.begin.toDate())
          .inHours
          .toDouble());
    });
    wednesdayAverage = (wednesdayData.isEmpty)
        ? 0
        : (wednesdayData.reduce((a, b) => a + b) / wednesdayData.length);

    //thursday:
    List<double> thursdayData = [];
    double thursdayAverage = 0;

    actionWalkings
        .where((walking) => perrito
            ? walking.begin.toDate().weekday == DateTime.thursday
            : walking.begin.toDate().weekday == DateTime.thursday &&
                walking.dogs.contains(dogName))
        .forEach((thursdayWalking) {
      thursdayData.add(thursdayWalking.end
          .toDate()
          .difference(thursdayWalking.begin.toDate())
          .inHours
          .toDouble());
    });
    thursdayAverage = (thursdayData.isEmpty)
        ? 0
        : (thursdayData.reduce((a, b) => a + b) / thursdayData.length);

    //friday:
    List<double> fridayData = [];
    double fridayAverage = 0;

    actionWalkings
        .where((walking) => perrito
            ? walking.begin.toDate().weekday == DateTime.friday
            : walking.begin.toDate().weekday == DateTime.friday &&
                walking.dogs.contains(dogName))
        .forEach((fridayWalking) {
      fridayData.add(fridayWalking.end
          .toDate()
          .difference(fridayWalking.begin.toDate())
          .inHours
          .toDouble());
    });
    fridayAverage = (fridayData.isEmpty)
        ? 0
        : (fridayData.reduce((a, b) => a + b) / fridayData.length);

    //saturday:
    List<double> saturdayData = [];
    double saturdayAverage = 0;

    actionWalkings
        .where((walking) => perrito
            ? walking.begin.toDate().weekday == DateTime.saturday
            : walking.begin.toDate().weekday == DateTime.saturday &&
                walking.dogs.contains(dogName))
        .forEach((saturdayWalking) {
      saturdayData.add(saturdayWalking.end
          .toDate()
          .difference(saturdayWalking.begin.toDate())
          .inHours
          .toDouble());
    });
    saturdayAverage = (saturdayData.isEmpty)
        ? 0
        : (saturdayData.reduce((a, b) => a + b) / saturdayData.length);

    //sunday:
    List<double> sundayData = [];
    double sundayAverage = 0;

    actionWalkings
        .where((walking) => perrito
            ? walking.begin.toDate().weekday == DateTime.sunday
            : walking.begin.toDate().weekday == DateTime.sunday &&
                walking.dogs.contains(dogName))
        .forEach((sundayWalking) {
      sundayData.add(sundayWalking.end
          .toDate()
          .difference(sundayWalking.begin.toDate())
          .inHours
          .toDouble());
    });
    sundayAverage = (sundayData.isEmpty)
        ? 0
        : (sundayData.reduce((a, b) => a + b) / sundayData.length);

    return WeekdayDataModel(mondayAverage, tuesdayAverage, wednesdayAverage,
        thursdayAverage, fridayAverage, saturdayAverage, sundayAverage);
  }
}
