import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wom_migration_state.dart';

class WomMigrationCubit extends Cubit<WomMigrationState> {
  WomMigrationCubit() : super(WomMigrationInitial());
}
