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
      alignment: Alignment.center,
      child: Wrap(
        spacing: 4.w,
        //crossAxisAlignment: CrossAxisAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSectionHeading(text: 'What I can do?'),
              Space.y(1.w)!,
              SizedBox(
                width: width / 3,
                child: Text(
                  servicesSubHeading,
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 2.w,
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
