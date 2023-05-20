import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Image1 extends StatelessWidget {
  const Image1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("imege"),
      ),
      body: const SafeArea(
        child: Center(
          child: SizedBox(
            height: 300,
            child: Image(
              image: AssetImage('images/1.jpg'),
              width: double.infinity,
              height: 255,
            ),
          ),
        ),
      ),
    );
  }
}
