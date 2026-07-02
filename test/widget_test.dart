import 'package:flutter_test/flutter_test.dart';
import 'package:peoplehr/main.dart';

void main() {
  testWidgets('People HR app opens login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const PeopleHrApp());
    expect(find.text('EMC People Platform'), findsOneWidget);
    expect(find.text('Sign in with Entra ID'), findsOneWidget);
  });
}
