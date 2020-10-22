import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pocket/src/models/suggestion_model.dart';
import './bloc.dart';

class SuggestionsBloc extends Bloc<SuggestionsEvent, SuggestionsState> {
  SuggestionsBloc() : super(InitialSuggestionsState()) {
    add(LoadSuggestions());
  }

  @override
  Stream<SuggestionsState> mapEventToState(
    SuggestionsEvent event,
  ) async* {
    if (event is LoadSuggestions) {
      yield SuggestionsLoading();
      await Future.delayed(Duration(milliseconds: 500));
      yield SuggestionsLoaded(suggestionsItem);
    }
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
