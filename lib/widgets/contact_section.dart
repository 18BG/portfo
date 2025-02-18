import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sms_links.dart';
import 'package:my_portfolio/widgets/custom_textfield.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          Text("Get in touch",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary,
              )),
          SizedBox(
            height: 50,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 700, maxHeight: 100),
              child: LayoutBuilder(builder: (context, contraints) {
                if (contraints.maxWidth >= kMinDesktopWidth) {
                  return builNameEmailFieldDesktop();
                } else {
                  return builNameEmailFieldMobile();
                }
              })),
          SizedBox(
            height: 15,
          ),
          //message
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextfield(
              maxLine: 16,
              hintText: "Your messsage",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //Send button
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.yellowPrimary),
                  onPressed: () {},
                  child: Text("Get in touch",
                      style: TextStyle(
                        color: Colors.white,
                      ))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 700), child: Divider()),
          SizedBox(
            height: 15,
          ),
          //SMS icon Button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.github]);
                },
                child: Image.asset(
                  "github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.facebook]);
                },
                child: Image.asset(
                  "facebook.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.linkedIn]);
                },
                child: Image.asset(
                  "linkedin.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.telegram]);
                },
                child: Image.asset(
                  "telegram.png",
                  width: 28,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row builNameEmailFieldDesktop() {
    return Row(
      children: [
        //name
        Flexible(
            child: CustomTextfield(
          hintText: "Your name",
        )),
        SizedBox(
          width: 15,
        ),
        //email
        Flexible(
            child: CustomTextfield(
          hintText: "Your email",
        )),
      ],
    );
  }

  Column builNameEmailFieldMobile() {
    return Column(
      children: [
        //name
        Flexible(
            child: CustomTextfield(
          hintText: "Your name",
        )),
        SizedBox(
          height: 15,
        ),
        //email
        Flexible(
            child: CustomTextfield(
          hintText: "Your email",
        )),
      ],
    );
  }
}
