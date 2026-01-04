part of '../main_section.dart';

class _NavbarDesktop extends StatefulWidget {
  const _NavbarDesktop();

  @override
  State<_NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<_NavbarDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // theme
    var theme = Theme.of(context);

    // Dynamic padding and spacing
    double horizontalPadding =
        size.width < 1200 ? size.width / 40 : size.width / 20;

    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Container(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
        color: theme.navBarColor,
        child: Row(
          children: [
            const NavBarLogo(),
            const Spacer(),
            // Using a Row but keeping it within the parent layout limits
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...NavBarUtils.names.asMap().entries.map(
                      (e) => NavBarActionButton(
                        label: e.value,
                        index: e.key,
                      ),
                    ),
              ],
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                context.read<ThemeCubit>().updateTheme(!state.isDarkThemeOn);
              },
              child: Image.network(
                state.isDarkThemeOn ? IconUrls.darkIcon : IconUrls.lightIcon,
                height: 30,
                width: 30,
                color: state.isDarkThemeOn ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _NavBarTablet extends StatelessWidget {
  const _NavBarTablet();

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    var theme = Theme.of(context);
    return Container(
      color: theme.navBarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
      child: Row(
        children: [
          IconButton(
            highlightColor: Colors.white54,
            onPressed: () {
              try {
                drawerProvider.key.currentState!.openDrawer();
              } catch (e) {
                debugPrint("Error: $e");
              }
            },
            icon: const Icon(Icons.menu),
          ),
          Space.xm!,
          const NavBarLogo(),
          // Space.x1!,
        ],
      ),
    );
  }
}
