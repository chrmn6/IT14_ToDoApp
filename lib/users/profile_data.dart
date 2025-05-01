import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/users/edit_textfield.dart';
import 'package:todo_app/users/user_notifier.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => EditProfilePageState();
}

class EditProfilePageState extends ConsumerState<EditProfilePage> {
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passController;
  late TextEditingController conpassController;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider);
    emailController = TextEditingController(text: user.email);
    usernameController = TextEditingController(text: user.username);
    passController = TextEditingController(text: user.password);
    conpassController = TextEditingController(text: user.conpassword);
  }

  void saveProfile() {
    ref
        .read(userProvider.notifier)
        .updateProfile(
          email: emailController.text,
          username: usernameController.text,
          password: passController.text,
          conpassword: conpassController.text,
        );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Profile updated')));
  }

  void _submitEdit() {
    saveProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            EditProfileWidget(
              hintText: "user@example.com",
              prefixIcon: Icons.email_outlined,
              isPassword: false,
              controller: emailController,
              title: "Email",
            ),
            Gap(5),
            EditProfileWidget(
              hintText: "user@username",
              prefixIcon: Icons.face,
              isPassword: false,
              controller: usernameController,
              title: "Username",
            ),
            Gap(5),
            EditProfileWidget(
              hintText: "Change password",
              prefixIcon: Icons.lock,
              isPassword: true,
              controller: passController,
              title: "Password",
            ),
            Gap(5),
            EditProfileWidget(
              hintText: "Confirm password",
              prefixIcon: Icons.lock,
              isPassword: true,
              controller: conpassController,
              title: "Confirm Password",
            ),
            Gap(10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitEdit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.deepPurple.shade300,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
