import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:lottie/lottie.dart';
import 'package:online_munim/screens/home_screen.dart';
import 'package:pinput/pinput.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class OtpVerification extends StatefulWidget {
  final String verificationId;
  const OtpVerification({required this.verificationId});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final pinController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset("assets/animation_lo40hlk7.json"),
              ),
              Text(
                'OTP\nVerification',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 54, 54, 54),
                ),
              ),
              Text(
                'Enter the verification code sent on\nthe mobile number',
                style: TextStyle(
                    color: Color.fromARGB(255, 152, 151, 151), fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Pinput(
                length: 6,
                controller: pinController,
                closeKeyboardWhenCompleted: true,
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                    decoration: BoxDecoration(border: Border.all()),
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    textStyle: TextStyle(fontSize: 20)),
                focusedPinTheme: PinTheme(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orangeAccent),
                    ),
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    textStyle: TextStyle(fontSize: 20)),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Change Number'),
              //     Text('Resend OTP'),
              //   ],
              // ),
              GestureDetector(
                onTap: () async {
                  if (pinController.length != 6) {
                    Fluttertoast.showToast(msg: 'Enter valid OTP');
                    return;
                  }

                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: pinController.text);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Fluttertoast.showToast(msg: 'Verification Completed');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                    print('verified successfully');
                  } catch (e) {
                    Fluttertoast.showToast(
                        msg: 'You have entered wrong OTP, try again');
                    print('verified failed');
                    // Fluttertoast.showToast(
                    //     msg: "This is a Toast message",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.CENTER,
                    //     timeInSecForIosWeb: 1,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 50),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verify OTP',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
