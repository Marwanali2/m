import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final String userId, sessionId;
  const HomeView({required this.sessionId,required this.userId,super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('$sessionId , $userId'),
      ),
    );
  }
}
