part of 'services.dart';

class ServiceDesktop extends StatefulWidget {
  const ServiceDesktop({Key? key}) : super(key: key);

  @override
  ServiceDesktopState createState() => ServiceDesktopState();
}

class ServiceDesktopState extends State<ServiceDesktop> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width / 8),
      child: Column(
        children: [
          const CustomSectionHeading(text: '\nWhat I can do?'),
          Space.y(1.w)!,
          CustomSectionSubHeading(text: servicesSubHeading),
          Space.y(2.w)!,
          OverflowBar(
            alignment: MainAxisAlignment.center,
            spacing: 2.w,
            overflowSpacing: 2.w,
            overflowAlignment: OverflowBarAlignment.center,
            children: servicesUtils
                .asMap()
                .entries
                .map(
                  (e) => _ServiceCard(service: e.value),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
