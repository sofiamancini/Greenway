import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:green_way/flutter_flow/flutter_flow_drop_down.dart';
import 'package:green_way/flutter_flow/flutter_flow_icon_button.dart';
import 'package:green_way/flutter_flow/flutter_flow_widgets.dart';
import 'package:green_way/flutter_flow/flutter_flow_theme.dart';
import 'package:green_way/index.dart';
import 'package:green_way/main.dart';
import 'package:green_way/flutter_flow/flutter_flow_util.dart';

import 'package:green_way/backend/firebase/firebase_config.dart';
import 'package:green_way/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('Login Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp());

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('LoginTab_7ff5')));
    await tester.enterText(
        find.byKey(ValueKey('Login-Email_t4fx')), 'test@example.com');
    await tester.enterText(
        find.byKey(ValueKey('Login-Password_7wq7')), 'password2');
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    expect(find.text('Goal'), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
