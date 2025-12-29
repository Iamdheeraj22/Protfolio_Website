import 'package:flutter/material.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/core/util/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    //  double height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Developed by "),
            InkWell(
              onTap: () => openURL(gitHub),
              child: const Text(
                " Dheeraj Prajapat 💙",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(" © ${DateTime.now().year}"),
          ],
        ),
      ),
    );
  }
}
