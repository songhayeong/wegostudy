import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegostudy/mvvm/token_view_model.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TokenViewModel tokenViewModel =
    //     Provider.of<TokenViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Success Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<TokenViewModel>(
            builder: (context, token, child) {
              return Text(
                "accessToken : ${token.accessToken}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<TokenViewModel>(
            builder: (context, token, child) {
              return Text(
                "accessToken : ${token.refreshToken}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
