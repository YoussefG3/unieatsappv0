// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile header
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/user-profile.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'john.doe@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Profile menu items
          _buildMenuItem(
            context,
            icon: Icons.account_circle,
            title: 'Account Settings',
            onTap: () => Navigator.pushNamed(context, '/profile/account-settings'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.favorite,
            title: 'Favorites',
            onTap: () => Navigator.pushNamed(context, '/profile/favorites'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.history,
            title: 'Order History',
            onTap: () => Navigator.pushNamed(context, '/profile/activity-history'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.share,
            title: 'Refer a Friend',
            onTap: () => Navigator.pushNamed(context, '/profile/refer-friend'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.help,
            title: 'Help',
            onTap: () => Navigator.pushNamed(context, '/profile/help'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.message,
            title: 'Talk to Us',
            onTap: () => Navigator.pushNamed(context, '/profile/talk-to-us'),
          ),
          _buildMenuItem(
            context,
            icon: Icons.info,
            title: 'About Us',
            onTap: () => Navigator.pushNamed(context, '/profile/about-us'),
          ),

          const SizedBox(height: 16),

          // Logout button
          ElevatedButton(
            onPressed: () {
              // Implement logout functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}