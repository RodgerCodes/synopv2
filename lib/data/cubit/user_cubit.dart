import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synop/data/repository/repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final Repository repository;
  UserCubit({required this.repository}) : super(UserInitial());

  void checkStation() {
    repository.stationNumber().then((value) {
      if (value['available'] == false) {
        emit(Available());
      }
    });
  }
}
