import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice_8_9/login/login.dart';

class LottieAnimationPage extends StatefulWidget {
  const LottieAnimationPage({super.key});

  @override
  State<LottieAnimationPage> createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset('assets/business.json'),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size(180, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LogInPage()));
                },
                child: const Text(
                  'Выйти',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Inter', fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
