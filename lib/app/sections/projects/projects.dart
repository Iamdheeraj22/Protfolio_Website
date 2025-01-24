import 'package:flutter/material.dart';
import 'package:mysite/app/sections/projects/widgets/project_grid.dart';
import 'package:mysite/core/res/responsive.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Projects',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isLargeMobile(context))
              const SizedBox(
                height: 20,
              ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(
              child: Responsive(
                desktop: ProjectGrid(
                  crossAxisCount: 3,
                ),
                extraLargeScreen: ProjectGrid(
                  crossAxisCount: 4,
                ),
                largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
                mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
                tablet: ProjectGrid(
                  ratio: 1.4,
                  crossAxisCount: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
