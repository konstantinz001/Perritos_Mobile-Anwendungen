import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/ui-components/navigation/perritos-navigation.dart';
import 'package:flutter_application/assets/ui-components/profile/perritos-profile.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_description_input.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_txt_input.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../assets/styles/perritos-icons/PerritosIcons_icons.dart';
import '../../common/models/dog_model.dart';

class DogProfileInfoView extends ConsumerWidget {
  final DogModel _dog;

  const DogProfileInfoView({Key? key, required DogModel dog})
      : _dog = dog,
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
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                          onPressed: () => {
                                Navigator.pushNamed(
                                    context, '/DogSelectionAndAdministration')
                              }),
                      const Spacer(),
                      IconButton(
                          icon: Icon(
                            PerritosIcons.Icon_User,
                            size: 26,
                            color: PerritosColor.perritosBurntSienna.color,
                          ),
                          onPressed: () => {
                                Navigator.pushNamed(
                                    context, '/UserSelectionAndAdministration')
                              }),
                    ],
                  ))
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                      child: PerritosProfile(
                    icon: _dog.iconName == 'Icon_Smiley_Happy'
                        ? PerritosIcons.Icon_Smiley_Happy
                        : _dog.iconName == 'Icon_Smiley_Sad'
                            ? PerritosIcons.Icon_Smiley_Sad
                            : PerritosIcons.Icon_Dog,
                    onPressed: () {},
                    label: _dog.name,
                    perritosColor: _dog.iconColor == 'perritosGoldFusion'
                        ? PerritosColor.perritosGoldFusion
                        : _dog.iconColor == 'perritosMaizeCrayola'
                            ? PerritosColor.perritosMaizeCrayola
                            : _dog.iconColor == 'perritosSandyBrown'
                                ? PerritosColor.perritosSandyBrown
                                : _dog.iconColor == 'perritosBurntSienna'
                                    ? PerritosColor.perritosBurntSienna
                                    : PerritosColor.perritosCharcoal,
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
                hintTxt:
                    DateFormat('dd.MM.yyyy').format(_dog.birthday.toDate()),
                optlabel:
                    (DateTime.now().difference(_dog.birthday.toDate()).inDays /
                                365)
                            .toInt()
                            .toString() +
                        ' Jahre alt',
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
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: PerritosColor.perritosSnow.color,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          child: PerritosNavigationBar(
            activeView: activeView.profile,
            navigateToHome: () {
              Navigator.pushNamed(context, '/Home');
            },
            navigateToCalendar: () {
              Navigator.pushNamed(context, '/Calendar');
            },
            navigateToProfile: () {
              Navigator.pushNamed(context, '/DogProfileInfo');
            },
          ),
        ),
      ),
    );
  }
}

abstract class DogProfileInfoController extends StateNotifier<DogProfileModel> {
  DogProfileInfoController(DogProfileModel state) : super(state);
  int calculateAge(DateTime birthdate);
}
