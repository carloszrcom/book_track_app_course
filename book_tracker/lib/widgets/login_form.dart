import 'package:flutter/material.dart';
import 'input_decoration.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Escriba su email';
                }
                return null;
              },
              controller: _emailController,
              decoration: buildInputDecorator(
                label: 'Correo electrónico',
                hintText: 'prueba@ejemplo.com',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Escriba su contraseña';
                }
                return null;
              },
              controller: _passwordController,
              obscureText: true,
              decoration: buildInputDecorator(
                label: 'Contraseña',
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: Colors.amber,
              textStyle: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            child: Text('Registrarse'),
          ),
        ],
      ),
    );
  }
}
