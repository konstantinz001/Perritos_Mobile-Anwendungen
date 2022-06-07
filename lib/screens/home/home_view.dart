import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/screens/home/pages/home_overview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller = ref.read(providers.homeProvider.notifier);
    final HomeModel model = ref.watch(providers.homeProvider);

    return Scaffold(
      body: Center(
        child: model.currentHomeScreen == Home.actionsOverview ?
            HomeOverview()
            :
            Container()
      ),
    );
  }
}

abstract class HomeController
    extends StateNotifier<HomeModel> {
  HomeController(HomeModel state)
      : super(state);

  void switchHomeScreen(screen);
}