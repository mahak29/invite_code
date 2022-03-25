import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:invite_code/invitescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phonecontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.greenAccent.shade200,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InviteScreen()));
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Please provide your number",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IntlPhoneField(
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.tealAccent.shade400)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.tealAccent.shade400)),
                    ),
                    showCountryFlag: false,
                    textAlign: TextAlign.left,
                    dropdownIconPosition: IconPosition.trailing,
                    flagsButtonPadding:
                        const EdgeInsets.only(left: 65, right: 30),
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    dropdownTextStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    cursorColor: Colors.grey,
                    dropdownIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "We will send an OTP to verify this \n \t \t \t \t \t \t \t \t \t \t \t\tnumber",
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                    width: 122,
                    child: ElevatedButton(
                      onPressed: null,
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.greenAccent.shade200),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: const Divider(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                    ),
                    const Text(
                      "Or",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: const Divider(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/google_logo.png",
                            height: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Continue with Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black,
                          ),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.greenAccent.shade200))),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
