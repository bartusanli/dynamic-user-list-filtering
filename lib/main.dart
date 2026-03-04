import 'package:flutter/material.dart';
// Note: Ensure your inkwellcontainers.dart file is in the same directory or update the path
import 'package:vize/inkwellcontainers.dart';

void main() {
  runApp(const MyApp());
}

/// 1. Data Model - Professional apps use objects to handle data
class UserProfile {
  final String name;
  final String gender;
  final IconData icon;

  UserProfile({required this.name, required this.gender, this.icon = Icons.person_outline});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Directory Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue, // Modern Material 3 theme
      ),
      home: UserDirectoryPage(),
    );
  }
}

class UserDirectoryPage extends StatelessWidget {
   UserDirectoryPage({super.key});

  // 2. Data Source - In a real app, this would come from an API or Database
  final List<UserProfile> users = [
    UserProfile(name: "Peter Asnor", gender: "male"),
    UserProfile(name: "Julia Iron", gender: "female"),
    UserProfile(name: "Ellan Welch", gender: "female"),
    UserProfile(name: "Ethan Kartner", gender: "male"),
    UserProfile(name: "Maison Franz", gender: "male"),
    UserProfile(name: "Ashley Jhonsson", gender: "female"),
    UserProfile(name: "Terry Green", gender: "male"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Column(
          children: [
            Text("User Directory", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Bartu Şanlı | 23220030065", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      // 3. ListView.builder is more professional for performance
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: users.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return UserListTile(user: users[index]);
        },
      ),
    );
  }
}

/// 4. Custom Widget - Separating logic into its own class
class UserListTile extends StatelessWidget {
  final UserProfile user;

  const UserListTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final bool isFemale = user.gender.toLowerCase() == 'female';

    // Professional touch: Define colors based on gender
    final Color genderColor = isFemale ? Colors.pink : Colors.blue;
    final Color genderBackground = isFemale ? Colors.pink.shade50 : Colors.blue.shade50;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: genderBackground,
          child: Text(
            user.name[0], // Shows the first letter
            style: TextStyle(color: genderColor, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          user.gender.toUpperCase(),
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        // Now everyone gets an arrow icon, styled by gender
        trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: genderColor.withOpacity(0.5)
        ),
        onTap: () {
          // Navigation now works for both males and females
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => inkwellcontainers()),
          );
        },
      ),
    );
  }
}