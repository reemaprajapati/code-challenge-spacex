import 'package:spacex_app/feature/launch_list/data/launch_list_model.dart';

class LaunchArgumentsModel {
  String name;
  String detail;
  bool success;
  bool upcoming;
  List<Failures> failures;
  String rocketId;
  String launcePad;
  String date;
  String largePatch;

  LaunchArgumentsModel(
      {this.name,
      this.detail,
      this.success,
      this.failures,
      this.rocketId,
      this.launcePad,
      this.date,
      this.largePatch,
      this.upcoming});

}