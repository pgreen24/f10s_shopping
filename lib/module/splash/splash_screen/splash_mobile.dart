import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../splash_screen.dart';

class SplashMobileScreen extends StatelessWidget {
  const SplashMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(padding: const EdgeInsets.only(left: 10), child: SplashScreen()),
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