import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.onNaveItemTap});
  final Function(int) onNaveItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          //
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
                onTap: () {
                  onNaveItemTap(i);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                leading: Icon(navIcons[i]),
                title: Text(navTitles[i]),
                titleTextStyle: TextStyle(
                    color: CustomColor.whitePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
