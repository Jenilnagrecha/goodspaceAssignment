import 'package:flutter/material.dart';
import 'package:goodspace/Apis%20Repo/test_apis.dart';
import 'package:goodspace/Screens/home.dart';
import 'package:goodspace/Screens/login.dart';
import 'package:goodspace/Ui%20Componenets/colors.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String finalOtp = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: Text(
              'Change Number',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.1,
          right: width * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OTP sent to +91 ' + phone + '\nenter OTP to confirm your phone',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'You will receive a four digit verfication code.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            OtpPinField(
              autoFillEnable: false,
              highlightBorder: false,
              textInputAction: TextInputAction.go,
              onSubmit: (text) {
                finalOtp = text;
              },
              onChange: (text) {},
              onCodeChanged: (code) {},
              otpPinFieldStyle: OtpPinFieldStyle(
                defaultFieldBorderColor: Kbackblue,
              ),
              maxLength: 4,
              showCursor: true,
              cursorColor: Kbackblue,
              showDefaultKeyboard: true,
              cursorWidth: 3,
              mainAxisAlignment: MainAxisAlignment.start,
              otpPinFieldDecoration:
                  OtpPinFieldDecoration.defaultPinBoxDecoration,
            ),
            Row(
              children: [
                Text(
                  'Did not receive OTP?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    TestApis().getOtp(phone);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('OTP ReSent successfully.'),
                      ),
                    );
                  },
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(
                      fontSize: 14,
                      color: Kbackblue,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: width * 0.8,
              height: height * 0.075,
              child: ElevatedButton(
                onPressed: () async {
                  await TestApis().verifyOtp(finalOtp).then(
                        (value) => {
                          if (value == true)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('OTP verified successfully.'),
                                ),
                              ),
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                )
                              },
                            }
                          else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('OTP not verified.'),
                                ),
                              ),
                            }
                        },
                      );
                },
                child: Text(
                  'Verify OTP',
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
            SizedBox(
              height: height * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}
