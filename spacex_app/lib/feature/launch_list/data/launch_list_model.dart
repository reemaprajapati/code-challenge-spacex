class LaunchListModel {
  Links _links;
  String _rocket;
  bool _success;
  List<Failures> _failures;
  String _details;
  String _launchpad;
  String _name;
  String _dateUtc;
  bool _upcoming;
  String _id;

  Links get links => _links;

  String get rocket => _rocket;

  bool get success => _success;

  List<dynamic> get failures => _failures;

  String get details => _details;

  String get launchpad => _launchpad;

  String get name => _name;

  String get dateUtc => _dateUtc;

  bool get upcoming => _upcoming;

  String get id => _id;

  LaunchListModel(
      {dynamic fairings,
      Links links,
      String staticFireDateUtc,
      int staticFireDateUnix,
      bool tdb,
      bool net,
      int window,
      String rocket,
      bool success,
      List<dynamic> failures,
      String details,
      List<dynamic> crew,
      List<dynamic> ships,
      List<String> capsules,
      List<String> payloads,
      String launchpad,
      bool autoUpdate,
      int flightNumber,
      String name,
      String dateUtc,
      int dateUnix,
      String dateLocal,
      String datePrecision,
      bool upcoming,
      String id}) {
    _links = links;
    _rocket = rocket;
    _success = success;
    _failures = failures;
    _details = details;
    _launchpad = launchpad;
    _name = name;
    _dateUtc = dateUtc;
    _upcoming = upcoming;
    _id = id;
  }

  LaunchListModel.fromJson(dynamic json) {
    _links = json["links"] != null ? Links.fromJson(json["links"]) : null;
    _rocket = json["rocket"];
    _success = json["success"] ?? false;
    if (json["failures"] != null) {
      _failures = [];
      json["failures"].forEach((v) {
        _failures.add(Failures.fromJson(v));
      });
    }
    _details = json["details"] ?? "";

    _launchpad = json["launchpad"];
    _name = json["name"];
    _dateUtc = json["date_utc"];
    _upcoming = json["upcoming"] ?? false;
    if (json["cores"] != null) {
      json["cores"].forEach((v) {});
    }
    _id = json["id"];
  }

}

class Links {
  Patch _patch;

  Patch get patch => _patch;

  Links({
    Patch patch,
  }) {
    _patch = patch;
  }

  Links.fromJson(dynamic json) {
    _patch = json["patch"] != null ? Patch.fromJson(json["patch"]) : null;
  }

}

class Patch {
  String _small;
  String _large;

  String get small => _small;

  String get large => _large;

  Patch({String small, String large}) {
    _small = small;
    _large = large;
  }

  Patch.fromJson(dynamic json) {
    _small = json["small"] ?? "";
    _large = json["large"] ?? "";
  }

}

class Failures {
  int _time;
  dynamic _altitude;
  String _reason;

  int get time => _time;
  dynamic get altitude => _altitude;
  String get reason => _reason;

  Failures({
    int time,
    dynamic altitude,
    String reason}){
    _time = time;
    _altitude = altitude;
    _reason = reason;
  }

  Failures.fromJson(dynamic json) {
    _time = json["time"];
    _altitude = json["altitude"];
    _reason = json["reason"];
  }
}
