part of 'university_cubit.dart';

abstract class UniversityState extends Equatable {
  const UniversityState();
}

class UniversityInitial extends UniversityState {
  @override
  List<Object> get props => [];
}

class UniversityStateProgress extends UniversityState {
  final bool isLoading;

  const UniversityStateProgress(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}

class UniversityStateLoaded extends UniversityState {
  const UniversityStateLoaded();

  @override
  List<Object> get props => [];
}

class UniversityStateError extends UniversityState {
  final Object error;
  const UniversityStateError(this.error);
  @override
  List<Object> get props => [identityHashCode(this)];
}
