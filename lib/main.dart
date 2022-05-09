import 'package:flutter/material.dart';
import 'package:flutter_application/screens/userprofil/userprofil_view.dart';
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
    return const MaterialApp(
      home: UserProfilView(),
    );
  }
}
