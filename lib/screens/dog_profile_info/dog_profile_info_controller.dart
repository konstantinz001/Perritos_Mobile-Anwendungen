import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
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
  Widget topTitles(double value, TitleMeta meta) {
    List<String> titles = [
      "5",
      "2",
      "4",
      "3",
      "3",
      "4",
      "0",
      "4",
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
  double getWalkingData(WeekDay weekDay) {
    switch (weekDay) {
      case WeekDay.monday:
        return 1;
      case WeekDay.tuesday:
        return 4;
      case WeekDay.wednesday:
        return 4;
      case WeekDay.thursday:
        return 3;
      case WeekDay.friday:
        return 1;
      case WeekDay.saturday:
        return 4;
      case WeekDay.sunday:
        return 3;
    }
  }
}
