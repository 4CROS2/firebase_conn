import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: <Widget>[
              Text('loading'.capitalize()),
              LinearProgressIndicator(
                // ignore: deprecated_member_use
                year2023: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
