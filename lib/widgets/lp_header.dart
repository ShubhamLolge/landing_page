import 'package:landing_page/lib.dart';

class Header extends StatefulWidget {
  /// List of [TabItem]
  final List<TabItem> children;

  /// Title of the landing page
  final String title;

  /// Height of [Header]
  final double? height;

  /// Boolean that enables or disables the floating interface of the tabs in [Header].
  final bool isFloating;

  /// [leading] will be seen as leading widget on small screen as header in drawer when using default.
  final Widget? leading;

  /// [trailing] will be seen as trailing widget on small screen as footer in drawer when using default.
  final Widget? trailing;

  /// when true will show leading icon for the children tabs
  final bool showLeading;

  /// when true will show trailing icon for the children tabs
  final bool showTrailing;

  /// [MainAxisAlignment] for the tabs on the large screen.
  final MainAxisAlignment alignment;

  const Header({
    super.key,
    required this.children,
    this.leading,
    this.trailing,
    this.showLeading = true,
    this.showTrailing = true,
    this.alignment = MainAxisAlignment.center,
    required this.title,
    this.height,
    this.isFloating = true,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<Widget> getNavItems({
    required BuildContext context,
    required Size size,
  }) {
    List<Widget> list = [];
    for (var item in widget.children) {
      list.add(
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tooltip(
                message: item.title.runtimeType == Text ? getStringFromTextWidget(item.title.toString()) : "",
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Niftile(
                    item: item,
                    onTap: item.tIOnTap == true ? item.onTap : () => scrollToSection((item.tab!.key! as GlobalKey).currentContext!),
                    selectedColor: Colors.black,
                    unSelectedColor: Colors.black,
                    showLeading: widget.showLeading,
                    showTrailing: widget.showTrailing,
                    buttonMode: true,
                    width: 100,
                    borderRadius: BorderRadius.circular(60),
                    isFloating: widget.isFloating,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      child: SizedBox(
        height: widget.height ?? size.height * 0.1,
        child: Row(
          children: [
            widget.leading ??
                Container(
                  margin: const EdgeInsets.all(5),
                  child: SectionLabel(title: widget.title, largeScreenFontSize: 35),
                ),
            Expanded(
              child: Row(
                mainAxisAlignment: widget.alignment,
                children: getNavItems(context: context, size: size),
              ),
            ),
            widget.trailing ??
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: white, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                    onPressed: () => setState(() => launchInBrowser(landingPageUrl)),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
