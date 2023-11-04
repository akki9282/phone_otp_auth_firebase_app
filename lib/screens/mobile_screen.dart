import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_munim/screens/otp_verfication_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  bool loader = false;
  bool absorbingValue = false;
  final countryCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  void initState() {
    countryCodeController.text = '+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(
          children: [
            if (loader)
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                    // backgroundColor: Colors.amber,
                  ))),
            AbsorbPointer(
              absorbing: absorbingValue,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        fit: BoxFit.fitWidth,
                        'assets/sign-up-form.svg',
                        semanticsLabel: 'My SVG Image',
                        height: MediaQuery.of(context).size.height * 0.4,
                        // width: 200,
                      ),
                    ),
                    Text(
                      'Enter Mobile\nNumber',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 54, 54, 54),
                      ),
                    ),
                    Text(
                      'We will send you an OTP message',
                      style: TextStyle(
                          color: Color.fromARGB(255, 152, 151, 151),
                          fontSize: 15),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(0)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 35,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              controller: countryCodeController,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 2),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: TextField(
                                maxLength: 10,
                                controller: phoneNumberController,
                                keyboardType: TextInputType.phone,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // if (isClick) {
                        //   return;
                        // }

                        if (phoneNumberController.text.length != 10) {
                          Fluttertoast.showToast(
                              msg: 'Please enter valid mobile number');
                          return;
                        }
                        Fluttertoast.showToast(
                            msg: 'Wait while we send verification code');
                        setState(() {
                          loader = true;
                          absorbingValue = true;
                        });
                        // isClick = true;
                        // CircularProgressIndicator();

                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                              '${countryCodeController.text + phoneNumberController.text}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {
                            setState(() {
                              loader = false;
                              absorbingValue = false;
                            });
                            print('faild');
                            Fluttertoast.showToast(msg: e.message.toString());
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            setState(() {
                              loader = false;
                              absorbingValue = false;
                            });
                            Fluttertoast.showToast(
                                msg: 'OTP sent sussessfully');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => OtpVerification(
                                          verificationId: verificationId,
                                        )));
                            print('otp sent');
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => OtpVerification()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        // margin: EdgeInsets.all(10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send OTP',
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
          ],
        )),
      ),
    );
  }
}
