import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goodspace/Apis%20Repo/test_apis.dart';
import 'package:goodspace/Screens/otp_screen.dart';
import 'package:goodspace/Ui%20Componenets/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

String phone = "";

class _LoginScreenState extends State<LoginScreen> {
  PageController _pageController = PageController();
  List<String> imageList = [
    'assets/login.png',
    'assets/login2.png',
    'assets/login3.png'
  ];
  int _currentPage = 0;
  late Timer _timer;
  TextEditingController _phonecontroller = TextEditingController();
  Widget belowField = Text(
    'You will receive a 4 digit OTP.',
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey[600],
    ),
  );
  @override
  void initState() {
    super.initState();
    // Set up a timer to automatically scroll every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < imageList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  height: width * 0.8,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imageList.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      double scale = (1 - (_currentPage - index).abs() * 0.1)
                          .clamp(0.9, 1.0);
                      return Transform.scale(
                        scale: scale,
                        child: Image.asset(
                          imageList[index],
                          width: width * 0.8,
                          height: width * 0.8,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: width * 0.1,
                ),
                Text(
                  'Please enter your phone number to sign in GoodSpace account.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  cursorHeight: 15,
                  onChanged: (value) {
                    setState(() {
                      if (_phonecontroller.text.length > 10 ||
                          _phonecontroller.text.length < 10) {
                        belowField = Text(
                          'Please enter a valid mobile number.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        );
                      } else {
                        belowField = Text(
                          'You will receive a 4 digit OTP.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                        );
                      }
                    });
                  },
                  controller: _phonecontroller,
                  keyboardType: TextInputType.number,
                  cursorColor: Kbackblue,
                  decoration: InputDecoration(
                    icon: Image.asset(
                      'assets/flag.png',
                      scale: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Please enter Mobile no.',
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: belowField,
                ),
                SizedBox(
                  height: width * 0.15,
                ),
                SizedBox(
                  width: width * 0.8,
                  height: height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      phone = _phonecontroller.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(),
                        ),
                      );
                      if (_phonecontroller.text.length > 10 ||
                          _phonecontroller.text.length < 10) {
                        setState(() {
                          phone = _phonecontroller.text;
                          belowField = Text(
                            'Please enter a valid mobile number.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          );
                        });
                      } else {
                        TestApis().getOtp(_phonecontroller.text).then(
                              (value) => {
                                if (value == "success")
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'OTP sent successfully on your mobile number.'),
                                      ),
                                    ),
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OTPScreen(),
                                        ),
                                      )
                                    },
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'OTP not sent. Please check No. and try again.'),
                                      ),
                                    ),
                                  }
                              },
                            );
                      }
                    },
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Kbackblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }
}
