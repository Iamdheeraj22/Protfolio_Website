import 'package:flutter/material.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/footer.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          color: Colors.white.withOpacity(0.2),
          height: 1,
          margin: EdgeInsets.only(
            bottom: 10,
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10,
          children: [
            Footer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: contactUtils
                  .asMap()
                  .entries
                  .map((e) => IconButton(
                        icon: Image.network(
                          e.value.icon,
                          color: theme.textColor,
                          height: 35,
                          width: 40,
                        ),
                        onPressed: () => openURL(e.value.url),
                        highlightColor: Colors.white54,
                      ))
                  .toList(),
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
