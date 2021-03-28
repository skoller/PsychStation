import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFxn, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    // String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFxn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  // var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFxn(
        _userEmail.trim(),
        _userPassword.trim(),
        // _userName.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  
                    TextFormField(
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        // labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onSaved: (value) {
                        _userEmail = value;
                      },
                    ),


                  // TextFormField(
                  //   key: ValueKey('username'),
                  //   validator: (value) {
                  //     if (value.isEmpty || value.length < 4) {
                  //       return 'Username must be at least 4 characters.';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(labelText: "Username"),
                  //   onSaved: (value) {
                  //     _userName = value;
                  //   },
                  // ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(height: 12),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      // style: ,
                      child: Text(_isLogin ? "Login" : 'Signup'),
                      onPressed: _trySubmit,
                    ),
                  if (!widget.isLoading)
                    ElevatedButton(
                      // textColor: Theme.of(context).primaryColor,
                      child: Text(_isLogin
                          ? "Create New Account"
                          : 'I already have an Account.'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
