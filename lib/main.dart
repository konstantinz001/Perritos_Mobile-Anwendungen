import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/calendar/calendar_view.dart';
import 'package:flutter_application/screens/dog_profile_info/dog_profile_info_view.dart';
import 'package:flutter_application/screens/home/home_view.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/models/dog_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(await buildApp());
}

Future<Widget> buildApp() async {
  return const ProviderScope(
    child: MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [Locale('en'), Locale('de')],
        home: Navigator(
          initialRoute: '/Home',
          onGenerateRoute: (RouteSettings routeParams) {
            if (routeParams.name == '/RegistrationAndLogin') {
              return MaterialPageRoute(
                  builder: (context) => const RegistrationAndLoginView());
            } else if (routeParams.name == '/UserSelectionAndAdministration') {
              final Map args = routeParams.arguments as Map;
              return MaterialPageRoute(
                  builder: (context) => UserSelectionAndAdministrationView(
                        users: args['userList'],
                        emailID: args['emailID'],
                      ));
            } else if (routeParams.name == '/DogSelectionAndAdministration') {
              return MaterialPageRoute(
                  builder: (context) => const Center(
                      child: Text('DogSelectionAndAdministration Screen')));
            } else if (routeParams.name == '/Home') {
              return MaterialPageRoute(builder: (context) => const HomeView());
            } else if (routeParams.name == '/Calendar') {
              return MaterialPageRoute(
                  builder: (context) => const CalendarView());
            } else if (routeParams.name == '/DogProfileInfo') {
              final Map args = routeParams.arguments as Map;
              return MaterialPageRoute(
                  builder: (context) => DogProfileInfoView(
                    dog: DogModel('pelusa@gmail.com','Pelusa',true,'Icon_Smiley_Happy','perritosSandyBrown','Malteser',Timestamp.fromDate(Timestamp.now().toDate().add(Duration(days: 1000))),'Pelusita'),
                  ));
            }
            return MaterialPageRoute(
                builder: (context) =>
                    const Center(child: Text('Unkown Screen')));
          },
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        ));
  }
}
