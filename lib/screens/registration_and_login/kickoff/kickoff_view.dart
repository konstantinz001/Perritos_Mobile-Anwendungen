import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/ui-components/buttons/perritos-button.dart';
import 'package:flutter_application/assets/ui-components/chips/perritos-chip.dart';
import 'package:flutter_application/common/providers.dart';
import 'package:flutter_application/screens/registration_and_login/kickoff/kickoff_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KickoffView extends ConsumerWidget {
  const KickoffView({Key? key}) : super(key: key);

  Widget get firstTree => PerritosButton(
      onPressed: () => {print('button')}, label: 'Perritos Button');

  Widget get secondTree => PerritosChip(
      label: 'Perritos Chip',
      color: PerritosColor.perritosBurntSienna, onPressed: () => {print('chip')});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final KickoffController controller =
        ref.read(providers.kickoffControllerProvider.notifier);
    final KickoffModel model = ref.watch(providers.kickoffControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            model.switchTree ? firstTree : secondTree,
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => controller.switchtTree(),
              child: const Text('Switch Tree'),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class KickoffController extends StateNotifier<KickoffModel> {
  KickoffController(KickoffModel state) : super(state);

  void switchtTree();
}
