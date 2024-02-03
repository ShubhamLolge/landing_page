import 'package:flutter/cupertino.dart';
import 'package:landing_page_preview/lib.dart';

class LandingPageST extends StatefulWidget {
  const LandingPageST({super.key});

  @override
  State<LandingPageST> createState() => _LandingPageSTState();
}

class _LandingPageSTState extends State<LandingPageST> {
  final GlobalKey<ScaffoldState> _lpkey = GlobalKey();
  List<TabItem> getChildren({required Size size}) {
    Widget products = Products(key: GlobalKey());
    Widget about = About(key: GlobalKey(), productsTab: products);
    List<TabItem> tabItems = [
      TabItem(
        color: Colors.amber,
        title: const Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
        tab: Home(key: GlobalKey(), aboutTab: about),
        selectedLeading: const Icon(Icons.home_work_rounded),
        onTap: () {},
      ),
      TabItem(
        color: Colors.red,
        tab: about,
        title: const Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
        selectedLeading: const Icon(Icons.my_library_books_rounded),
        children: [
          TabItem(title: const Text("Landing Page"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
          TabItem(title: const Text("Quick Dev"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
          TabItem(title: const Text("Responsiveness"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
        ],
        onTap: () {},
      ),
      TabItem(
        color: Colors.green,
        selectedLeading: const Icon(Icons.star_rounded),
        title: const Text("Our Team", style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {},
        tab: OurTeam(key: GlobalKey()),
      ),
      TabItem(
        color: Colors.yellow,
        title: const Text("Products", style: TextStyle(fontWeight: FontWeight.bold)),
        tab: products,
        selectedLeading: const Icon(Icons.workspaces_rounded),
        children: [
          TabItem(
            title: const Text("LandingPage"),
            onTap: () {},
            selectedLeading: const Icon(Icons.circle, size: 10),
            children: [
              TabItem(title: const Text("Header"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("Footer"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("Drawer"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("SectionLabel"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("TabItemUI"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
            ],
          ),
          TabItem(
            title: const Text("FloatingTabBar"),
            onTap: () {},
            selectedLeading: const Icon(Icons.circle, size: 10),
            children: [
              TabItem(title: const Text("Airoll"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("Niftile"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("Nautics"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("Floater"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("OpsShell"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("Vitrify"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
              TabItem(title: const Text("TopTabBar"), onTap: () {}, selectedLeading: const Icon(Icons.check_box_rounded, size: 15)),
            ],
          ),
        ],
        onTap: () {},
      ),
    ];
    return tabItems;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String platform = PlatformCheck().platformCheck(context: context);
    return LandingPage(
      alignment: MainAxisAlignment.start,
      background: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(backgroundUrl),
          fit: BoxFit.cover,
        ),
      ),
      scaffoldKey: _lpkey,
      showLeadingIconOnHeader: platform == Platforms.webTablet ? false : true,
      children: getChildren(size: size),
      title: "LandingPage",
    );
  }
}

List<TabItem> menuItems = [
  TabItem(title: const Text('Option 1'), onTap: () {}, badgeCount: 2, color: Colors.amber),
  TabItem(title: const Text('Option 2'), onTap: () {}),
  TabItem(
    title: const Text('Option 3'),
    onTap: () {},
    children: subItems,
    trailing: const Icon(Icons.nightlight_round),
  ),
];

List<TabItem> subItems = [
  TabItem(title: const Text('Nested Option 1'), onTap: () {}),
  TabItem(title: const Text('Nested Option 2'), onTap: () => debugPrint("Nested Option 2")),
];

class Home extends StatefulWidget {
  final Widget aboutTab;
  const Home({super.key, required this.aboutTab});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String platform = PlatformCheck().platformCheck(context: context);
    Widget homeData = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height:
              platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.height * 0.11 : size.height * 0.1,
          width: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.width : size.width * 0.4,
          child: RichText(
            textAlign:
                platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? TextAlign.center : TextAlign.start,
            text: TextSpan(
              text: "Welcome to ",
              style: TextStyle(
                color: darkBlack,
                fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 26 : 36,
                fontWeight: FontWeight.w800,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "LandingPage",
                  style: TextStyle(
                    color: primary,
                    fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 26 : 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: "\nFlutter Package",
                  style: TextStyle(
                    color: darkBlack,
                    fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 26 : 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height:
              platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.height * 0.2 : size.height * 0.1,
          width: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.width : size.width * 0.4,
          padding: platform == 'Android' || platform == 'iOS' ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
          child: Text(
            "landing_page serves at its best for creating landing screens and welcome interface for any of your Flutter project.",
            textAlign: platform == 'Android' || platform == 'iOS' ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: platform == 'Android' || platform == 'iOS' ? darkGrey : primary,
              fontWeight: FontWeight.w400,
              fontSize: platform == 'Android' || platform == 'iOS' ? 14 : 18,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height:
              platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.height * 0.11 : size.height * 0.1,
          width: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.width : size.width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() => launchInBrowser(landingPageUrl)),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: platform == 'Android' || platform == 'iOS' ? 14 : 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const Flexible(child: SizedBox(width: 32)),
              ElevatedButton.icon(
                onPressed: () => scrollToSection((widget.aboutTab.key as GlobalKey).currentContext!),
                icon: Icon(Icons.keyboard_double_arrow_down_rounded, color: Theme.of(context).primaryColor),
                label: Text(
                  "Know More",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: platform == 'Android' || platform == 'iOS' ? 14 : 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );

    return platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile
        ? SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: size.height * 0.5,
                  width: size.width,
                  child: Vitrify(radius: BorderRadius.circular(10), opacity: 0.1, child: homeData),
                ),
              ],
            ),
          )
        : SizedBox(
            height: size.height,
            width: size.width,
            child: OpsShell(
              height: size.height * 0.5,
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: homeData,
              ),
            ),
          );
  }
}

class About extends StatefulWidget {
  final Widget productsTab;
  const About({super.key, required this.productsTab});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    String platform = PlatformCheck().platformCheck(context: context);
    Size size = MediaQuery.of(context).size;
    Widget aboutData = Column(
      children: [
        const SizedBox(height: 20),
        const Text("About Us.", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "We are LandingPage, A Flutter package built on top of another Flutter package FloatingTabBar. Landing Page is the combination of following widgets...",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 15 : 20),
          ),
        ),
        SizedBox(height: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 10 : 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("LandingPage", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("Header", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("Footer", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("Drawer", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("SectionLabel", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("TabItemUI", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("FloatingTabBar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("Airoll", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("Niftile", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("Nautics", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("Floater", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("OpsShell", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("Vitrify", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => scrollToSection((widget.productsTab.key as GlobalKey).currentContext!),
                  child: Text("TopTabBar", style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
    return platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile
        ? SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: size.height * 0.74,
                  width: size.width,
                  child: Vitrify(radius: BorderRadius.circular(10), opacity: 0.1, child: aboutData),
                ),
              ],
            ),
          )
        : SizedBox(
            height: size.height,
            width: size.width,
            child: OpsShell(
              height: size.height * 0.65,
              alignment: Alignment.bottomLeft,
              child: aboutData,
            ),
          );
  }
}

class OurTeam extends StatefulWidget {
  const OurTeam({Key? key}) : super(key: key);

  @override
  State<OurTeam> createState() => _OurTeamState();
}

class _OurTeamState extends State<OurTeam> {
  List<ProductData> otData = [
    ProductData(
      title: "floating_tabbar",
      description:
          "The floating_tabbar package for Flutter allows you to use the responsive design for all platforms made from the Material Design System.",
      url: Uri.parse("https://pub.dev/packages/floating_tabbar"),
      icon: const Icon(Icons.star_rounded, size: 40, color: primary),
    ),
    ProductData(
      title: "flutter_lints",
      description:
          "This package contains a recommended set of lints for Flutter apps, packages, and plugins to encourage good coding practices for Flutter.",
      url: lintsUrl,
      icon: const Icon(Icons.star_rounded, size: 40, color: primary),
    ),
    ProductData(
      title: "dartdoc",
      description:
          "Use dart doc to generate HTML documentation for your Dart package. Run dart doc . from the root directory of a package, to use the package.",
      url: dartDocUrl,
      icon: const Icon(Icons.star_rounded, size: 40, color: primary),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String platform = PlatformCheck().platformCheck(context: context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.width : null,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Vitrify(
              opacity: 0.1,
              radius: BorderRadius.circular(10),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      "Our Team",
                      style: TextStyle(
                        fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 20 : 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Packages used in making of LandingPage",
                      style: TextStyle(
                        fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 15 : 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height:
                platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.height * 0.6 : size.height * 0.5,
            width: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.width : size.width * 0.64,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: otData.length,
              itemBuilder: (BuildContext context, int index) {
                int dataIndex = index % otData.length;
                return Product(
                  url: otData[dataIndex].url,
                  icon: otData[dataIndex].icon,
                  title: otData[dataIndex].title,
                  description: otData[dataIndex].description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<ProductData> pData = [
    ProductData(
      url: landingPageUrl,
      icon: const Icon(CupertinoIcons.cube_box_fill, size: 40, color: primary),
      title: "LandingPage",
      description:
          "Built on top of floating_tabbar, landing_page serves at its best for creating landing screens and welcome interface for any of your project may it be landing UI for your next big project or your portfolio application we got you covered,using the phenominal TabItem model class for maintaining the data and using the rich widget library provided with floating_tabbar making it best experience possible for you create landing pages.",
    ),
    ProductData(
      url: landingPageUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "Header",
      description: "The Header widget is a custom Flutter widget designed to create a flexible and customizable header for an app.",
    ),
    ProductData(
      url: landingPageUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "Footer",
      description: "The Footer widget is another custom Flutter widget designed to create a footer for an app.",
    ),
    ProductData(
      url: landingPageUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "Drawer",
      description:
          "The Drawer widget is a Flutter widget designed to create a drawer for small screens. It provides a collapsible navigation drawer that can be used on small screens, typically in mobile or tablet layouts.",
    ),
    ProductData(
      url: landingPageUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "SectionLabel",
      description:
          "The SectionLable widget is a stateless Flutter widget designed to display a section label or title with various customizable properties such as font size, text color, and alignment.",
    ),
    ProductData(
      url: landingPageUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "TabItemUI",
      description:
          "The TabItemUI widget in Flutter is designed to represent a user interface element for a single tab item within a larger navigation or tab bar.",
    ),
    ProductData(
      url: floatingTabBarUrl,
      icon: const Icon(CupertinoIcons.cube_box_fill, size: 40, color: primary),
      title: "FloatingTabBar",
      description:
          "floating_tabbar solves and eases the problem of complex navigation user interfaces by providing a responsive solution for Android, iOS, Linux, macOS, Windows, and web platforms.",
    ),
    ProductData(
      url: floatingTabBarUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "Airoll",
      description:
          "The Airoll widget is a customized Flutter widget that extends PopupMenuButton and provides additional features for handling hover events, nested pop-up menus, and customization of appearance.",
    ),
    ProductData(
      url: floatingTabBarUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "Niftile",
      description:
          "The LandingPage widget is a Flutter widget designed to create landing screens and welcome interfaces. It leverages the floating_tabbar package and utilizes the TabItem model class to manage data.",
    ),
    ProductData(
      url: floatingTabBarUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "Nautics",
      description:
          "The Nautics widget is a Flutter widget designed to create a sidebar navigation with the ability to expand and collapse. It supports both icon-based and tile-based navigation, allowing for a flexible and customizable user interface.",
    ),
    ProductData(
      url: floatingTabBarUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "Floater",
      description: "The Floater class is a simple Flutter widget that creates a floating container with customizable properties.",
    ),
    ProductData(
      url: floatingTabBarUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "OpsShell",
      description:
          "The OpsShell class is a Flutter widget designed to help create responsive screens. It provides a way to wrap the main content of the screen and show a responsive design on large screens while maintaining a normal appearance on small screens.",
    ),
    ProductData(
      url: Uri.parse("https://pub.dev/packages/floating_tabbar#vitrify"),
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "Vitrify",
      description:
          "The Vitrify widget is designed to create a glass card look for its child. It utilizes the ClipRRect widget, BackdropFilter, and Container with a specified color and opacity.",
    ),
    ProductData(
      url: floatingTabBarUrl,
      icon: const Icon(CupertinoIcons.cube_box, size: 40, color: primary),
      title: "TopTabBar",
      description:
          "The TopTabBar widget is designed to create a top TabBar with built-in space for nesting contingency. It allows you to customize the appearance of the TabBar and TabBarView.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String platform = PlatformCheck().platformCheck(context: context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Vitrify(
              opacity: 0.1,
              radius: BorderRadius.circular(10),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      "Products",
                      style: TextStyle(
                        fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 20 : 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Widgets in Packages landing_page and floating_tabbar",
                      style: TextStyle(
                        fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 15 : 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height:
                platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.height * 0.6 : size.height * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pData.length,
              itemBuilder: (BuildContext context, int index) {
                int dataIndex = index % pData.length;
                return Product(
                  url: pData[dataIndex].url,
                  icon: pData[dataIndex].icon,
                  title: pData[dataIndex].title,
                  description: pData[dataIndex].description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Product extends StatefulWidget {
  final String title;
  final String description;
  final Uri url;
  final Widget icon;
  const Product({super.key, required this.title, required this.description, required this.url, required this.icon});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String platform = PlatformCheck().platformCheck(context: context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      height: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.height * 0.4 : size.height * 0.3,
      width: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? size.width * 0.8 : size.width * 0.2,
      child: Floater(
        radius: BorderRadius.circular(30),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
              child: widget.icon,
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 20 : 30,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(widget.description, maxLines: 4),
            const Spacer(),
            TextButton(
              onPressed: () => setState(() => launchInBrowser(widget.url)),
              child: Text(
                "Read More",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile ? 15 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ProductData {
  String title;
  String description;
  Uri url;
  Widget icon;
  ProductData({
    required this.title,
    required this.description,
    required this.url,
    required this.icon,
  });
}

final Uri floatingTabBarUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#floatingtabbar');
final Uri topTabBarUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#toptabbar');
final Uri floaterUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#floater');
final Uri nauticsUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#nautics');
final Uri opsShellUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#opsshell');
final Uri airollUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#airoll');
final Uri notificationBadgeUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#notificationbadge');
final Uri vitrifyUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#vitrify');
final Uri niftileUrl = Uri.parse('https://pub.dev/packages/floating_tabbar#niftile');
final Uri lintsUrl = Uri.parse('https://pub.dev/packages/flutter_lints');
final Uri dartDocUrl = Uri.parse('https://pub.dev/packages/dartdoc');
const String backgroundUrl =
    "https://media3.giphy.com/media/10cXff6xep02Na/giphy.gif?cid=ecf05e47gcaitolrju2yrqlljt7fcvs5qgsgn2at04ue5kdu&ep=v1_gifs_search&rid=giphy.gif&ct=g";
