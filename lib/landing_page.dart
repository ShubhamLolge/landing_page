library landing_page;

import 'package:landing_page/lib.dart';

/// ## LandingPage
///
/// Create captivating and responsive landing pages with ease. The [LandingPage] widget empowers Flutter developers to craft dynamic and engaging introductory screens for their mobile and web applications. Packed with an array of customization options, it's the ultimate canvas for your creativity.
///
/// 🚀 Key Features:
///
/// Tabs Galore:
/// Seamlessly organize your content into tabs, making navigation a breeze.
///
/// Dazzling Header:
/// Customize your app's header with ease, or let the default shine.
///
/// Footer Finesse:
/// Tailor your footer to your liking or stick with the built-in elegance.
///
/// Drawer Magic:
/// Add a drawer that suits your app's personality, with left and right options.
///
/// FAB Awesomeness:
/// Elevate user interaction with a Floating Action Button that's just right.
///
/// Platform Perfect:
/// Adapt effortlessly to Android, iOS, and Web Mobile platforms.
///
/// Slick Animations:
/// Delight your users with smooth transitions and animations.
///
/// Create a powerful first impression and guide users seamlessly through your app.
/// With [LandingPage], your landing pages will be unforgettable,
/// leaving users excited to explore what's next turn on the wow factor!"

class LandingPage extends StatefulWidget {
  /// List of Screens or Pages for your landing page project.
  /// The 'tab' parameter of [TabItem] which will contain the actual widget which will be seen as your screen or page
  /// must not return [Scaffold] widget, instead return simple container having full screen dimensions with your desired data,
  /// this will work well.
  final List<TabItem> children;

  /// A Widget like [AppBar] that will show on top, if null default will be shown
  final Widget? header;

  /// A Widget like Footer that will show on bottom, if null default will be shown
  final Widget? footer;

  /// A [Drawer] Widget for the small screen, if null default will be shown
  final Widget? drawer;

  /// [drawerIcon] will be seen in small screen as trailling icon widget.
  final Widget? drawerIcon;

  /// If true, onclick of [drawerIcon] drawer will open on left, and right if false.
  final bool? openDrawerOnLeft;

  /// Specifies if the [drawerIcon] is at leading position or trailing.
  final bool drawerIconLeading;

  /// [leading] will be seen as leading widget on large screen as well as on small screen as header in drawer when using default.
  final Widget? leading;

  /// [trailing] will be seen as trailing widget on large screen as well as on small screen as footer in drawer when using default.
  final Widget? trailing;

  /// when true will show leading icon for the children, for conditional rendering.
  final bool showLeadingIconOnHeader;

  /// when true will show trailing icon for the children, for conditional rendering.
  final bool showTrailingIconOnHeader;

  /// [MainAxisAlignment] for the tabs on the large screen.
  final MainAxisAlignment alignment;

  /// Widget for [FloatingActionButton], if null default will be shown with [scrollToSection] feature.
  final Widget? fAB;

  /// [fabIcon] is the child widget for the default [FloatingActionButton] when you want to use the [scrollToSection] but with your widget choice.
  final Widget? fabIcon;

  const LandingPage({
    Key? key,
    required this.children,
    this.footer,
    this.header,
    this.fabIcon = const Icon(Icons.keyboard_double_arrow_up_rounded, size: 30, color: AppColors.white),
    this.alignment = MainAxisAlignment.center,
    this.drawer,
    this.trailing,
    this.drawerIcon = const Icon(Icons.short_text_rounded, size: 40),
    this.drawerIconLeading = false,
    this.openDrawerOnLeft = true,
    this.leading,
    this.fAB,
    this.showLeadingIconOnHeader = false,
    this.showTrailingIconOnHeader = false,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
  late final Animation<double> animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    widget.fAB != null ? () {} : detectScroll(animationController: animationController, scrollController: scrollController);
    widget.fAB != null ? () {} : disableFAB(animationController: animationController, scrollController: scrollController);
    super.didChangeDependencies();
  }

  List<Widget> getWidgets() {
    List<Widget> list = [];
    for (var tabitem in widget.children) {
      list.add(
        GestureDetector(
          onTap: tabitem.onTap,
          child: tabitem.tab!,
        ),
      );
    }
    list.add(widget.footer ?? Footer(tabItems: widget.children));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    String platform = PlatformCheck().platformCheck(context: context);
    return Scaffold(
      key: _key,
      drawer: widget.openDrawerOnLeft == true
          ? widget.drawer ??
              Vitrify(
                opacity: 0.1,
                child: SmallScreenDrawer(
                  children: widget.children,
                  leading: widget.leading,
                  trailing: widget.trailing,
                ),
              )
          : null,
      endDrawer: widget.openDrawerOnLeft == false
          ? widget.drawer ??
              Vitrify(
                opacity: 0.1,
                child: SmallScreenDrawer(
                  children: widget.children,
                  leading: widget.leading,
                  trailing: widget.trailing,
                ),
              )
          : null,
      drawerScrimColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: widget.fAB ??
          ScaleTransition(
            scale: animation,
            child: InkWell(
              onTap: () {
                scrollToSection((widget.children[0].tab!.key as GlobalKey).currentContext!);
                animationController.reverse();
              },
              child: Vitrify(
                opacity: 0.1,
                radius: BorderRadius.circular(100),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: widget.fabIcon,
                ),
              ),
            ),
          ),
      body: Stack(
        children: [
          SingleChildScrollView(controller: scrollController, child: Column(children: getWidgets())),
          platform == 'Android' || platform == 'iOS' || platform == 'Web Mobile'
              ? Vitrify(
                  opacity: 0.1,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: widget.drawerIconLeading == false
                          ? null
                          : GestureDetector(
                              onTap: () {
                                widget.openDrawerOnLeft == true ? _key.currentState!.openDrawer() : _key.currentState!.openEndDrawer();
                              },
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: widget.drawerIcon,
                              ),
                            ),
                      title: widget.leading ??
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.snowboarding, size: 50),
                              SizedBox(width: 5),
                              Text(
                                "WeB",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                            ],
                          ),
                      trailing: widget.drawerIconLeading == true
                          ? null
                          : GestureDetector(
                              onTap: () {
                                widget.openDrawerOnLeft == true ? _key.currentState!.openDrawer() : _key.currentState!.openEndDrawer();
                              },
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: widget.drawerIcon,
                              ),
                            ),
                    ),
                  ),
                )
              : Vitrify(
                  opacity: 0.1,
                  child: widget.header ??
                      Header(
                        children: widget.children,
                        leading: widget.leading,
                        trailing: widget.trailing,
                        alignment: widget.alignment,
                        showLeadingIcon: widget.showLeadingIconOnHeader,
                        showTrailingIcon: widget.showTrailingIconOnHeader,
                      ),
                ),
        ],
      ),
    );
  }
}
