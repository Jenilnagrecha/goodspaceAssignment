import 'package:flutter/material.dart';
import 'package:goodspace/Apis%20Repo/test_apis.dart';
import 'package:goodspace/Screens/home.dart';
import 'package:goodspace/Screens/login.dart';
import 'package:goodspace/Ui%20Componenets/colors.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showText = false;

  Future<String> _getToken() async {
    // Create an instance of TestApis to access the prefs variable
    TestApis testApis = TestApis();

    // Initialize prefs if it is not already initialized
    if (testApis.prefs == null) {
      testApis.prefs = await SharedPreferences.getInstance();
    }

    // Get the token from SharedPreferences
    return testApis.prefs?.getString('token') ?? "";
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // Measure the start time
      String token = await _getToken();

      await Future.delayed(Duration(seconds: 1));

      setState(() {
        showText = true;
      });
      await Future.delayed(Duration(seconds: 1));
      // Navigate to the appropriate screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => token.isEmpty ? LoginScreen() : Home(),
        ),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Kbackblue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: width * 0.5,
            ),
            if (!showText)
              JumpingDots(
                color: Colors.white,
                radius: 20,
                numberOfDots: 3,
                animationDuration: Duration(milliseconds: 200),
              ),
            if (showText)
              Text(
                'goodspace',
                style: TextStyle(
                    color: Kbackwhite,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
