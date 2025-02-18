import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sms_links.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/mobile_drawer.dart';
import 'package:my_portfolio/widgets/projects_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, contraints) {
      return Scaffold(
          key: scaffoldKey,
          endDrawer: contraints.maxWidth >= kMinDesktopWidth
              ? null
              : MobileDrawer(
                  onNaveItemTap: (p0) {
                    // call function
                    scaffoldKey.currentState?.closeDrawer();
                    scrollToSection(navIndex: p0);
                  },
                ),
          backgroundColor: CustomColor.scaffoldBg,
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  key: navBarKeys.first,
                ),
                // MAIN
                if (contraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(
                    onNavItemTap: (int navIndex) {
                      // call function
                      scrollToSection(navIndex: navIndex);
                    },
                  )
                else
                  HeaderMobile(
                    onMenuTap: () {
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                    onLogoTap: () {},
                  ),
                if (contraints.maxWidth >= kMinDesktopWidth)
                  MainDesktop()
                else
                  MainMobile(),

                // SKILLS
                Container(
                  key: navBarKeys[1],
                  width: screenWidth,
                  color: CustomColor.bgLight1,
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //title
                      Text("What I can do",
                          style: TextStyle(
                              color: CustomColor.whitePrimary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 50,
                      ),
                      //platform and skills
                      if (contraints.maxWidth >= kMedDesktopWidth)
                        SkillsDesktop()
                      else
                        SkillsMobile()
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // PROJECTS
                ProjectsSection(
                  key: navBarKeys[2],
                ),
                SizedBox(
                  height: 30,
                ),
                // CONTACT
                ContactSection(
                  key: navBarKeys[3],
                ),
                // FOOTER
                Footer()
              ],
            ),
          ));
    });
  }

  void scrollToSection({required int navIndex}) {
    if (navIndex == 4) {
      //open blog
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
