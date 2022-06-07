import 'package:flutter/material.dart';
import 'package:flutter_application/screens/home/home_view.dart';
import 'package:flutter_application/screens/registration_and_login/registration_and_login_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
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
      home: Navigator(
        initialRoute: '/RegistrationAndLogin',
        onGenerateRoute: (RouteSettings routeParams) {
          if (routeParams.name == '/RegistrationAndLogin') {
            return MaterialPageRoute(builder: (context) => const RegistrationAndLoginView());
          } else if (routeParams.name == '/UserSelectionAndAdministration') {
            return MaterialPageRoute(builder: (context) => const Center(child: Text('UserSelectionAndAdministration Screen')));
          } else if (routeParams.name == '/DogSelectionAndAdministration') {
            return MaterialPageRoute(builder: (context) => const Center(child: Text('DogSelectionAndAdministration Screen')));
          } else if (routeParams.name == '/Home') {
            return MaterialPageRoute(builder: (context) => const HomeView());
          } else if (routeParams.name == '/Calendar') {
            return MaterialPageRoute(builder: (context) => const Center(child: Text('Calendar Screen')));
          } else if (routeParams.name == '/DogProfileInfo') {
            return MaterialPageRoute(builder: (context) => const Center(child: Text('DogProfileInfo Screen')));
          } 
          return MaterialPageRoute(
              builder: (context) => const Center(child: Text('Unkown Screen')));
        },
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      )
    );
  }
}
