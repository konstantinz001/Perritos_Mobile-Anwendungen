import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/assets/ui-components/navigation/perritos-navigation.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_description_input.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_txt_input.dart';
import 'package:flutter_application/common/models/statistics/weekday_data.model.dart';
import 'package:flutter_application/common/models/users/dog_model.dart';
import 'package:flutter_application/common/models/users/user_model.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DogProfileInfoView extends ConsumerWidget {
  final String _emailID;
  final String _userName;
  final List<String> _dogName;
  final DogModel _dog;
  final bool? _perritos;
  final DogModel? _selectedDog;
  final UserModel? _selectedUser;

  const DogProfileInfoView(
      {Key? key,
      required DogModel dog,
      required List<String> dogName,
      required String emailID,
      required String userName,
      required bool? perritos,
      required UserModel? selectedUser,
      required DogModel? selectedDog})
      : _dog = dog,
        _dogName = dogName,
        _emailID = emailID,
        _userName = userName,
        _perritos = perritos,
        _selectedDog = selectedDog,
        _selectedUser = selectedUser,
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
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          _perritos == true
                              ? PerritosIcons.Icon_Perritos
                              : _selectedDog?.iconName == 'Icon_Smiley_Happy'
                                  ? PerritosIcons.Icon_Smiley_Happy
                                  : _selectedDog?.iconName == 'Icon_Smiley_Sad'
                                      ? PerritosIcons.Icon_Smiley_Sad
                                      : PerritosIcons.Icon_Dog,
                          size: 26,
                          color: _perritos == true
                              ? PerritosColor.perritosCharcoal.color
                              : _selectedDog?.iconColor == 'perritosGoldFusion'
                                  ? PerritosColor.perritosGoldFusion.color
                                  : _selectedDog?.iconColor ==
                                          'perritosMaizeCrayola'
                                      ? PerritosColor.perritosMaizeCrayola.color
                                      : _selectedDog?.iconColor ==
                                              'perritosSandyBrown'
                                          ? PerritosColor
                                              .perritosSandyBrown.color
                                          : _selectedDog?.iconColor ==
                                                  'perritosBurntSienna'
                                              ? PerritosColor
                                                  .perritosBurntSienna.color
                                              : PerritosColor
                                                  .perritosCharcoal.color,
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
                                              'dogList': dogList,
                                              'selectedUser': _selectedUser
                                            })
                                      })
                            }),
                    const Spacer(),
                    IconButton(
                        icon: Icon(
                          _selectedUser?.iconName == 'Icon_Smiley_Happy'
                              ? PerritosIcons.Icon_Smiley_Happy
                              : _selectedUser?.iconName == 'Icon_Smiley_Sad'
                                  ? PerritosIcons.Icon_Smiley_Sad
                                  : PerritosIcons.Icon_User,
                        ),
                        color: _selectedUser?.iconColor == 'perritosGoldFusion'
                            ? PerritosColor.perritosGoldFusion.color
                            : _selectedUser?.iconColor == 'perritosMaizeCrayola'
                                ? PerritosColor.perritosMaizeCrayola.color
                                : _selectedUser?.iconColor ==
                                        'perritosSandyBrown'
                                    ? PerritosColor.perritosSandyBrown.color
                                    : _selectedUser?.iconColor ==
                                            'perritosBurntSienna'
                                        ? PerritosColor
                                            .perritosBurntSienna.color
                                        : PerritosColor.perritosCharcoal.color,
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
                padding: const EdgeInsets.only(
                    left: 10, top: 0, right: 10, bottom: 0),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                            child: _perritos == true
                                ? PerritosProfile(
                                    icon: PerritosIcons.Icon_Perritos,
                                    onPressed: () {},
                                    label: 'Perritos',
                                    perritosColor:
                                        PerritosColor.perritosCharcoal,
                                  )
                                : Column(
                                    children: [
                                      const SizedBox(height: 24),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: PerritosProfile(
                                            icon: _dog.iconName ==
                                                    'Icon_Smiley_Happy'
                                                ? PerritosIcons
                                                    .Icon_Smiley_Happy
                                                : _dog.iconName ==
                                                        'Icon_Smiley_Sad'
                                                    ? PerritosIcons
                                                        .Icon_Smiley_Sad
                                                    : PerritosIcons.Icon_Dog,
                                            onPressed: () {},
                                            label: _dog.name,
                                            perritosColor: _dog.iconColor ==
                                                    'perritosGoldFusion'
                                                ? PerritosColor
                                                    .perritosGoldFusion
                                                : _dog.iconColor ==
                                                        'perritosMaizeCrayola'
                                                    ? PerritosColor
                                                        .perritosMaizeCrayola
                                                    : _dog.iconColor ==
                                                            'perritosSandyBrown'
                                                        ? PerritosColor
                                                            .perritosSandyBrown
                                                        : _dog.iconColor ==
                                                                'perritosBurntSienna'
                                                            ? PerritosColor
                                                                .perritosBurntSienna
                                                            : PerritosColor
                                                                .perritosCharcoal,
                                          ))
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      PerritosTxtInput(
                                        label: 'Rasse:',
                                        hintTxt: _dog.rasse,
                                        onSubmit: (value) => {},
                                        readOnly: true,
                                      ),
                                      const SizedBox(height: 10),
                                      PerritosTxtInput(
                                        label: 'Geburtstag:',
                                        hintTxt: DateFormat('dd.MM.yyyy')
                                            .format(_dog.birthday.toDate()),
                                        optlabel:
                                            '${DateTime.now().difference(_dog.birthday.toDate()).inDays ~/ 365} Jahre alt',
                                        onSubmit: (value) => {},
                                        readOnly: true,
                                      ),
                                      const SizedBox(height: 10),
                                      PerritosDescriptionInput(
                                        label: 'Info:',
                                        hintTxt: _dog.info,
                                        onSubmit: (value) => {},
                                        readOnly: true,
                                        showWordCount: false,
                                      )
                                    ],
                                  ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Durschnittliche Gassidauer in h:",
                          style: perritosParagonOpacity,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                        future:
                            controller.getWalkingData(_emailID, _selectedDog, _perritos),
                        builder: (BuildContext context,
                            AsyncSnapshot<WeekdayDataModel> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          } else {
                            if (snapshot.hasError) {
                              return Text(
                                'Error: ${snapshot.error}',
                                style: perritosParagonError,
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: 300,
                                child: BarChart(BarChartData(
                                    borderData: FlBorderData(
                                        border: Border(
                                      top: BorderSide.none,
                                      right: BorderSide.none,
                                      left: BorderSide.none,
                                      bottom: BorderSide(
                                          width: 1,
                                          color: PerritosColor
                                              .perritosCharcoal.color
                                              .withOpacity(0.5)),
                                    )),
                                    groupsSpace: 1,
                                    titlesData: FlTitlesData(
                                      rightTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                        showTitles: false,
                                      )),
                                      leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                        showTitles: false,
                                      )),
                                      bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                              showTitles: true,
                                              reservedSize: 42,
                                              getTitlesWidget:
                                                  controller.bottomTitles)),
                                      topTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                              showTitles: false,
                                           )),
                                    ),
                                    barGroups: [
                                      BarChartGroupData(x: 1, barRods: [
                                        BarChartRodData(
                                            toY: snapshot.data!.monday,
                                            width: 15,
                                            color: PerritosColor
                                                .perritosMaizeCrayola.color),
                                      ]),
                                      BarChartGroupData(x: 2, barRods: [
                                        BarChartRodData(
                                            toY:snapshot.data!.tuesday,
                                            width: 15,
                                            color: PerritosColor
                                                .perritosMaizeCrayola.color),
                                      ]),
                                      BarChartGroupData(x: 3, barRods: [
                                        BarChartRodData(
                                            toY: snapshot.data!.wednesday,
                                            width: 15,
                                            color: PerritosColor
                                                .perritosMaizeCrayola.color),
                                      ]),
                                      BarChartGroupData(x: 4, barRods: [
                                        BarChartRodData(
                                            toY: snapshot.data!.thursday,
                                            width: 15,
                                            color: PerritosColor
                                                .perritosMaizeCrayola.color),
                                      ]),
                                      BarChartGroupData(x: 5, barRods: [
                                        BarChartRodData(
                                            toY: snapshot.data!.friday,
                                            width: 15,
                                            color: PerritosColor
                                                .perritosMaizeCrayola.color),
                                      ]),
                                      BarChartGroupData(x: 6, barRods: [
                                        BarChartRodData(
                                            toY: snapshot.data!.saturday,
                                            width: 15,
                                            color: PerritosColor
                                                .perritosMaizeCrayola.color),
                                      ]),
                                      BarChartGroupData(x: 7, barRods: [
                                        BarChartRodData(
                                            toY: snapshot.data!.sunday,
                                            width: 15,
                                            color: PerritosColor
                                                .perritosMaizeCrayola.color),
                                      ]),
                                    ])),
                              );
                            }
                          }
                        }),
                  ],
                )),
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
                  'dogName': _dogName,
                  'perritos': _perritos,
                  'selectedUser': _selectedUser,
                  'selectedDog': _selectedDog
                });
              },
              navigateToProfile: () async {},
              navigateToCalendar: () {
                Navigator.pushNamed(context, '/Calendar', arguments: {
                  'emailID': _emailID,
                  'userName': _userName,
                  'dogName': _dogName,
                  'selectedUser': _selectedUser,
                  'selectedDog': _selectedDog
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
  Widget bottomTitles(double value, TitleMeta meta);
  Future<WeekdayDataModel> getWalkingData(String email, DogModel? dog, bool? perritos);
}
