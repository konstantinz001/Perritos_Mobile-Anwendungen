import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/assets/ui-components/navigation/perritos-navigation.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/common/models/dog_model.dart';
import 'package:flutter_application/common/models/user_model.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DogProfileInfoView extends ConsumerWidget {
  final String _emailID;
  final String _userName;
  final List<String> _dogName;
  final DogModel _dog;

  const DogProfileInfoView(
      {Key? key,
      required DogModel dog,
      required List<String> dogName,
      required String emailID,
      required String userName})
      : _dog = dog,
        _dogName = dogName,
        _emailID = emailID,
        _userName = userName,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DogProfileInfoController controller =
        ref.read(providers.dogProfileInfoControllerProvider(_dog).notifier);
    final DogProfileModel model =
        ref.watch(providers.dogProfileInfoControllerProvider(_dog));

    return Scaffold(
      backgroundColor: PerritosColor.perritosSnow.color,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            PerritosIcons.Icon_Dog,
                            size: 26,
                            color: PerritosColor.perritosGoldFusion.color,
                          ),
                          onPressed: () async => {
                                await controller
                                    .loadAllDogsFromDB(_emailID)
                                    .then((dogList) => {
                                          Navigator.pushNamed(context,
                                              "/DogSelectionAndAdministration",
                                              arguments: {
                                                'emailID': _emailID,
                                                'userName': _userName,
                                                'dogList': dogList
                                              })
                                        })
                              }),
                      const Spacer(),
                      IconButton(
                          icon: Icon(
                            PerritosIcons.Icon_User,
                            size: 26,
                            color: PerritosColor.perritosBurntSienna.color,
                          ),
                          onPressed: () async => {
                                await controller
                                    .loadAllUsersFromDB(_emailID)
                                    .then((userList) => {
                                          Navigator.pushNamed(context,
                                              '/UserSelectionAndAdministration',
                                              arguments: {
                                                'emailID': _emailID,
                                                'userList': userList
                                              })
                                        })
                              }),
                    ],
                  ))
                ],
              ),
              Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                        child: Column(
                          children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                      child: _dog.name != "Perritos"
                          ? PerritosProfile(
                              icon: _dog.iconName == 'Icon_Smiley_Happy'
                                  ? PerritosIcons.Icon_Smiley_Happy
                                  : _dog.iconName == 'Icon_Smiley_Sad'
                                      ? PerritosIcons.Icon_Smiley_Sad
                                      : PerritosIcons.Icon_Dog,
                              onPressed: () {},
                              label: _dog.name,
                              perritosColor: _dog.iconColor ==
                                      'perritosGoldFusion'
                                  ? PerritosColor.perritosGoldFusion
                                  : _dog.iconColor == 'perritosMaizeCrayola'
                                      ? PerritosColor.perritosMaizeCrayola
                                      : _dog.iconColor == 'perritosSandyBrown'
                                          ? PerritosColor.perritosSandyBrown
                                          : _dog.iconColor ==
                                                  'perritosBurntSienna'
                                              ? PerritosColor
                                                  .perritosBurntSienna
                                              : PerritosColor.perritosCharcoal,
                            )
                          : PerritosProfile(
                              icon: PerritosIcons.Icon_Perritos,
                              onPressed: () {},
                              label: _dog.name,
                              perritosColor: PerritosColor.perritosCharcoal,
                            ))
                ],
              ),
                          ],
                        )
              ),
            ],
          ),
        ),
      bottomNavigationBar: Container(
        color: PerritosColor.perritosSnow.color,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 30),
            child: PerritosNavigationBar(
              activeView: activeView.profile,
              navigateToHome: () {
                Navigator.pushNamed(context, '/Home', arguments: {
                  'emailID': _emailID,
                  'userName': _userName,
                  'dogName': _dogName
                });
              },
              navigateToProfile: () async {
                await controller.loadDogFromDB(_emailID, _dogName).then((dog) =>
                    Navigator.pushNamed(context, '/DogProfileInfo', arguments: {
                      'dogModel': dog,
                      'emailID': _emailID,
                      'userName': _userName,
                      'dogName': _dogName
                    }));
              },
              navigateToCalendar: () {
                Navigator.pushNamed(context, '/Calendar', arguments: {
                  'emailID': _emailID,
                  'userName': _userName,
                  'dogName': _dogName
                });
              },
            )),
      ),
    );
  }
}

abstract class DogProfileInfoController extends StateNotifier<DogProfileModel> {
  DogProfileInfoController(DogProfileModel state) : super(state);
  int calculateAge(DateTime birthdate);

  Future<List<UserModel>> loadAllUsersFromDB(String email);
  Future<DogModel> loadDogFromDB(String email, List<String> name);
  Future<List<DogModel>> loadAllDogsFromDB(String email);
}
