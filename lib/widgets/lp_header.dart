import 'package:landing_page/lib.dart';

class Header extends StatelessWidget {
  /// [leading] will be seen as leading widget on small screen as header in drawer when using default.
  final Widget? leading;

  /// [trailing] will be seen as trailing widget on small screen as footer in drawer when using default.
  final Widget? trailing;

  /// List of [TabItem]
  final List<TabItem> children;

  /// [MainAxisAlignment] for the tabs on the large screen.
  final MainAxisAlignment alignment;

  /// when true will show leading icon for the children
  final bool showLeadingIcon;

  /// when true will show trailing icon for the children
  final bool showTrailingIcon;
  const Header({
    super.key,
    required this.children,
    this.leading,
    this.trailing,
    this.showLeadingIcon = true,
    this.showTrailingIcon = true,
    this.alignment = MainAxisAlignment.center,
  });

  List<Widget> getNavItems({
    required BuildContext context,
    required Size size,
  }) {
    List<Widget> list = [];
    for (var item in children) {
      list.add(
        TabItemUI(item: item, showLeadingIcon: showLeadingIcon, showTrailingIcon: showTrailingIcon),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          leading ??
              Container(
                margin: const EdgeInsets.all(5),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.snowboarding, size: 50),
                    SizedBox(width: 10),
                    SectionLable(title: "WeB", largeScreenFontSize: 35),
                  ],
                ),
              ),
          Expanded(
            child: Row(
              mainAxisAlignment: alignment,
              children: getNavItems(context: context, size: size),
            ),
          ),
          trailing ??
              Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                width: 150,
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {},
                ),
              ),
        ],
      ),
    );
  }
}

class TabItemUI extends StatefulWidget {
  final TabItem item;

  /// when true will show leading icon for the children
  final bool showLeadingIcon;

  /// when true will show trailing icon for the children
  final bool showTrailingIcon;

  const TabItemUI({
    super.key,
    required this.item,
    required this.showLeadingIcon,
    required this.showTrailingIcon,
  });

  @override
  State<TabItemUI> createState() => _TabItemUIState();
}

class _TabItemUIState extends State<TabItemUI> {
  Widget tabItemUI({required TabItem item, required Size size}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: NotificationBadge(
        count: item.badgeCount ?? 0,
        child: InkWell(
          onTap: item.callTIOnTap == true ? item.onTap : () => scrollToSection((item.tab!.key! as GlobalKey).currentContext!),
          splashColor: AppColors.primary,
          customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            height: size.height * 0.09, // 60
            width: widget.showLeadingIcon == false && widget.showTrailingIcon == false && (item.selectedLeadingIcon == null || item.unSelectedLeadingIcon == null)
                ? size.width * 0.09
                : size.width * 0.12, // 60
            decoration: BoxDecoration(
              color: item.color ?? Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.showLeadingIcon == true ? item.selectedLeadingIcon ?? Container() : Container(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Airoll(
                        tooltip: item.title.runtimeType == Text ? getStringFromTextWidget(item.title.toString()) : "",
                        isFloating: false,
                        actOnHover: true,
                        children: item.children,
                        title: item.title,
                      ),
                      /* item.title */
                      item.subTitle ?? Container(),
                    ],
                  ),
                ),
                widget.showTrailingIcon == true ? Center(child: item.trailingIcon ?? Container()) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return tabItemUI(item: widget.item, size: size);
  }
}
