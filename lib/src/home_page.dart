import 'package:landing_page/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
  late final Animation<double> animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ScrollController scrollController = ScrollController();

  /// To hide the Floating Action Button when scroll control is at the top on the screen.
  disableFAB() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
        animationController.reverse();
      }
    });
  }

  /// To show the Floating Action Button when scroll control is in motion.
  detectScroll() {
    scrollController.addListener(() {
      if (scrollController.position.hasPixels) {
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    detectScroll();
    disableFAB();
    super.didChangeDependencies();
  }

  final List<NavItem> navItems = [
    NavItem(name: Home, key: GlobalKey(), isSelected: true, icon: const Icon(Icons.home_rounded)),
    NavItem(name: Partners, key: GlobalKey(), icon: const Icon(Icons.business)),
    NavItem(name: AboutUs, key: GlobalKey(), icon: const Icon(Icons.room_service_rounded)),
    NavItem(name: OurInterests, key: GlobalKey(), icon: const Icon(Icons.lightbulb)),
    NavItem(name: OurValues, key: GlobalKey(), icon: const Icon(Icons.handshake_rounded)),
    NavItem(name: Projects, key: GlobalKey(), icon: const Icon(Icons.mail_rounded)),
  ];

  @override
  Widget build(BuildContext context) {
    String platform = PlatformCheck().platformCheck(context: context);
    return Scaffold(
      // backgroundColor: Colors.black,
      key: _key,
      drawer: Vitrify(child: AppDrawer(menuList: navItems)),
      drawerScrimColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            scrollToSection(navItems[0].key.currentContext!);
            animationController.reverse();
          },
          child: const Icon(Icons.keyboard_double_arrow_up_rounded, size: 30, color: AppColors.white),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                HomeSection(key: navItems[0].key), // 0th Nav Item
                const SizedBox(height: 132),
                PartnersSection(key: navItems[1].key), // 1st Nav Item
                AboutUsSection(key: navItems[2].key), // 2nd Nav Item
                OurInterestsSection(key: navItems[3].key), // 3rd Nav Item
                OurValuesSection(key: navItems[4].key), // 4th Nav Item
                CurrentProjectsSection(key: navItems[5].key), // 5th Nav Item
                const SizedBox(height: 132),
                FooterSection(navItems: navItems), // Footer section
              ],
            ),
          ),
          platform == 'Android' || platform == 'iOS' || platform == 'Web Mobile'
              ? Vitrify(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppLogo(),
                          SizedBox(width: 5),
                          Text(
                            appName,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        onTap: () => _key.currentState!.openDrawer(),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: SvgPicture.asset(drawerImage),
                        ),
                      ),
                    ),
                  ),
                )
              : Vitrify(child: HeaderWidget(navItems: navItems)),
        ],
      ),
    );
  }
}
