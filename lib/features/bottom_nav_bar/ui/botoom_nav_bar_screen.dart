import 'package:book_stroe/features/welcome/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BotoomNavBarScreen extends StatelessWidget {
  const BotoomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
          IconButton(onPressed: ()async{
            SharedPreferences pref=await SharedPreferences.getInstance();
            await pref.remove('token');
         Navigator.push(context, MaterialPageRoute(builder: (c)=>WelcomeScreen()));
          }, icon: Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
