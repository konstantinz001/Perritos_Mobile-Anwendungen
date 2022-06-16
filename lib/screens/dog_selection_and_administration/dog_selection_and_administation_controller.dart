import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/common/services/db_service.dart';
import 'package:flutter_application/common/models/dog_model.dart';
import 'package:flutter_application/screens/dog_selection_and_administration/dog_selection_and_administration_model.dart';
import 'package:flutter_application/screens/dog_selection_and_administration/dog_selection_and_administration_view.dart';

class DogSelectionAndAdministrationImplmentation
    extends DogSelectionAndAdministrationController {
  final DatabaseService _databaseService;

  DogSelectionAndAdministrationImplmentation(
      {required List<DogModel> dogs,
      required DatabaseService databaseService,
      DogSelectionAndAdministrationModel? model})
      : _databaseService = databaseService,
        super(model ??
            DogSelectionAndAdministrationModel(
              currentDogSelectionAndAdministrationScreen:
                  DogSelectionAndAdministration.kickoff,
              dogName: '',
              iconName: 'Icon_Dog',
              iconColor: 'perritosCharcoal',
              rasse: '',
              info: '',
              birthday: Timestamp.now(),
              dogList: dogs,
              editable: false,
            ));

  @override
  void switchCurrentDogSelectionAndAdministrationScreen(screen) {
    state = state.copyWith(currentDogSelectionAndAdministrationScreen: screen);
  }

  @override
  Future<void> addDog(DogModel dogModel) async {
    print(dogModel.info);
    await _databaseService.insertDog(
        emailID: dogModel.emailID,
        name: dogModel.name,
        iconName: dogModel.iconName,
        iconColor: dogModel.iconColor,
        info: dogModel.info,
        rasse: dogModel.rasse,
        birthday: dogModel.birthday);
  }

  @override
  Future<void> deleteDog(DogModel dogModel) async {
    await _databaseService.deleteDog(
        emailID: dogModel.emailID, name: dogModel.name);
  }

  @override
  Future<void> updateDog(DogModel dogModel) async {
    print(dogModel.name);
    var currentDogName = getSelectedDog()!;
    await _databaseService.updateDog(
        emailID: dogModel.emailID,
        name: currentDogName.name,
        newName: dogModel.name,
        newIconName: dogModel.iconName,
        newIconColor: dogModel.iconColor,
        newBirthday: dogModel.birthday,
        newInfo: dogModel.info,
        newRasse: dogModel.rasse);
  }

  @override
  void setEditingName(String name) {
    state = state.copyWith(dogName: name);
  }

  @override
  void setEditingIconName(String iconName) {
    state = state.copyWith(iconName: iconName);
  }

  @override
  void setEditingIconColor(String iconColor) {
    state = state.copyWith(iconColor: iconColor);
  }

  @override
  void setEditingRasse(String rasse) {
    state = state.copyWith(rasse: rasse);
  }

  void setEditingBirthbday(Timestamp birthbday) {
    state = state.copyWith(birthday: birthbday);
  }

  void setEditingInfo(String info) {
    state = state.copyWith(info: info);
  }

  @override
  void setEditingDefault() {
    setEditingName('');
    setEditingIconName('Icon_Dog');
    setEditingIconColor('perritosCharcoal');
    setEditingRasse('');
    setEditingBirthbday(Timestamp.now());
    setEditingInfo('');
  }

  @override
  void changeEditability() {
    state = state.copyWith(editable: state.editable == true ? false : true);
  }

  @override
  void changeSelectedDog(DogModel dogModel) {
    int index =
        state.dogList.indexWhere((element) => element.name == dogModel.name);
    state = state.copyWith(
        dogList: List.from(state.dogList.toList())
          ..removeAt(index)
          ..insert(
              index,
              DogModel(
                  dogModel.emailID,
                  dogModel.name,
                  true,
                  dogModel.iconName,
                  dogModel.iconColor,
                  dogModel.rasse,
                  dogModel.birthday,
                  dogModel.info)));
  }

  @override
  DogModel? getSelectedDog() {
    int index = state.dogList
        .toList()
        .indexWhere((element) => element.selected == true);

    if (index >= 0) {
      return state.dogList[index];
    } else {
      return null;
    }
  }

  @override
  void disabledSelectedDog() {
    for (var dog in state.dogList) {
      if (dog.selected == true) {
        state = state.copyWith(
            dogList: List.from(state.dogList.toList())
              ..insert(
                  state.dogList
                      .toList()
                      .indexWhere((element) => element.name == dog.name),
                  DogModel(dog.emailID, dog.name, false, dog.iconName,
                      dog.iconColor, dog.rasse, dog.birthday, dog.info))
              ..removeAt(state.dogList
                      .toList()
                      .indexWhere((element) => element.selected == true) +
                  1));
      }
    }
  }

  @override
  Future<List<DogModel>> loadDogs(String email) async {
    return await _databaseService.getAllDogs(emailID: email);
  }
}
