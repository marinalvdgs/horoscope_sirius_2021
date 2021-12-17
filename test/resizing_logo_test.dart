import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:horoscope_sirius_2021/common_widgets/resizing_logo.dart';
import 'package:horoscope_sirius_2021/screens/auth/auth_screen.dart';

void main() {
  testWidgets('test logo exist', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AuthScreen(),
    ));

    await tester.pumpAndSettle();

    expect(find.byType(ResizingLogo), findsOneWidget);
  });

  testWidgets('test logo resizing', (tester) async {
    final logo = find.byKey(const ValueKey('image'));

    await tester.pumpWidget(const MaterialApp(
      home: AuthScreen(),
    ));

    final logoImage = tester.widget<ScaleTransition>(logo);

    expect(logoImage.scale.value, .5);

    await tester.pumpAndSettle();

    final resizedImage = tester.widget<ScaleTransition>(logo);

    expect(resizedImage.scale.value, 1);
  });
}
