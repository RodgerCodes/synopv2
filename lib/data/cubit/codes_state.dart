part of 'codes_cubit.dart';

@immutable
abstract class CodesState {}

class CodesInitial extends CodesState {}

class FetchingCodes extends CodesState {}

class FetchedCodes extends CodesState {
  final List<Codes> data;

  FetchedCodes({required this.data});
}
