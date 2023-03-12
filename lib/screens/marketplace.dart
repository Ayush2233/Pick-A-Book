import 'package:flutter/material.dart';

class marketplace extends StatefulWidget {
  const marketplace({Key? key}) : super(key: key);

  @override
  State<marketplace> createState() => _marketplaceState();
}

class _marketplaceState extends State<marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("MARKETPLACE PAGE"),),);
  }
}
