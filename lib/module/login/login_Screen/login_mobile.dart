import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_Screen.dart';


class LoginMobile  extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(padding: const EdgeInsets.only(left: 10), child: LoginPage()),
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