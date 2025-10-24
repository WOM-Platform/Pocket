import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_button.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';
import 'package:wom_pocket/src/features/badge/application/challenge_notifier.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';
import 'package:wom_pocket/src/features/badge/ui/badge_list.dart';

class ChallengeDetailsScreen extends StatelessWidget {
  final ChallengeData? challenge;
  final String? challengeId;

  const ChallengeDetailsScreen({Key? key, this.challenge, this.challengeId})
    : assert(challenge != null || challengeId != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = challenge;
    final id = challengeId;
    if (c == null) {
      if (id != null) {
        return ChallengeWidgetByRemote(challengeId: id);
      }
      return Scaffold();
    } else {
      return _ChallengeWidget(challenge: c, showAcceptButton: false);
    }
  }
}

class ChallengeWidgetByRemote extends ConsumerWidget {
  final String challengeId;

  const ChallengeWidgetByRemote({required this.challengeId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getChallengeProvider(challengeId));
    return switch (state) {
      AsyncData(:final value) => _ChallengeWidget(
        challenge: value,
        showAcceptButton: true,
      ),
      _ => Scaffold(
        appBar: SecondLevelAppBar(title: 'Caricamento Challenge...'),
      ),
    };
  }
}

class _ChallengeWidget extends HookConsumerWidget {
  final ChallengeData challenge;
  final bool showAcceptButton;

  const _ChallengeWidget({
    required this.challenge,
    required this.showAcceptButton,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    // final dateFormat = DateFormat('dd/MM/yyyy');
    final isLoading = useState(false);
    final languageCode = context.locale.languageCode;
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: challenge.name[languageCode] ?? 'Challenge',
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  BadgeList(badges: challenge.badges),
                  if (challenge.description != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      challenge.description?[languageCode] ?? '',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ],
              ),
            ),
            if (showAcceptButton)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyButton(
                  isLoading: isLoading.value,
                  onPressed: () async {
                    try {
                      isLoading.value = true;
                      await ref
                          .read(badgeProvider.notifier)
                          .acceptChallenge(challenge);
                      context.maybePop();
                    } catch (ex, st) {
                      logger.e(
                        'Accetta la challenge',
                        error: ex,
                        stackTrace: st,
                      );
                    }
                  },
                  child: Text('Accetta la challenge'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
