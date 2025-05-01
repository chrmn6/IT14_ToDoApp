import 'package:flutter/material.dart';
import 'package:todo_app/authpage/start_page.dart';
import 'package:todo_app/users/profile_data.dart';
import 'package:todo_app/utils/drawer_item.dart';
import 'package:todo_app/utils/subdrawer_widget.dart';

class TodoAppDrawer extends StatelessWidget {
  final String username;

  const TodoAppDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
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
            accountName: Text(
              "Hello, $username",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              "Organize your tasks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerItem(
                  icon: Icons.person_2_outlined,
                  title: "Edit Profile",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ),
                    );
                  },
                ),
                Divider(height: 5, thickness: 1.5),
                DrawerItem(
                  icon: Icons.list_alt,
                  title: "All Tasks",
                  onTap: () => Navigator.pop(context),
                ),
                DrawerItem(
                  icon: Icons.check_circle_outline,
                  title: "Completed Tasks",
                  onTap: () => Navigator.pop(context),
                ),
                DrawerItem(
                  icon: Icons.pending_actions,
                  title: "Incomplete Tasks",
                  onTap: () => Navigator.pop(context),
                ),
                ExpansionTile(
                  leading: Icon(Icons.calendar_today_outlined),
                  title: Text("Categories"),
                  children: [
                    SubDrawerItem(
                      icon: Icons.circle,
                      title: "WORK",
                      iconColor: Colors.blue,
                      onTap: () => Navigator.pop(context),
                    ),
                    SubDrawerItem(
                      icon: Icons.circle,
                      title: "PERSONAL",
                      iconColor: Colors.green,
                      onTap: () => Navigator.pop(context),
                    ),
                    SubDrawerItem(
                      icon: Icons.circle,
                      title: "ACADEMICS",
                      iconColor: Colors.red,
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Divider(height: 5, thickness: 1.5),
                DrawerItem(
                  icon: Icons.settings,
                  title: "Settings",
                  onTap: () => Navigator.pop(context),
                ),
                DrawerItem(
                  icon: Icons.help_outline,
                  title: "Help & Support",
                  onTap: () => Navigator.pop(context),
                ),
                DrawerItem(
                  icon: Icons.info_outline,
                  title: "About",
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                print('User logged out');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StartPage()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
