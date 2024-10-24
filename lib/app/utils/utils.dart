import 'package:flutter/material.dart';
import 'package:mysite/app/sections/contact/contact.dart';
import 'package:mysite/app/sections/home/home.dart';
import 'package:mysite/app/sections/services/services.dart';
import 'package:mysite/app/widgets/footer.dart';

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    Services(),
    Contact(),
    Footer(),
  ];
}
