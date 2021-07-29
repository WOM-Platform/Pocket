import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}
