import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: LoginScreenContent(),
            ),
          );
        },
      ),
    );
  }
}

class LoginScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GreetingSection(),
        LoginForm(),
        // Divider(color: Colors.grey),
        ToRegistrationText(),
        Divider(color: Colors.grey),
        Text('login screen'),
        MyNavigation(),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  validate(String value) {
    if (value.isEmpty) return "should not be empty";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade200,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: Decorations.decorateFormTextField(
                        Icons.email_rounded, "email"),
                    validator: (value) => validate(value),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: Decorations.decorateFormTextField(
                        Icons.lock_rounded, "password"),
                    validator: (value) => validate(value),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (loginKey.currentState.validate()) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("valid")));
                    }
                  },
                  child: Text('login'),
                ),
              ],
            )),
      ),
    );
  }
}

class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/logo.png'),
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            "Welcome back dear businessman, the market really needs your deals so login and start selling to satisfy customers",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}

class ToRegistrationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.grey, fontSize: 10.0),
          children: <TextSpan>[
            TextSpan(text: "Don't have an account? "),
            TextSpan(
                text: 'start your business from here',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    locator<NavigationService>()
                        .navigateTo("/phone-registration-screen");
                  }),
          ],
        ),
      ),
    );
  }
}

class MyNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            locator<NavigationService>().back();
          },
          child: Icon(Icons.arrow_left_rounded),
        ),
        ElevatedButton(
          onPressed: () {
            locator<NavigationService>()
                .navigateTo("/phone-registration-screen");
          },
          child: Icon(Icons.arrow_right_rounded),
        ),
      ],
    );
  }
}
