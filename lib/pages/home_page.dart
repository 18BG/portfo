import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/mobile_drawer.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, contraints) {
      return Scaffold(
          key: scaffoldKey,
          endDrawer:
              contraints.maxWidth >= kMinDesktopWidth ? null : MobileDrawer(),
          backgroundColor: CustomColor.scaffoldBg,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // MAIN
              // if (contraints.maxWidth >= kMinDesktopWidth)
              //   HeaderDesktop()
              // else
              //   HeaderMobile(
              //     onMenuTap: () {
              //       scaffoldKey.currentState!.openEndDrawer();
              //     },
              //     onLogoTap: () {},
              //   ),
              // if (contraints.maxWidth >= kMinDesktopWidth)
              //   MainDesktop()
              // else
              //   MainMobile(),

              // // SKILLS
              // Container(
              //   width: screenWidth,
              //   color: CustomColor.bgLight1,
              //   padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       //title
              //       Text("What I can do",
              //           style: TextStyle(
              //               color: CustomColor.whitePrimary,
              //               fontSize: 24,
              //               fontWeight: FontWeight.bold)),
              //       SizedBox(
              //         height: 50,
              //       ),
              //       //platform and skills
              //       if (contraints.maxWidth >= kMedDesktopWidth)
              //         SkillsDesktop()
              //       else
              //         SkillsMobile()
              //     ],
              //   ),
              // ),
              // PROJECTS
              Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: screenWidth,
                child: Column(
                  children: [
                    // Work projects title
                    Text("Work projects",
                        style: TextStyle(
                            color: CustomColor.whitePrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    // Work projects cards
                    Container(
                      height: 280,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColor.bgLight2,
                      ),
                      child: Column(
                        children: [Image.asset("assets/projects/02.png")],
                      ),
                    )
                  ],
                ),
              ), // CONTACT
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ), // footer
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
            ],
          ));
    });
  }
}
