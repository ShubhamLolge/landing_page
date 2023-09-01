import 'package:landing_page/imports.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(color: Colors.orange, width: 120),
        const Flexible(
            child: HeaderWidget(
          navItems: [],
        )),
        Container(color: Colors.orange, width: 120),
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final List<NavItem> navItems;
  const HeaderWidget({
    Key? key,
    required this.navItems,
  }) : super(key: key);

  List<Widget> getNavItems() {
    List<Widget> list = [];
    list.add(const SizedBox(width: 10));
    list.add(
      Container(
        margin: const EdgeInsets.all(5),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppLogo(),
            SizedBox(width: 10),
            SectionTitle(title: appName, largeScreenFontSize: 35),
          ],
        ),
      ),
    );
    list.add(const SizedBox(width: 110));
    for (var item in navItems) {
      list.add(
        Expanded(
          child: InkWell(
            onTap: () => scrollToSection(item.key.currentContext!),
            splashColor: AppColors.primary,
            customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Center(child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis))),
            ),
          ),
        ),
      );
    }
    list.add(const SizedBox(width: 80));
    list.add(
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 50,
          width: 120,
          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0),
            child: const Text(
              HeaderSectionConstants.headerSectionSignUpButton,
              style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w700),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
    list.add(const SizedBox(width: 10));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getNavItems(),
      ),
    );
  }
}

class AppDrawer extends StatefulWidget {
  final double? width;
  final List<NavItem> menuList;

  const AppDrawer({
    super.key,
    this.width,
    required this.menuList,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<TabItem> nauticsItems({required List<NavItem> menuList}) {
    List<TabItem> list = [];
    list.add(
      TabItem(
        selectedLeadingIcon: null,
        unSelectedLeadingIcon: null,
        title: Container(),
        onTap: () {},
      ),
    );
    for (var i = 0; i < menuList.length; i++) {
      list.add(
        TabItem(
          selectedLeadingIcon: menuList[i].icon,
          unSelectedLeadingIcon: null,
          title: Text(menuList[i].name),
          onTap: () => _onTapNavItem(
            context: menuList[i].key,
            navItemName: menuList[i].name,
          ),
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
      children: nauticsItems(menuList: widget.menuList),
      onChange: (i) {},
      header: InkWell(
        onTap: () {},
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppLogo(),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                appName,
                style: TextStyle(
                  fontSize: 25, // 30
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
      footer: InkWell(
        onTap: () {},
        child: const Text(HeaderSectionConstants.headerSectionAppVersion, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        scrollToSection(context.currentContext!);
        setState(() {
          widget.menuList[index].isSelected = true;
        });
        _closeDrawer();
      } else {
        widget.menuList[index].isSelected = false;
      }
    }
  }

  _closeDrawer() {
    Navigator.pop(context);
  }
}
