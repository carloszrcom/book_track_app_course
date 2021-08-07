import 'package:book_tracker/widgets/creeate_account_form.dart';
import 'package:book_tracker/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isCreateAccountClicked = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: HexColor('#b9c2d1'),
              ),
            ),
            Text('Regístrate', style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 10),
            Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: isCreateAccountClicked != true
                      ? LoginForm(
                          formKey: _formKey,
                          emailController: _emailController,
                          passwordController: _passwordController,
                        )
                      : CreateAccountForm(
                          formKey: _formKey,
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                ),

                //
                //
                //
                TextButton.icon(
                  icon: Icon(Icons.portrait_rounded),
                  style: TextButton.styleFrom(
                    primary: HexColor('#fd5b28'),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (!isCreateAccountClicked) {
                        isCreateAccountClicked = true;
                      } else
                        isCreateAccountClicked = false;
                    });
                  },
                  label: Text(isCreateAccountClicked
                      ? '¿Ya tienes una cuenta?'
                      : 'Crear una cuenta'),
                )
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: HexColor('#b9c2d1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
