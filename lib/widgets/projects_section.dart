import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/projects_utils.dart';
import 'package:my_portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
          SizedBox(
            height: 50,
          ),

          // Work projects cards
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1050),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: workProjectUtils[i],
                  ),
              ],
            ),
          ),

          SizedBox(
            height: 80,
          ),
          // hobby projects title
          Text("Hobby projects",
              style: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 50,
          ),

          // hobby projects cards
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1050),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: hobbyProjectUtils[i],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
