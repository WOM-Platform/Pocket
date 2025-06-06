import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_button.dart';
import 'package:wom_pocket/src/features/badge/application/badge_notifier.dart';
import 'package:wom_pocket/src/features/badge/application/challenge_notifier.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';
import 'package:wom_pocket/src/features/badge/ui/badge_list.dart';

class ChallengeDetailsScreen extends StatelessWidget {
  final ChallengeData? challenge;
  final String? challengeId;

  const ChallengeDetailsScreen({
    Key? key,
    this.challenge,
    this.challengeId,
  })  : assert(challenge != null || challengeId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = challenge;
    final id = challengeId;
    if (c == null) {
      if (id != null) {
        return ChallengeWidgetByRemote(
          challengeId: id,
        );
      }
      return Scaffold();
    } else {
      return _ChallengeWidget(challenge: c, showAcceptButton: false);
    }
  }
}

class ChallengeWidgetByRemote extends ConsumerWidget {
  final String challengeId;

  const ChallengeWidgetByRemote({
    required this.challengeId,
    super.key,
  });

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

class _ChallengeWidget extends ConsumerWidget {
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
    final dateFormat = DateFormat('dd/MM/yyyy');
    final languageCode = context.locale.languageCode;
    return Scaffold(
      appBar: SecondLevelAppBar(
          title: challenge.name[languageCode] ?? 'Challenge Details'),
      body: SafeArea(
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  Text(
                    challenge.name[languageCode] ?? '',
                    style: textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (challenge.description != null) ...[
                    Text(
                      challenge.description?[languageCode] ?? '',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                  ],
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    context,
                    'Public:',
                    challenge.isPublic ? "Yes" : "No",
                  ),
                  BadgeList(badges: challenge.badges),
                ],
              ),
            ),
            if (showAcceptButton)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyButton(
                  onPressed: () {
                    ref
                        .read(badgeNotifierProvider.notifier)
                        .acceptChallenge(challenge);
                  },
                  child: Text('Accetta la challende'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ',
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
