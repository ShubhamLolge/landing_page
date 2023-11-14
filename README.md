# LandingPage

Built on top of [floating_tabbar](https://pub.dev/packages/floating_tabbar), **landing_page** serves at its best for creating landing screens and welcome interface for any of your project may it be landing UI for your next big project or your portfolio application we got you covered, using the phenominal TabItem model class for maintaining the data and using the rich widget library provided with floating_tabbar making it best experience possible for you create landing pages.

LandingPage is a flutter package for creating landing pages or welcome UI for your apps and websites, landing_page will help you with the first view of your work, application made using landing_page will give you the responsive user interface, we’ve got you covered with all possible customisation you will ever need.

Create a powerful first impression and guide users seamlessly through your app with **landing_page**, your landing pages will be unforgettable and yet created in minimum amount of time, leaving users excited to explore what's next turn on the wow factor!"


## Getting started

Import the package and use it in your Flutter App.
```dart
import 'package:landing_page/lib.dart';
```


## Usage

```dart
import 'package:landing_page_preview/lib.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Landing Page",
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: const LP(),
    );
  }
}
```
```dart
import 'package:landing_page_preview/lib.dart';

class LP extends StatefulWidget {
  const LP({super.key});

  @override
  State<LP> createState() => _LPState();
}

class _LPState extends State<LP> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return LandingPage(
      scaffoldKey: _key,
      children: tabItems,
      header: Header(
        showLeadingIcon: false,
        children: getChildren(context: context, key: _key),
      ),
    );
  }
}

final List<TabItem> tabItems = [
  TabItem(
    title: const Text("QR Code", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
    tab: MyWidget(
      url: url1,
      child: "QR Code",
      key: GlobalKey(),
      color: Colors.cyan,
      lead: const Icon(Icons.qr_code_rounded, size: 60),
    ),
    selectedLeadingIcon: const Icon(Icons.qr_code_rounded),
    badgeCount: 3,
    children: menuItems,
    onTap: () {},
  ),
];

List<TabItem> getChildren({
  required BuildContext context,
  required GlobalKey<ScaffoldState> key,
}) {
  final List<TabItem> children = [
    TabItem(
      title: const Icon(Icons.menu_rounded),
      callTIOnTap: true,
      onTap: () {
        openLeftDrawer(scaffoldKey: key);
      },
    ),
    TabItem(
      title: const Text("QR Code", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
      tab: MyWidget(
        url: url1,
        child: "QR Code",
        key: GlobalKey(),
        color: Colors.cyan,
        lead: const Icon(Icons.qr_code_rounded, size: 60),
      ),
      selectedLeadingIcon: const Icon(Icons.qr_code_rounded),
      badgeCount: 3,
      children: menuItems,
      onTap: () {},
    ),
    TabItem(
      title: const Text("Thunder", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
      tab: MyWidget(
        url: url2,
        child: "Thunder",
        key: GlobalKey(),
        color: Colors.orange,
        lead: const Icon(Icons.offline_bolt_rounded, size: 60),
      ),
      callTIOnTap: true,
      selectedLeadingIcon: const Icon(Icons.offline_bolt_rounded),
      badgeCount: 1,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyWidget(
              url: url2,
              child: "Thunder",
              key: GlobalKey(),
              color: Colors.orange,
              lead: const Icon(Icons.offline_bolt_rounded, size: 60),
            ),
          ),
        );
      },
    ),
    TabItem(
      title: const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
      tab: MyWidget(url: url4, child: "Settings", key: GlobalKey(), color: Colors.red, lead: const Icon(Icons.handyman_rounded, size: 60)),
      selectedLeadingIcon: const Icon(Icons.handyman_rounded),
      callTIOnTap: true,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyWidget(url: url4, child: "Settings", key: GlobalKey(), color: Colors.red, lead: const Icon(Icons.handyman_rounded, size: 60)),
          ),
        );
      },
    ),
    TabItem(
      title: const Text("Sailing", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
      tab: MyWidget(url: url3, child: "Sailing", key: GlobalKey(), color: Colors.blue, lead: const Icon(Icons.sailing_rounded, size: 60)),
      selectedLeadingIcon: const Icon(Icons.sailing_rounded),
      callTIOnTap: true,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyWidget(url: url3, child: "Sailing", key: GlobalKey(), color: Colors.blue, lead: const Icon(Icons.sailing_rounded, size: 60)),
          ),
        );
      },
    ),
  ];
  return children;
}

List<TabItem> menuItems = [
  TabItem(title: const Text('Option 1'), onTap: () {}, badgeCount: 2),
  TabItem(title: const Text('Option 2'), onTap: () {}),
  TabItem(
    title: const Text('Option 3'),
    onTap: () {},
    children: subItems,
    trailingIcon: const Icon(Icons.nightlight_round),
  ),
];

List<TabItem> subItems = [
  TabItem(title: const Text('Nested Option 1'), onTap: () {}),
  TabItem(title: const Text('Nested Option 2'), onTap: () {}),
];

class MyWidget extends StatelessWidget {
  final String child;
  final Widget lead;
  final Color color;
  final String url;
  const MyWidget({
    super.key,
    required this.child,
    required this.color,
    required this.lead,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
        height: size.height,
        width: size.width,
        child: Center(
          child: Vitrify(
            opacity: 0.1,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconColor: Colors.black,
                textStyle: const TextStyle(fontSize: 50, color: Colors.black),
              ),
              onPressed: () {},
              icon: lead,
              label: Text(child),
            ),
          ),
        ),
      ),
    );
  }
}

const String url1 = "https://images.pexels.com/photos/1420702/pexels-photo-1420702.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
const String url2 = "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
const String url3 = "https://images.pexels.com/photos/273886/pexels-photo-273886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
const String url4 = "https://images.pexels.com/photos/5583091/pexels-photo-5583091.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
```
<table>
  <tr>
    <td valign="top"><img width="974" alt="small_screen_two-e" src="https://github.com/ShubhamLolge/landing_page/assets/75387392/cae89852-1633-415f-8c5a-ccbada314695"></td>
    <td valign="top"><img width="994" alt="small_screen_one-e" src="https://github.com/ShubhamLolge/landing_page/assets/75387392/14000c5f-946f-47d9-b2cf-7c5856391e1e"></td>
  </tr>
</table>

<table>
  <tr>
    <td valign="top"><img width="1678" alt="large_screen_two-e" src="https://github.com/ShubhamLolge/landing_page/assets/75387392/df4c5fb0-b7f7-402c-8ec7-557b4f58b11d"></td>
  </tr>
</table>
<table>
  <tr>
    <td valign="top"><img width="2227" alt="large_screen-e" src="https://github.com/ShubhamLolge/landing_page/assets/75387392/2cd030b0-8df9-4173-88a7-47d8fa9edaed"></td>
  </tr>
</table>


Create and Customize your landing page as per your liking with **landing_page**.
