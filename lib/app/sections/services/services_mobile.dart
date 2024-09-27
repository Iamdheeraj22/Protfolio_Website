part of 'services.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const CustomSectionHeading(text: '\nWhat I can do?'),
        Space.y(3.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: servicesSubHeading),
        ),
        Space.y(5.w)!,
        //Create a CarouselView for the services
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 10.w),
        //   alignment: Alignment.center,
        //   height: height * 0.35,
        //   child: CarouselView(
        //     padding: EdgeInsets.only(right: 5.w),
        //     controller: CarouselController(),
        //     itemExtent: 330,
        //     children: List<Widget>.generate(
        //       servicesUtils.length,
        //       (index) => Padding(
        //         padding: EdgeInsets.symmetric(vertical: 0.5.w),0
        //         child: _ServiceCard(service: servicesUtils[index]),
        //       ),
        //     ),
        //   ),
        // ),
        Wrap(
            children: servicesUtils
                .map(
                  (e) => _ServiceCard(service: e),
                )
                .toList())
      ],
    );
  }
}
