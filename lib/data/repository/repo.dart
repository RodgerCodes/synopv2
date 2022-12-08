import 'package:synop/data/api.dart';

class Repository {
  final ApiCall api;
  Repository({required this.api});

  // login method
  Future login() async {
    return await api.login();
  }

  // station data
  Future stationData() async {
    final data = await api.getData();
    return data;
  }
}
