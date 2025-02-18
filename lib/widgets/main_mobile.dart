import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sreenWidth = screenSize.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenSize.height * 0.89,
      //constraints: BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //avatar
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg,
                CustomColor.scaffoldBg.withValues(alpha: 0.2)
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "assets/my_flutter_avatar.png",
              width: sreenWidth,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Hi,\nI'm Babry GALEDOU\nA Flutter Developer",
            style: TextStyle(
                fontSize: 24.0,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 190,
            child: ElevatedButton(
                //  style: ButtonStyle(backgroundColor: ),
                onPressed: () {},
                child: Text("Get in touch")),
          ),
        ],
      ),
    );
  }
}
