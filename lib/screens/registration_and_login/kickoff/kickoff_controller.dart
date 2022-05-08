import 'package:flutter_application/screens/registration_and_login/kickoff/kickoff_model.dart';
import 'package:flutter_application/screens/registration_and_login/kickoff/kickoff_view.dart';

class KickoffControllerImplmentation extends KickoffController {

  KickoffControllerImplmentation({KickoffModel? model,})
      : super(model ?? const KickoffModel(switchTree: false));

  @override
  void switchtTree() {
    state = state.copyWith(switchTree: !state.switchTree);
  }
}
