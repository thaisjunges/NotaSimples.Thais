import 'package:flutter/material.dart';

class menuHomePage extends StatefulWidget {
  const menuHomePage({super.key});

  @override
  State<menuHomePage> createState() => _menuHomePageState();
}

class _menuHomePageState extends State<menuHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Lateral"),
      ),
      body: const SingleChildScrollView(
        child: Text("Menu Lateral"),
      ),
    );
  }
}
