import 'package:flutter/material.dart';
import 'package:mysite/app/utils/contact_utils.dart';
import 'package:mysite/app/widgets/footer.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          color: Color(0x33FFFFFF),
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
    );
  }
}
