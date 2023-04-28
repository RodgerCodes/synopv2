import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synop/data/repository/repo.dart';

part 'codes_state.dart';

class CodesCubit extends Cubit<CodesState> {
  final Repository repository;

  CodesCubit({required this.repository}) : super(CodesInitial());

  void getStationData() {
    emit(FetchingCodes());
    repository.stationData().then((response) {
      if (response['err']) {
        if (response['type'] == '403') {
          emit(
            ForbiddenError(
              msg: response['msg'],
            ),
          );
        } else {
          emit(
            Error(
              msg: response['msg'],
            ),
          );
        }
      } else {
        emit(FetchedCodes(data: response['msg']));
      }
    });
  }

  void submitData(String? isoValue, String lowCloud, String middleCloud,
      String highCloud, String synop) {
    emit(SubmittingData());
    repository
        .sendData(isoValue, lowCloud, middleCloud, highCloud, synop)
        .then((value) {
      if (value['err']) {
        emit(Error(msg: value['msg']));
      } else {
        emit(DataSubmitted(msg: value['msg']));
      }
    });
  }
}
