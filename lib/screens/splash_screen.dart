import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  String _fullText = 'Powering up your MigX universe...';
  String _visibleText = '';
  late Timer _textTimer;
  int _textIndex = 0;

  @override
  void initState() {
    super.initState();

    _textTimer = Timer.periodic(Duration(milliseconds: 70), (timer) {
      setState(() {
        if (_textIndex < _fullText.length) {
          _visibleText += _fullText[_textIndex];
          _textIndex++;
        } else {
          _textTimer.cancel();
        }
      });
    });

    Timer(Duration(seconds: 4), () {
      _textTimer.cancel();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MigXHomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _textTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade700,
              Colors.purple.shade700,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 120,
                width: 120,
              ),
              SizedBox(height: 30),
              Text(
                _visibleText,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.cyanAccent.shade100,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy home screen placeholder
class MigXHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Welcome to MigX Home')),
    );
  }
}
