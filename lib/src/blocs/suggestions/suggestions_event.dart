import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SuggestionsEvent extends Equatable {}

class LoadSuggestions extends SuggestionsEvent {
  @override
  String toString() => "LoadSuggestions";

  @override
  List<Object> get props => [];
}
