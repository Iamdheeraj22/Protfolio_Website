part of 'services.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionHeading(text: '\nWhat I can do?'),
        Space.y(3)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomSectionSubHeading(text: servicesSubHeading),
        ),
        Space.y(5)!,
        OverflowBar(
            alignment: MainAxisAlignment.center,
            spacing: 2,
            overflowSpacing: 2,
            overflowAlignment: OverflowBarAlignment.center,
            children: servicesUtils
                .map(
                  (e) => _ServiceCard(service: e),
                )
                .toList())
      ],
    );
  }
}
