import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/authpage/register.dart';
import 'package:todo_app/mainpages/home.dart';
import 'package:todo_app/widgets/auth_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFD54F),
                Color(0xFF7E57C2),
                Color(0xFF000000),
                Color(0xFF7E57C2),
                Color(0xFFFFD54F),
              ],
            ),
          ),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(100),
                  Image.asset("assets/LOGO 2.png", width: 150, height: 150),
                  Text(
                    "Log in to your account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Gap(20),
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        Gap(10),
                        AuthField(
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username is required';
                            }
                            if (!RegExp(r'^[a-zA-Z0-9]').hasMatch(value)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          hintText: "Username",
                          prefixIcon: Icons.face,
                          isPassword: false,
                        ),
                        Gap(10),
                        AuthField(
                          controller: passController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          hintText: "Password",
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                        ),
                        const Gap(10),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => HomePage(
                                        username: usernameController.text,
                                      ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade300,
                            foregroundColor: Colors.black,
                            fixedSize: const Size(395, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
                          },
                          child: const Text(
                            "Don't have an account? Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
