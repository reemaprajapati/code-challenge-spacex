import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_app/widgets/launch_status_widget.dart';

void main() {
  testWidgets('Should show Status Success', (WidgetTester tester) async {
    await tester.pumpWidget(LaunchStatusWidget(successStatus: true, upcomingStatus: false, failures: [],));
    final status = find.text('Success');
    expect(status, findsOneWidget);
  });
}