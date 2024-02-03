import 'package:landing_page/lib.dart';

class TabItemUI extends StatefulWidget {
  final TabItem item;

  /// when true will show leading icon for the children
  final bool showLeading;

  /// when true will show trailing icon for the children
  final bool showTrailing;

  const TabItemUI({
    super.key,
    required this.item,
    required this.showLeading,
    required this.showTrailing,
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
          onTap: item.tIOnTap == true
              ? item.onTap
              : () => scrollToSection(
                  (item.tab!.key! as GlobalKey).currentContext!),
          splashColor: primary,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            height: size.height * 0.09,
            width: widget.showLeading == false &&
                    widget.showTrailing == false &&
                    (item.selectedLeading == null ||
                        item.unSelectedLeading == null)
                ? size.width * 0.09
                : size.width * 0.12,
            decoration: BoxDecoration(
              color: item.color ?? Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.showLeading == true
                    ? item.selectedLeading ?? Container()
                    : Container(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Airoll(
                        tooltip: item.title.runtimeType == Text
                            ? getStringFromTextWidget(item.title.toString())
                            : "",
                        isFloating: false,
                        actOnHover: true,
                        children: item.children,
                        child: item.title,
                      ),
                      item.subTitle ?? Container(),
                    ],
                  ),
                ),
                widget.showTrailing == true
                    ? Center(child: item.trailing ?? Container())
                    : Container(),
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
