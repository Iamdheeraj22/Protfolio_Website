import 'package:flutter/material.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/app/widgets/footer.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: size.width / 8),
      child: Column(
        children: [
          Container(
            color: Colors.white.withOpacity(0.2),
            height: 1,
            margin: EdgeInsets.only(bottom: 10),
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Footer(),
                SizedBox(
                  width: 15,
                ),
                Wrap(
                  children: contactUtils
                      .asMap()
                      .entries
                      .map((e) => IconButton(
                            icon: Image.network(
                              e.value.icon,
                              color: theme.textColor,
                              height: 35,
                              width: 35,
                            ),
                            onPressed: () => openURL(e.value.url),
                            highlightColor: Colors.white54,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
