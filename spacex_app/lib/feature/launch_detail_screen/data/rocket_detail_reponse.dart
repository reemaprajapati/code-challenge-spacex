class RocketDetailResponse {
  String _name;
  String _country;
  String _company;

  String get name => _name;

  String get country => _country;

  String get company => _company;

  RocketDetailResponse({String name, String country, String company}) {
    _name = name;
    _country = country;
    _company = company;
  }

  RocketDetailResponse.fromJson(Map<String, dynamic> json) {
    _name = json["name"];
    _country = json["country"];
    _company = json["company"];
  }
}
