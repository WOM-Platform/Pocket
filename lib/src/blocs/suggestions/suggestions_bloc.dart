import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wom_pocket/src/models/suggestion_model.dart';
import './bloc.dart';

final suggestionNotifierProvider =
    AsyncNotifierProvider<SuggestionsNotifier, SuggestionsLoaded>(
        SuggestionsNotifier.new);

class SuggestionsNotifier extends AsyncNotifier<SuggestionsLoaded> {
  // SuggestionsBloc() : super(InitialSuggestionsState()) {
  //   add(LoadSuggestions());
  // }

  @override
  FutureOr<SuggestionsLoaded> build() async {
    return await loadSusggestion();
  }

  loadSusggestion() async {
    state = AsyncLoading();
    await Future.delayed(Duration(milliseconds: 500));
    return AsyncData(SuggestionsLoaded(suggestionsItem));
  }
}

List<SuggestionModel> suggestionsItem = [
  SuggestionModel(
    text: "How does the WOM platform work?",
    url: "",
    type: "FAQ",
  ),
  SuggestionModel(
    text: "Collect WOMs with SmartRoadSense",
    url: "",
    type: "Suggestion",
  ),
];
