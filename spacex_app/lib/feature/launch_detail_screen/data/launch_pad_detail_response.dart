

class LaunchPadDetailResponse {
  String _name;
  String _fullName;
  String _locality;
  String _region;

  String get name => _name;
  String get fullName => _fullName;
  String get locality => _locality;
  String get region => _region;

  LaunchPadDetailResponse({
      String name, 
      String fullName, 
      String locality, 
      String region}){
    _name = name;
    _fullName = fullName;
    _locality = locality;
    _region = region;
}

  LaunchPadDetailResponse.fromJson(Map<String, dynamic> json) {
    _name = json["name"];
    _fullName = json["full_name"];
    _locality = json["locality"];
    _region = json["region"];
  }

}