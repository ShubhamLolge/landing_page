import 'package:landing_page/lib.dart';

class Footer extends StatefulWidget {
  /// List of [TabItem]
  final List<TabItem> tabItems;
  const Footer({super.key, required this.tabItems});

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
          style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.w500),
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
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          height: 36,
          width: 36,
          child: tab.selectedLeadingIcon,
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    String platform = PlatformCheck().platformCheck(context: context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppColors.darkBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.snowboarding, size: 50, color: Colors.white),
                SizedBox(width: 10),
                SectionLable(title: "WeB", largeScreenFontSize: 35, color: Colors.white),
              ],
            ),
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
              spacing:
                  platform == 'MacOS' || platform == 'Windows' || platform == 'Linux' || platform == 'Fuchsia' || platform == 'Web Desktop' || platform == 'Web Tablet'
                      ? 40
                      : 50,
              runSpacing:
                  platform == 'MacOS' || platform == 'Windows' || platform == 'Linux' || platform == 'Fuchsia' || platform == 'Web Desktop' || platform == 'Web Tablet'
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
