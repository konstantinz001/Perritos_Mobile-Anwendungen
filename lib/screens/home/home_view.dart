import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';
import 'package:flutter_application/assets/ui-components/action/perritos-action.dart';
import 'package:flutter_application/assets/ui-components/navigation/perritos-navigation.dart';
import 'package:flutter_application/assets/ui-components/text-input/perritos_search_input.dart';
import 'package:flutter_application/common/models/action_abnormality_model.dart';
import 'package:flutter_application/common/models/action_date_model.dart';
import 'package:flutter_application/common/models/action_task_model.dart';
import 'package:flutter_application/common/models/action_walking_model.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'home_model.dart';


class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

    return Scaffold(
      backgroundColor: PerritosColor.perritosSnow.color,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 0,
              right: 10,
              bottom: 0,
            ),
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
                                  Navigator.pushNamed(context,
                                      '/DogSelectionAndAdministration')
                                }),
                        const Spacer(),
                        IconButton(
                            icon: Icon(
                              PerritosIcons.Icon_User,
                              size: 26,
                              color: PerritosColor.perritosBurntSienna.color,
                            ),
                            onPressed: () => {
                                  Navigator.pushNamed(context,
                                      '/UserSelectionAndAdministration')
                                }),
                      ],
                    ))
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                        child: PerritosSearchInput(onSubmit: (searchString) => {print(searchString)})) 
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                Text(
                  'Aufgaben',
                  style: perritosDoubleParagon,
                ),
                FutureBuilder(
                  future: controller.loadActionTasksFromDB(),
                  builder: (BuildContext context, AsyncSnapshot<List<ActionTaskModel>> snapshot) {
                    if( snapshot.connectionState == ConnectionState.waiting){
                        return Text('Einen Augenblick bitte...', style: perritosParagonOpacity,);
                    }else{
                        if (snapshot.hasError){
                          return Text('Error: ${snapshot.error}', style: perritosParagonError,);
                        }
                        else {
                          return snapshot.data?.length == 0 ? Text('Es gibt keine Aufgaben für dich :)', style: perritosParagonOpacity,): Column(
                            children: [
                              for (var action in snapshot.data ?? [])
                                PerritosAction(
                                  icon: PerritosIcons.Icon_Task,
                                  value: "",
                                  label: action.title,
                                  onPressed: () {
                                  },
                                )
                            ]
                          );
                        }
                    }
                  }
                ),
                const SizedBox(height: 20),
                Text(
                  'Termine',
                  style: perritosDoubleParagon,
                ),
                FutureBuilder(
                  future: controller.loadActionDatesFromDB(),
                  builder: (BuildContext context, AsyncSnapshot<List<ActionDateModel>> snapshot) {
                    if( snapshot.connectionState == ConnectionState.waiting){
                        return Text('Einen Augenblick bitte...', style: perritosParagonOpacity,);
                    }else{
                        if (snapshot.hasError){
                          return Text('Error: ${snapshot.error}', style: perritosParagonError,);
                        }
                        else {
                          return snapshot.data?.length == 0 ? Text('Es gibt keine Aufgaben für dich :)', style: perritosParagonOpacity,): Column(
                            children: [
                              for (var action in snapshot.data ?? [])
                                PerritosAction(
                                  icon: PerritosIcons.Icon_Date,
                                  value: '${DateFormat("dd.mm.yyyy hh:mm").format(action.begin.toDate())} bis ${DateFormat("dd.mm.yyyy hh:mm").format(action.end.toDate())}',
                                  label: action.title,
                                  onPressed: () {
                                  },
                                )
                            ]
                          );
                        }
                    }
                  }
                ),
                const SizedBox(height: 20),
                Text(
                  'Auffälligkeiten',
                  style: perritosDoubleParagon,
                ),
                FutureBuilder(
                  future: controller.loadActionAbnormalitiesFromDB(),
                  builder: (BuildContext context, AsyncSnapshot<List<ActionAbnormalityModel>> snapshot) {
                    if( snapshot.connectionState == ConnectionState.waiting){
                        return Text('Einen Augenblick bitte...', style: perritosParagonOpacity,);
                    }else{
                        if (snapshot.hasError){
                          return Text('Error: ${snapshot.error}', style: perritosParagonError,);
                        }
                        else {
                          return snapshot.data?.length == 0 ? Text('Es gibt keine Auffälligkeiten', style: perritosParagonOpacity,): Column(
                            children: [
                              for (var action in snapshot.data ?? [])
                                PerritosAction(
                                  icon: action.emotionalState < 5 ?  PerritosIcons.Icon_Smiley_Happy : PerritosIcons.Icon_Smiley_Sad,
                                  value: '',
                                  label: action.title,
                                  onPressed: () {
                                  },
                                )
                            ]
                          );
                        }
                    }
                  }
                ),
                    ],
                  )
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                      backgroundColor: PerritosColor
                          .perritosCharcoal.color,
                      child: const Icon(
                        PerritosIcons.Icon_Add,
                        size: 42,
                      ),
                      onPressed: () => {
                          }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: PerritosColor.perritosSnow.color,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 0,
              right: 10,
              bottom: 10,
            ),
            child: PerritosNavigationBar(
              activeView: activeView.home,
              navigateToHome: () {
                Navigator.pushNamed(context, '/Home');
              },
              navigateToProfile: () {
                Navigator.pushNamed(context, '/DogProfileInfo');
              },
              navigateToCalendar: () {
                Navigator.pushNamed(context, '/Calendar');
              },
            ),
          ),
        )
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);
  Future<List<ActionDateModel>> loadActionDatesFromDB();
  Future<List<ActionTaskModel>> loadActionTasksFromDB();
  Future<List<ActionAbnormalityModel>> loadActionAbnormalitiesFromDB();
}
