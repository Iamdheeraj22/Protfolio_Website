import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysite/app/sections/experience/model/experience_model.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:sizer/sizer.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key, required this.model});

  final ExperienceModel model;

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        right: 30,
        left: 30,
        bottom: 20,
      ),
      //  constraints: BoxConstraints(minWidth: width / 4, maxWidth: width / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: lightgrayColor),
            height: 50,
            width: 50,
            margin: EdgeInsets.only(right: 2.w),
            child: Icon(
              Icons.business,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.jobRole,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  model.companyName,
                  style: TextStyle(),
                ),
                if (isMobile) Text('${model.startDate} - ${model.endDate}'),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: model.jobDescription
                      .map(
                        (e) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 5,
                                right: 5,
                              ),
                              child: Icon(
                                Icons.brightness_1,
                                size: 5,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                softWrap: true,
                                e,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (!isMobile)
            Text(
              '${model.startDate} - ${model.endDate}',
            ),
        ],
      ),
    );
  }
}
