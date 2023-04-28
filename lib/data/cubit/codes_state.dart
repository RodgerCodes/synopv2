part of 'codes_cubit.dart';

@immutable
abstract class CodesState {}

class CodesInitial extends CodesState {}

class FetchingCodes extends CodesState {}

class FetchedCodes extends CodesState {
  final List data;

  FetchedCodes({required this.data});
}

class SubmittingData extends CodesState{}

class DataSubmitted extends CodesState{
  final String msg;

  DataSubmitted({required this.msg});
}

class Error extends CodesState {
  final String msg;

  Error({required this.msg});
}

class ForbiddenError extends CodesState {
  final String msg;

  ForbiddenError({required this.msg});
}
