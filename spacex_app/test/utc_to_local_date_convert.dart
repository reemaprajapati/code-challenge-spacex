import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_app/utils/utilities.dart';

void main() {
  test('Date conversion should be correct', () {
    final date = "2006-03-17T00:00:00.000Z";
    var localDate = convertUtcTOLocalDate(date);
    print(localDate);
    expect(localDate, "Friday, March 17, 2006");
  });
}