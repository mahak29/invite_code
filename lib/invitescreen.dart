import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invite_code/loginscreen.dart';
import 'package:another_flushbar/flushbar.dart';

class InviteScreen extends StatefulWidget {
  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  TextEditingController code = TextEditingController();

  void dispose() {
    code.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  const Text(
                    "Continue with invite code",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextField(
                      controller: code,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 5,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.tealAccent.shade400)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.tealAccent.shade400)),
                          hintText: "Add invite code",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                      cursorColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      FirebaseFirestore.instance
                          .collection('Invite code')
                          .doc('IsQCSO6qFSsUZ6PzrjxU')
                          .get()
                          .then((document) {
                        if (code.text.toString() == document.data()!['code']) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        } else {
                          Flushbar(
                            duration: Duration(milliseconds: 8000),
                            flushbarPosition: FlushbarPosition.TOP,
                            message: 'Invalid code. Please try again',
                            backgroundColor: Colors.redAccent,
                          )..show(context);
                        }
                        code.clear();
                      });
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.greenAccent.shade200),
                    ),
                  ),
                  const SizedBox(
                    height: 220,
                  ),
                  const Text(
                    "No invite code?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                          text:
                              "if you want an invite code and get early access, \n \t \t \t \t \t \t \t please fill out ",
                          //   overflow: TextOverflow.visible,
                          //  maxLines: 2,
                          // softWrap: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text: "this form",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                    color: Colors.white)),
                            WidgetSpan(
                                child: Icon(
                              Icons.launch_rounded,
                              color: Colors.white,
                              size: 14,
                            ))
                          ]),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
