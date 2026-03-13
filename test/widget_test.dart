import 'package:flutter_color_interview_task/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App renders text', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Hello there'), findsOneWidget);
  });
}
