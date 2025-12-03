import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_aslam_khan/main.dart';
import 'package:portfolio_aslam_khan/screens/home_screen.dart';

void main() {
  testWidgets('App launches and shows HomeScreen', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const PortfolioApp());
    
    // Verify basic structure
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}