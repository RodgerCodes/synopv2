import 'package:synop/data/api.dart';

class Repository {
  final ApiCall api;
  Repository({required this.api});

  // login method
  Future login() async {
    return await api.login();
  }

  Future stationNumber() async {
    final data = api.stationNumber();
    return data;
  }
}
