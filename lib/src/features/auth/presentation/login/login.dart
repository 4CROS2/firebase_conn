import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'login'.capitalize(),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    fontFamily: '',
                  ),
                ),
              ),
              TextFormField(
                controller: _emailController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'llena este campo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'llena este campo';
                  }
                  return null;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  context.push('/test');
                },
                child: Text('enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
