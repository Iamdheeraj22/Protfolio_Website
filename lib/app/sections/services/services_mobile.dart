part of 'services.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            const CustomSectionHeading(text: '\nWhat I can do?'),
            Space.y(3)!,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomSectionSubHeading(text: servicesSubHeading),
            ),
          ],
        ),
        Space.y(5)!,
        Wrap(
            alignment: WrapAlignment.center,
            spacing: 2,
            children: servicesUtils
                .map(
                  (e) => _ServiceCard(service: e),
                )
                .toList())
      ],
    );
  }
}
