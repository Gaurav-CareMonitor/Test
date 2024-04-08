import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';

import '../../core/config/app_config.dart';
import '../../gen/assets.gen.dart';
import '../../utils/ts.dart';
import '../../widgets/app_button.dart';
import '../../widgets/box.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Auth0 auth0 = Auth0(AppConfig.auth0Domain, AppConfig.auth0ClientId);

  Future<void> login() async {
    final Credentials credentials = await auth0
        .webAuthentication(scheme: AppConfig.auth0Scheme)
        // Use a Universal Link callback URL on iOS 17.4+ / macOS 14.4+
        // useHTTPS is ignored on Android
        .login(useHTTPS: true);

    print(credentials);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(40),
                    child: Assets.icons.fullLogo.image(height: 70)),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                      'Monitor your health and communicate with your care team',
                      textAlign: TextAlign.center,
                      style: Ts.bold32()),
                ),
                const HBox(60),
                AppButton(
                  text: 'Sign Up',
                  onPressed: login,
                ),
                const HBox(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Already have an account? ', style: Ts.regular16()),
                    GestureDetector(
                      onTap: login,
                      child:
                          Text('Sign in', style: Ts.bold16(isUnderline: true)),
                    )
                  ],
                ),
                const HBox(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
