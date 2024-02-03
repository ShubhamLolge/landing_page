import 'package:landing_page/lib.dart';

class SmallScreenDrawer extends StatefulWidget {
  /// [leading] will be seen as leading widget on small screen as header in drawer when using default.
  final Widget? leading;

  /// [trailing] will be seen as trailing widget on small screen as footer in drawer when using default.
  final Widget? trailing;

  /// List of [TabItem]
  final List<TabItem> children;

  /// Title of the landing page
  final String title;

  const SmallScreenDrawer({
    super.key,
    this.leading,
    this.trailing,
    required this.children,
    required this.title,
  });

  @override
  State<SmallScreenDrawer> createState() => _SmallScreenDrawerState();
}

class _SmallScreenDrawerState extends State<SmallScreenDrawer> {
  List<TabItem> nauticsItems({required List<TabItem> tabItems}) {
    List<TabItem> list = [];
    list.add(
      TabItem(
        selectedLeading: null,
        unSelectedLeading: null,
        title: Container(),
        onTap: () {},
      ),
    );
    for (var i = 0; i < tabItems.length; i++) {
      list.add(
        TabItem(
          selectedLeading: tabItems[i].selectedLeading,
          unSelectedLeading: null,
          title: tabItems[i].title,
          onTap: () => _onTapNavItem(
            item: tabItems[i],
            context: tabItems[i].tab!.key as GlobalKey,
            navItemName: getStringFromTextWidget(tabItems[i].title.toString()),
          ),
          badgeCount: tabItems[i].badgeCount,
          tIOnTap: tabItems[i].tIOnTap,
          children: tabItems[i].children,
          color: tabItems[i].color,
          subTitle: tabItems[i].subTitle,
          tab: tabItems[i].tab,
          trailing: tabItems[i].trailing,
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Nautics(
      isCollapsed: false,
      isConvertible: false,
      unSelectedColor: null,
      isFloating: false,
      nauticsColor: Colors.transparent,
      selectedColor: Colors.black,
      children: nauticsItems(tabItems: widget.children),
      onChange: (i) {},
      header: widget.leading ??
          InkWell(
            onTap: () {},
            child: SectionLable(title: widget.title, largeScreenFontSize: 35),
          ),
      footer: widget.trailing ??
          Container(
            padding: const EdgeInsets.all(5),
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, elevation: 0),
              child: const Text(
                "Get Started",
                style: TextStyle(color: white, fontWeight: FontWeight.w700),
                overflow: TextOverflow.ellipsis,
              ),
              onPressed: () => setState(() => launchInBrowser(landingPageUrl)),
            ),
          ),
    );
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
    required TabItem item,
  }) {
    for (int index = 0; index < widget.children.length; index++) {
      if (navItemName ==
          getStringFromTextWidget(widget.children[index].title.toString())) {
        scrollToSection(context.currentContext!);
        _closeDrawer();
      } else {}
    }
  }

  _closeDrawer() {
    Navigator.pop(context);
  }
}
