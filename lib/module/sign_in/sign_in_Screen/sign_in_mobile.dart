import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../sign_in_screen.dart';

class SignInMobile  extends StatelessWidget {
  const SignInMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(padding: const EdgeInsets.only(left: 10), child: SignInPage()),
            ),
            const Center(
              child: Padding(padding: EdgeInsets.only(bottom: 30), child: CupertinoActivityIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}