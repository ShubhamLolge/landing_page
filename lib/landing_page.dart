library landing_page;

import 'package:landing_page/lib.dart';

/// ## LandingPage
///
/// Built on top of [floating_tabbar](https://pub.dev/packages/floating_tabbar), **landing_page** serves at its best
/// for creating landing screens and welcome interface for any of your project may it be landing UI for your next big
/// project or your portfolio application we got you covered,using the phenominal TabItem model class for maintaining
/// the data and using the rich widget library provided with floating_tabbar making it best experience possible for you
/// create landing pages.
///
/// Create a powerful first impression and guide users seamlessly through your app.
/// With [LandingPage], your landing pages will be unforgettable,
/// leaving users excited to explore what's next turn on the wow factor!"
///
/// ### Note
/// 1. when providing widget separately like header, drawer, footer, the default parameters wont take values from [LandingPage]
/// widget so provide all needed parameters separately.
///
/// 2. Provide GlobalKey() to every widget that is value of [tab] in [TabItem] in the children ([List<TabItem>]) of [LandingPage],
/// to allow automatic scroling onclick of header tabs of landing page.
/// Here [LandingPage] is responsive and that will blends well when the widget you provide to [tab] is also responsive.

class LandingPage extends StatefulWidget {
  /// The 'tab' parameter of [TabItem] must not return [Scaffold] widget,
  /// instead return simple container having full screen dimensions with your desired data, this will work well.
  final List<TabItem> children;

  /// A Widget like [AppBar] that will show on top, if null default will be shown
  final Widget? header;

  /// A Widget like Footer that will show on bottom, if null default will be shown
  final Widget? footer;

  /// A [Drawer] Widget for the small screen, if null default will be shown
  final Widget? drawer;

  /// If true, onclick of [drawerIcon] drawer will open on left, and right if false.
  final bool? openDrawerOnLeft;

  /// [trailing] will be seen as trailing widget on [Header] when on large screen,
  /// as well as on small screen as footer in drawer when using default.
  final Widget? trailing;

  /// [drawerIcon] will be seen in small screen as trailling icon widget.
  final Widget? drawerIcon;

  /// [drawerIcon] will be seen in small screen as trailling icon widget.
  final bool drawerIconLeading;

  /// [leading] will be seen as leading widget on large screen as well as on small screen as header in drawer when using default.
  final Widget? leading;

  /// [MainAxisAlignment] for the tabs on the large screen.  If providing separate [Header] widget then specify [alignment] seperately.
  final MainAxisAlignment alignment;

  /// Widget for [FloatingActionButton], if null default will be shown, do disable put empty container() as child.
  final Widget? fAB;

  /// [fabIcon] is the child widget for the default [FloatingActionButton]
  final Widget? fabIcon;

  /// when true will show leading icon for the children
  final bool showLeadingIconOnHeader;

  /// when true will show trailing icon for the children
  final bool showTrailingIconOnHeader;

  /// when true will show trailing icon for the children
  final GlobalKey<ScaffoldState> scaffoldKey;

  /// Title of the landing page
  final String title;

  /// Background for whole landing page.
  final Decoration? background;

  /// Header tabs are floating or not.
  final bool isFloating;

  const LandingPage({
    super.key,
    required this.children,
    this.footer,
    this.header,
    this.fabIcon = const Icon(Icons.keyboard_double_arrow_up_rounded, size: 30, color: white),
    this.alignment = MainAxisAlignment.center,
    this.drawer,
    this.trailing,
    this.drawerIcon = const Icon(Icons.short_text_rounded, size: 40),
    this.drawerIconLeading = false,
    this.openDrawerOnLeft = true,
    this.leading,
    this.fAB,
    required this.scaffoldKey,
    this.showLeadingIconOnHeader = false,
    this.showTrailingIconOnHeader = false,
    required this.title,
    this.background,
    this.isFloating = false,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
  late final Animation<double> animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    widget.fAB != null ? null : detectScroll(animationController: animationController, scrollController: scrollController);
    widget.fAB != null ? null : disableFAB(animationController: animationController, scrollController: scrollController);
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

    list.add(widget.footer ?? Footer(tabItems: widget.children, title: widget.title));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String platform = PlatformCheck().platformCheck(context: context);

    return Scaffold(
      key: widget.scaffoldKey,
      drawer: widget.openDrawerOnLeft == true
          ? widget.drawer ??
              Vitrify(
                opacity: 0.1,
                child: SmallScreenDrawer(
                  children: widget.children,
                  leading: widget.leading,
                  trailing: widget.trailing,
                  title: widget.title,
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
                  title: widget.title,
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                  child: widget.fabIcon,
                ),
              ),
            ),
          ),
      body: Stack(
        children: [
          Container(decoration: widget.background),
          SingleChildScrollView(controller: scrollController, child: Column(children: getWidgets())),
          platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile
              ? Vitrify(
                  opacity: 0.1,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: widget.drawerIconLeading == false
                          ? null
                          : GestureDetector(
                              onTap: () {
                                widget.openDrawerOnLeft == true
                                    ? openLeftDrawer(scaffoldKey: widget.scaffoldKey)
                                    : openRightDrawer(scaffoldKey: widget.scaffoldKey);
                              },
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: widget.drawerIcon,
                              ),
                            ),
                      title: widget.leading ??
                          Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                          ),
                      trailing: widget.drawerIconLeading == true
                          ? null
                          : GestureDetector(
                              onTap: () {
                                widget.openDrawerOnLeft == true
                                    ? openLeftDrawer(scaffoldKey: widget.scaffoldKey)
                                    : openRightDrawer(scaffoldKey: widget.scaffoldKey);
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
                        isFloating: widget.isFloating,
                        children: widget.children,
                        leading: widget.leading,
                        trailing: widget.trailing,
                        alignment: widget.alignment,
                        showLeading: widget.showLeadingIconOnHeader,
                        showTrailing: widget.showTrailingIconOnHeader,
                        title: widget.title,
                      ),
                ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
