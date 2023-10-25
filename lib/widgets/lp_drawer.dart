import 'package:landing_page/lib.dart';

class SmallScreenDrawer extends StatefulWidget {
  /// [leading] will be seen as leading widget on small screen as header in drawer when using default.
  final Widget? leading;

  /// [trailing] will be seen as trailing widget on small screen as footer in drawer when using default.
  final Widget? trailing;

  /// List of [TabItem]
  final List<TabItem> children;

  const SmallScreenDrawer({
    super.key,
    this.leading,
    this.trailing,
    required this.children,
  });

  @override
  State<SmallScreenDrawer> createState() => _SmallScreenDrawerState();
}

class _SmallScreenDrawerState extends State<SmallScreenDrawer> {
  List<TabItem> nauticsItems({required List<TabItem> tabItems}) {
    List<TabItem> list = [];
    list.add(
      TabItem(
        selectedLeadingIcon: null,
        unSelectedLeadingIcon: null,
        title: Container(),
        onTap: () {},
      ),
    );
    for (var i = 0; i < tabItems.length; i++) {
      list.add(
        TabItem(
          selectedLeadingIcon: tabItems[i].selectedLeadingIcon,
          unSelectedLeadingIcon: null,
          title: tabItems[i].title,
          onTap: () => _onTapNavItem(
            item: tabItems[i],
            context: tabItems[i].tab!.key as GlobalKey,
            navItemName: getStringFromTextWidget(tabItems[i].title.toString()),
          ),
          badgeCount: tabItems[i].badgeCount,
          callTIOnTap: tabItems[i].callTIOnTap,
          children: tabItems[i].children,
          color: tabItems[i].color,
          subTitle: tabItems[i].subTitle,
          tab: tabItems[i].tab,
          trailingIcon: tabItems[i].trailingIcon,
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
            child: const Row(
              children: [
                Icon(Icons.snowboarding, size: 50),
                SizedBox(width: 5),
                SectionLable(title: "WeB", largeScreenFontSize: 35),
              ],
            ),
          ),
      footer: widget.trailing ??
          InkWell(
            onTap: () {},
            child: const Text(
              headerSectionAppVersion,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
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
      if (navItemName == getStringFromTextWidget(widget.children[index].title.toString())) {
        scrollToSection(context.currentContext!);
        /* item.callTIOnTap == true ? () => item.onTap : () => scrollToSection((item.tab!.key! as GlobalKey).currentContext!); */
        _closeDrawer();
      } else {}
    }
  }

  _closeDrawer() {
    Navigator.pop(context);
  }
}
