import 'package:flutter/material.dart';

void main() {
  runApp(MigXApp());
}

class MigXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MigX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
      ),
      home: MigXHomeScreen(),
    );
  }
}

class MigXHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MigX'),
      ),
      body: Center(
        child: Text(
          'Welcome to MigX!',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
