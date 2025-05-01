import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/authpage/login.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFD54F), // Light Yellow
              Color(0xFF7E57C2), // Purple
              Color(0xFF000000), // Black
              Color(0xFF7E57C2), // Purple
              Color(0xFFFFD54F), // Light Yellow
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(200),
                    Text(
                      "Get things done, One task at a time",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(16),
                    Text(
                      "Start organizing your life now — because done feels better than perfect",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Gap(80),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade300,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(150, 60),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: Image.asset("assets/LOGO 2.png", height: 80, width: 80),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
