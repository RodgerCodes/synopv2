import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synop/data/models/codes.dart';
import 'package:synop/data/repository/repo.dart';

part 'codes_state.dart';

class CodesCubit extends Cubit<CodesState> {
  final Repository repository;

  CodesCubit({required this.repository}) : super(CodesInitial());

  void getStationData() {
    emit(FetchingCodes());
    repository.stationData().then((response) {
      // if (response['err']) {
      // } else {
      //   emit(FetchedCodes(data: response['']));
      // }
    });
  }
}
