import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisteredUsersPage extends StatelessWidget {
  const RegisteredUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Users'),
      ),
      body: FutureBuilder<int>(
        future: _fetchTotalRegisteredUsers(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final totalUsers = snapshot.data;
            return Center(
              child: Text('Total Registered Users: $totalUsers'),
            );
          }
        },
      ),
    );
  }

  Future<int> _fetchTotalRegisteredUsers() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      final UserCredential result = await auth.signInAnonymously();
      final User? currentUser = result.user;
      if (currentUser != null) {
        final List<UserInfo>? userInfos = await currentUser.providerData;
        return userInfos?.length ?? 0;
      }
    } catch (e) {
      debugPrint('Error fetching total registered users: $e');
    }

    return 0;
  }
}
