import 'package:flutter/material.dart';
import 'package:wegostudy/components/image_assets.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageAssets.testBackgroundImg),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // 투명색
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 300,
              ),
              const Text(
                "일상의 고민은\n여기에,\n재떨이",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 300,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: appStartButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appStartButton() {
    return Container(
      //width: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 70,
      child: Center(
        child: Text(
          "재떨이 시작하기",
          style: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
