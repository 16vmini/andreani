import 'package:flutter_test/flutter_test.dart';
import 'package:andreani_app/main.dart';

void main() {
  testWidgets('App loads home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const AndreaniApp());
    expect(find.text('ANDREANI'), findsOneWidget);
    expect(find.text('GROUP'), findsOneWidget);
  });
}
