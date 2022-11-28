import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synop/data/repository/repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final Repository repository;
  UserCubit({required this.repository}) : super(UserInitial());

  void signIn() {
    emit(LogginIn());
    repository.login().then((value) {
      if (value['err']) {
        emit(
          LoginError(
            msg: value['msg'],
          ),
        );
      } else {
        emit(
          LoggedIn(msg: value['msg']),
        );
      }
    });
  }
}
