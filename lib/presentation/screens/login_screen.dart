import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/helpers/decorations.dart';
import 'package:businessman/presentation/widgets/divider.dart';
import 'package:businessman/presentation/widgets/sixteen_padding.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SixteenPadding(
        child: LayoutBuilder(
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
      ),
    );
  }
}

class LoginScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GreetingSection(),
        LoginForm(),
        ToRegistrationText(),
        AppDivider(),
        const Text('login screen'),
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

  String validate(String value) {
    if (value.isEmpty) return "should not be empty";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Form(
          key: loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: Decorations.forIconTextField(
                      Icons.email_rounded, "email"),
                  validator: (value) => validate(value),
                  autofocus: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: Decorations.forIconTextField(
                      Icons.lock_rounded, "password"),
                  validator: (value) => validate(value),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (loginKey.currentState.validate()) {
                    Scaffold.of(context)
                        .showSnackBar(const SnackBar(content: Text("valid")));
                  }
                },
                child: const Text('login'),
              ),
            ],
          )),
    );
  }
}

class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Welcome back dear businessman, the market really needs your deals so login and start selling to satisfy customers",
              // style: TextStyle(
              //   fontSize: 18.0,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToRegistrationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.grey, fontSize: 10.0),
          children: <TextSpan>[
            const TextSpan(text: "Don't have an account? "),
            TextSpan(
                text: 'start your business from here',
                style: const TextStyle(color: Colors.blue),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            locator<NavigationService>().back();
          },
          child: const Icon(Icons.arrow_left_rounded),
        ),
        ElevatedButton(
          onPressed: () {
            locator<NavigationService>()
                .navigateTo("/phone-registration-screen");
          },
          child: const Icon(Icons.arrow_right_rounded),
        ),
      ],
    );
  }
}
