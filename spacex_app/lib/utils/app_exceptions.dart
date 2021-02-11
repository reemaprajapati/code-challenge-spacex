class AppException implements Exception {
  final _message;
  AppException([this._message]);
  String toString() {
    return "Error: $_message";
  }
}
class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message);
}
class BadRequestException extends AppException {
  BadRequestException([message]) : super(message);
}