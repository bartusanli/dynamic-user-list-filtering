import 'package:flutter/material.dart';
// Note: You can keep the import for inkwellcontainers if you use it elsewhere,
// but for this specific directory logic, we are creating a dedicated Female page.
import 'package:vize/inkwellcontainers.dart';

void main() {
  runApp(const MyApp());
}

/// 1. Data Model
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
        colorSchemeSeed: Colors.indigo, // Professional Indigo Theme
      ),
      home: UserDirectoryPage(),
    );
  }
}

class UserDirectoryPage extends StatelessWidget {
  UserDirectoryPage({super.key});

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
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: users.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return UserListTile(user: users[index], allUsers: users);
        },
      ),
    );
  }
}

/// 2. Professional List Tile Widget
class UserListTile extends StatelessWidget {
  final UserProfile user;
  final List<UserProfile> allUsers;

  const UserListTile({super.key, required this.user, required this.allUsers});

  @override
  Widget build(BuildContext context) {
    final bool isFemale = user.gender.toLowerCase() == 'female';
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
            user.name[0],
            style: TextStyle(color: genderColor, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(user.gender.toUpperCase()),
        trailing: Icon(Icons.arrow_forward_ios, size: 14, color: genderColor.withOpacity(0.5)),
        onTap: () {
          if (isFemale) {
            // Filter only Females
            final femaleOnlyList = allUsers.where((u) => u.gender.toLowerCase() == 'female').toList();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FemaleDirectoryPage(femaleUsers: femaleOnlyList),
              ),
            );
          } else {
            // Filter only Males
            final maleOnlyList = allUsers.where((u) => u.gender.toLowerCase() == 'male').toList();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MaleDirectoryPage(maleUsers: maleOnlyList),
              ),
            );
          }
        },
      ),
    );
  }
}

/// 3. Filtered Page for Males
class MaleDirectoryPage extends StatelessWidget {
  final List<UserProfile> maleUsers;
  const MaleDirectoryPage({super.key, required this.maleUsers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Male User Records"), backgroundColor: Colors.blue.shade100),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: maleUsers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.male, color: Colors.blue),
              title: Text(maleUsers[index].name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("Category: Verified Male Profile"),
            ),
          );
        },
      ),
    );
  }
}

/// 4. Filtered Page for Females (Equality Added)
class FemaleDirectoryPage extends StatelessWidget {
  final List<UserProfile> femaleUsers;
  const FemaleDirectoryPage({super.key, required this.femaleUsers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Female User Records"), backgroundColor: Colors.pink.shade100),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: femaleUsers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.female, color: Colors.pink),
              title: Text(femaleUsers[index].name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("Category: Verified Female Profile"),
            ),
          );
        },
      ),
    );
  }
}