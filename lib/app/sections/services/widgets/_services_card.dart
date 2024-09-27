part of '../services.dart';

class _ServiceCard extends StatefulWidget {
  final ServicesUtils service;

  const _ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        onHover: (isHovering) {
          if (isHovering) {
            setState(() => isHover = true);
          } else {
            setState(() => isHover = false);
          }
        },
        child: Container(
          width: Responsive.isTablet(context) ? 400 : 300,
          constraints: const BoxConstraints(
            minWidth: 300,
            minHeight: 150,
            maxHeight: 300,
            maxWidth: 400,
          ),
          // height: AppDimensions.normalize(100),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
            gradient: isHover ? pinkpurple : theme.serviceCard,
            borderRadius: BorderRadius.circular(15),
            boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.service.icon,
                height: 60,
              ),
              Space.y(3.w)!,
              FittedBox(
                child: Text(
                  widget.service.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isHover ? whiteColor : theme.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Space.y(1.w)!,
              Expanded(
                child: Text(
                  widget.service.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        isHover ? whiteColor.withOpacity(0.8) : theme.textColor,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                ),
              ),
              Space.y(2.w)!,
              if (Responsive.isDesktop(context))
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.service.tool
                        .map((e) => Row(
                              children: [
                                const Text('🛠   '),
                                Text(
                                  e,
                                  style: TextStyle(
                                    color:
                                        isHover ? whiteColor : theme.textColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ))
                        .toList()),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                Expanded(
                  child: ListView(
                      padding: EdgeInsets.zero,
                      // shrinkWrap: true,
                      children: widget.service.tool
                          .map((e) => Row(
                                children: [
                                  Text('🛠   ',
                                      style: TextStyle(
                                        color: isHover
                                            ? whiteColor
                                            : theme.textColor,
                                      )),
                                  Text(e,
                                      style: TextStyle(
                                        color: isHover
                                            ? whiteColor
                                            : theme.textColor,
                                      )),
                                ],
                              ))
                          .toList()),
                )
            ],
          ),
        ),
      ),
    );
  }
}
