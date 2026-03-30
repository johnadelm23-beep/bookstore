import 'package:flutter/material.dart';

class BotoomNavBarScreen extends StatelessWidget {
  const BotoomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
           Icon(Icons.logout)
          ],
        ),
      ),
    );
  }
}
