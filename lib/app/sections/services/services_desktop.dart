part of 'services.dart';

class ServiceDesktop extends StatefulWidget {
  const ServiceDesktop({super.key});

  @override
  ServiceDesktopState createState() => ServiceDesktopState();
}

class ServiceDesktopState extends State<ServiceDesktop> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 4,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSectionHeading(text: 'What I can do?'),
              Space.y(1)!,
              SizedBox(
                width: width / 3,
                child: Text(
                  servicesSubHeading,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 2,
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
