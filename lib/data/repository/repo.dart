import 'package:synop/data/api.dart';

class Repository {
  final ApiCall api;
  Repository({required this.api});

  Future stationNumber() async {
    final data = api.stationNumber();
    return data;
  }
}
