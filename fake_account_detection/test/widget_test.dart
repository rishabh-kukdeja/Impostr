import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fake_account_detection/main.dart'; // Ensure the path is correct.

void main() {
  testWidgets('Fake Account Detector smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(FakeAccountDetectorApp()); // Use the correct class name.

    // Verify initial state (if needed). Example placeholder since there's no counter in your app.
    expect(find.text('Fetch Account Details'), findsOneWidget);
    expect(find.text('Start Detection Test'), findsOneWidget);
  });
}
