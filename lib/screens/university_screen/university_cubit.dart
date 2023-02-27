import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'university_state.dart';

class UniversityCubit extends Cubit<UniversityState> {
  UniversityCubit() : super(UniversityInitial());

  loadData() {
    emit(const UniversityStateProgress(true));
    try {
      emit(const UniversityStateLoaded());

      emit(const UniversityStateProgress(false));
    } catch (error) {
      emit(UniversityStateError(error));
    }
  }
}
