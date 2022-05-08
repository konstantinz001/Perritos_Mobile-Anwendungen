import 'package:flutter_application/screens/registration_and_login/kickoff/kickoff_controller.dart';
import 'package:flutter_application/screens/registration_and_login/kickoff/kickoff_model.dart';
import 'package:flutter_application/screens/registration_and_login/kickoff/kickoff_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<KickoffController, KickoffModel>
      kickoffControllerProvider = StateNotifierProvider<KickoffController, KickoffModel>(
          (StateNotifierProviderRef ref) => KickoffControllerImplmentation());
}
