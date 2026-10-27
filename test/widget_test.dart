import 'package:flutter_test/flutter_test.dart';
import 'package:bytestacked/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BytestackedApp());
    expect(find.text('bytestacked'), findsWidgets);
  });
}
