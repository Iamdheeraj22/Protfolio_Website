part of 'services.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionHeading(text: '\nWhat I can do?'),
        Space.y(3.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: servicesSubHeading),
        ),
        Space.y(5.w)!,
        OverflowBar(
            alignment: MainAxisAlignment.center,
            spacing: 2.w,
            overflowSpacing: 2.w,
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
