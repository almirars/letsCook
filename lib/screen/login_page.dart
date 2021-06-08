import 'package:flutter/material.dart';
import 'package:lets_cook/screen/home.dart';
import 'package:lets_cook/database/dbHelper.dart';
import 'package:lets_cook/model/userSql.dart';
import 'package:lets_cook/register.dart';
import 'package:lets_cook/sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  static String tag = 'login-page';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext _ctx;
  DbHelper dbHelper = DbHelper();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: userNameController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.black,
        ),
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.black,
        ),
      ),
    );
    _ctx = context;
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: FlatButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: () async {
          signInWithEmailAndPassword(
                  userNameController.text, passwordController.text)
              .then((result) {
            if (result != null) {
              Navigator.pushNamed(context, HomeScreen.tag, arguments: result);
            }
          });
        },
        color: Colors.white,
        child: Text('LOGIN', style: TextStyle(color: Colors.black)),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Register',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () async {
        var user = await navigateToRegister(context, null);
        if (user != null) {
          int result = await dbHelper.insertUser(user);
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 150),
          children: <Widget>[
            Center(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("Let's Cook",
                        style: TextStyle(
                          fontFamily: 'RalewayLight',
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        )),
                    Container(
                        child: Image(
                      image: AssetImage("image/logo.png"),
                      fit: BoxFit.contain,
                      height: 250,
                      width: 200,
                    )),
                  ]),
            ),
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            Container(
              alignment: Alignment.center,
              child: Text("atau"),
            ),
            SizedBox(
              height: 20,
            ),
            _signInButton(),
            SizedBox(height: 24.0),
            forgotLabel,
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return RaisedButton(
      splashColor: Colors.grey,
      color: Colors.white,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen(id);
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<UserSql> navigateToRegister(BuildContext context, UserSql user) async {
  var result = await Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return RegisterPage(user);
  }));
  return result;
}
