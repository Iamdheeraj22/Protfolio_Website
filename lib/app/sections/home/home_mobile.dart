import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysite/analytics_tracking/analytics_tracking.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';
import 'package:mysite/changes/img.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive_size.dart';
import 'package:universal_html/html.dart' as html;

import 'widgets/animation_text.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: UI.horizontal! * 9,
        vertical: UI.vertical! * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.y(2)!,
          EntranceFader(
            offset: const Offset(0, 20),
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppDimensions.normalize(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.brightness == Brightness.dark
                    ? Colors.white.withValues(alpha: 0.03)
                    : Colors.black.withValues(alpha: 0.03),
                border: Border.all(
                  color: theme.primaryColor.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EntranceFader(
                    offset: const Offset(0, -10),
                    delay: const Duration(milliseconds: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          hellotag,
                          style: AppText.h3!.copyWith(
                            fontSize: isFontSize(context, 16),
                            color: theme.primaryColor,
                          ),
                        ),
                        Image.asset(StaticImage.hi, height: 30),
                      ],
                    ),
                  ),
                  Space.y(1)!,
                  EntranceFader(
                    offset: const Offset(0, 10),
                    delay: const Duration(milliseconds: 800),
                    child: Text(
                      yourname,
                      style: TextStyle(
                        fontSize: isFontSize(context, 28),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Space.y(1)!,
                  EntranceFader(
                    offset: const Offset(0, 10),
                    delay: const Duration(milliseconds: 1000),
                    child: AnimatedTextKit(
                      animatedTexts: mobileList,
                      repeatForever: true,
                      isRepeatingAnimation: true,
                    ),
                  ),
                  Space.y(3)!,
                  EntranceFader(
                    offset: const Offset(0, 20),
                    delay: const Duration(milliseconds: 1200),
                    child: ColorChangeButton(
                      text: 'download cv',
                      onTap: () {
                        AnalyticsTracking.logOtherEvent(
                            name: "cv_download",
                            section: {
                              "deviceType": "Mobile",
                            });
                        html.window.open(resume, "pdf");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
