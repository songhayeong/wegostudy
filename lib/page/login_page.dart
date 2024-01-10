import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegostudy/components/define_color.dart';
import 'package:wegostudy/model/token.dart';
import 'package:wegostudy/mvvm/token_view_model.dart';
import 'package:wegostudy/service/api_client.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiClient _apiClient = ApiClient();

  bool _showPassword = false;


  @override
  Widget build(BuildContext context) {

    TokenViewModel tokenViewModel = Provider.of<TokenViewModel>(context, listen:false);

    Future<void> login() async {
      dynamic res = await _apiClient.login(
        idController.text,
        passwordController.text,
      );
      print(res);

      if (res['isSuccess'] == true) {
        tokenViewModel.updateAccessToken(res['data']['accessToken']);
        tokenViewModel.updateRefreshToken(res['data']['refreshToken']);
        Navigator.pushNamed(context, '/login_success');
      } else {
        print(res);
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 180,
          ),
          const Center(
            child: Text(
              "ㅈㄸㅇ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: idTextFormField(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: passwordTextFormField(),
          ),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
              ),
              const Text(
                "아이디 저장",
              ),
              const SizedBox(
                width: 180,
              ),
              const Text("아이디 비밀번호 찾기"),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: login,
              child: Container(
                width: 500,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(DefineColor.loginBtnColor),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                  child: Text(
                    "로그인",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("새로운 계정이 필요하신가요?",
                  style: TextStyle(
                    fontSize: 14,
                    //fontWeight: FontWeight.wSymbol(figma.mixed),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("회원가입",
                    style: TextStyle(
                      color: Color(DefineColor.loginBtnColor),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(DefineColor.loginBtnColor),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget idTextFormField() {
    return TextFormField(
      controller: idController,
      decoration: InputDecoration(
        hintText: "id",
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      obscureText: _showPassword,
      controller: passwordController,
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              () => _showPassword = !_showPassword;
            });
          },
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
