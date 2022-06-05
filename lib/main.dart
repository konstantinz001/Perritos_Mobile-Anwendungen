import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';
import 'package:flutter_application/screens/user_selection_and_administration/user_selection_and_administration_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [const Locale('en'), const Locale('de')],
        home: Navigator(
          initialRoute: '/RegistrationAndLogin',
          onGenerateRoute: (RouteSettings routeParams) {
            if (routeParams.name == '/RegistrationAndLogin') {
              return MaterialPageRoute(
                  builder: (context) => RegistrationAndLoginView());
            } else if (routeParams.name == '/UserSelectionAndAdministration') {
              final Map args = routeParams.arguments as Map;
              return MaterialPageRoute(
                  builder: (context) => UserSelectionAndAdministrationView(
                        users: args['userList'],
                      ));
            } else if (routeParams.name == '/DogSelectionAndAdministration') {
              return MaterialPageRoute(
                  builder: (context) => const Center(
                      child: Text('DogSelectionAndAdministration Screen')));
            } else if (routeParams.name == '/Home') {
              return MaterialPageRoute(
                  builder: (context) =>
                      const Center(child: Text('Home Screen')));
            } else if (routeParams.name == '/Calendar') {
              return MaterialPageRoute(
                  builder: (context) =>
                      const Center(child: Text('Calendar Screen')));
            } else if (routeParams.name == '/DogProfileInfo') {
              return MaterialPageRoute(
                  builder: (context) =>
                      const Center(child: Text('DogProfileInfo Screen')));
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
