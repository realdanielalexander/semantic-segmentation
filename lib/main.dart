import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:semantic_segmentation/result_page.dart';
import 'package:semantic_segmentation/welcome_screen.dart';
import 'package:semantic_segmentation/method_selection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Semantic Segmentation',
        home: WelcomeScreen(),
        theme: ThemeData(
            primaryColor: Color(0xFF1B232E), accentColor: Colors.black45),
        routes: {
          '/method-selection': (context) => MethodSelection(),
          '/result-page': (context) => ResultPage(),
        }));
  });
}
