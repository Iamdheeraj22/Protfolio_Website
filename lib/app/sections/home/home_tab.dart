import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysite/analytics_tracking/analytics_tracking.dart';
import 'package:mysite/app/sections/home/widgets/animation_text.dart';
import 'package:mysite/app/widgets/color_chage_btn.dart';
import 'package:mysite/changes/img.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive_size.dart';
import 'package:universal_html/html.dart' as html;

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: UI.horizontal! * 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: EntranceFader(
              offset: const Offset(-20, 0),
              delay: const Duration(milliseconds: 200),
              duration: const Duration(milliseconds: 1000),
              child: Container(
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EntranceFader(
                      offset: const Offset(0, -10),
                      delay: const Duration(milliseconds: 400),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            hellotag,
                            style: AppText.h3!.copyWith(
                              fontSize: isFontSize(context, 18),
                              color: theme.primaryColor,
                            ),
                          ),
                          EntranceFader(
                            offset: const Offset(0, 0),
                            delay: const Duration(seconds: 1),
                            duration: const Duration(milliseconds: 800),
                            child: Image.asset(StaticImage.hi, height: 22),
                          ),
                        ],
                      ),
                    ),
                    Space.y(1)!,
                    EntranceFader(
                      offset: const Offset(0, 10),
                      delay: const Duration(milliseconds: 600),
                      child: Text(
                        yourname,
                        style: TextStyle(
                          fontSize: isFontSize(context, 38),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    EntranceFader(
                      offset: const Offset(0, 10),
                      delay: const Duration(milliseconds: 800),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "A ",
                            style: TextStyle(
                              fontSize: isFontSize(context, 24),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          AnimatedTextKit(
                            animatedTexts: tabList,
                            isRepeatingAnimation: true,
                            repeatForever: true,
                          ),
                        ],
                      ),
                    ),
                    Space.y(2)!,
                    EntranceFader(
                      offset: const Offset(0, 20),
                      delay: const Duration(milliseconds: 1000),
                      child: ColorChangeButton(
                        text: 'download cv',
                        onTap: () async {
                          await AnalyticsTracking.logOtherEvent(
                              name: "cv_download",
                              section: {
                                "deviceType": "Tablet",
                              });
                          html.window.open(resume, "pdf");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
