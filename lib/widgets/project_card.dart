import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/projects_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  final ProjectUtils project;
  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 300,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // project image
          Image.asset(
            project.image,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(project.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary,
                )),
          ),
          // subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(project.subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: CustomColor.whiteSecondary,
                )),
          ),
          Spacer(),
          // footer

          Container(
            color: CustomColor.bgLight1,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Text("Available on :",
                    style: TextStyle(
                      color: CustomColor.yellowSecondary,
                      fontSize: 10,
                    )),
                Spacer(),
                if (project.androidLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.androidLink]);
                      },
                      child: Image.asset(
                        "assets/android_icon.png",
                        width: 17,
                      ),
                    ),
                  ),
                if (project.iosLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.iosLink]);
                      },
                      child: Image.asset(
                        "assets/ios_icon.png",
                        width: 22,
                      ),
                    ),
                  ),
                if (project.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.webLink]);
                      },
                      child: Image.asset(
                        "assets/web_icon.png",
                        width: 17,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
