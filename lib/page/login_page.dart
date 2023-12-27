import 'package:flutter/material.dart';
import 'package:wegostudy/components/define_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
            child: textField("아이디"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: textField("비밀번호"),
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
          const SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "새로운 계정이 필요하신가요?",
                  style: TextStyle(
                    fontSize: 14,
                    //fontWeight: FontWeight.wSymbol(figma.mixed),
                  )
              ),
              Text(
                  "회원가입",
                  style: TextStyle(
                    color: Color(DefineColor.loginBtnColor),
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(DefineColor.loginBtnColor),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget textField(String name) {
    return Container(
      width: 500,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
