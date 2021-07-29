import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pocket/src/models/suggestion_model.dart';

@immutable
abstract class SuggestionsState extends Equatable {}

class InitialSuggestionsState extends SuggestionsState {
  @override
  List<Object> get props => [];
}

class SuggestionsLoading extends SuggestionsState {
  @override
  String toString() => "SuggestionsLoading";

  @override
  List<Object> get props => [];
}

class SuggestionsLoaded extends SuggestionsState {
  final List<SuggestionModel> suggestions;

  SuggestionsLoaded(this.suggestions);

  @override
  String toString() => "SuggestionsLoaded";

  @override
  List<Object> get props => [suggestions];
}
