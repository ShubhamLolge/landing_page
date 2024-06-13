import 'package:landing_page/lib.dart';

class Footer extends StatefulWidget {
  /// List of [TabItem]
  final List<TabItem> tabItems;

  /// Title of the landing page
  final String title;
  const Footer({super.key, required this.tabItems, required this.title});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<Widget> getTabTitle() {
    List<Widget> list = [];
    for (var tab in widget.tabItems) {
      list.add(
        Text(
          getStringFromTextWidget(tab.title.toString()),
          style: const TextStyle(color: white, fontWeight: FontWeight.w500),
        ),
      );
    }
    return list;
  }

  List<Widget> getTabLeads() {
    List<Widget> list = [];
    for (var tab in widget.tabItems) {
      list.add(
        Container(
          decoration: BoxDecoration(
              color: tab.color ?? Colors.white, shape: BoxShape.circle),
          height: 36,
          width: 36,
          child: tab.selectedLeading ?? tab.unSelectedLeading,
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    String platform = PlatformCheck().platformCheck(context: context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: darkBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width,
            child: Center(
                child: SectionLabel(
                    title: widget.title,
                    largeScreenFontSize: 35,
                    color: Colors.white)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 28,
              children: getTabLeads(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: platform == Platforms.macOS ||
                      platform == Platforms.windows ||
                      platform == Platforms.linux ||
                      platform == Platforms.fuchsia ||
                      platform == Platforms.webDesktop ||
                      platform == Platforms.webTablet
                  ? 40
                  : 50,
              runSpacing: platform == Platforms.macOS ||
                      platform == Platforms.windows ||
                      platform == Platforms.linux ||
                      platform == Platforms.fuchsia ||
                      platform == Platforms.webDesktop ||
                      platform == Platforms.webTablet
                  ? 40
                  : 35,
              children: getTabTitle(),
            ),
          ),
        ],
      ),
    );
  }
}
