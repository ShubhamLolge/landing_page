import 'package:landing_page/lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: manrope,
        useMaterial3: true,
      ),
      home: LandingPage(children: tabItems),
    );
  }
}

const String url1 = "https://images.pexels.com/photos/1420702/pexels-photo-1420702.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
const String url2 = "https://images.pexels.com/photos/5952651/pexels-photo-5952651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
const String url3 = "https://images.pexels.com/photos/273886/pexels-photo-273886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
const String url4 = "https://images.pexels.com/photos/5583091/pexels-photo-5583091.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";

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
  TabItem(
    title: const Text("Thunder", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
    tab: MyWidget(
      url: url2,
      child: "Thunder",
      key: GlobalKey(),
      color: Colors.orange,
      lead: const Icon(Icons.offline_bolt_rounded, size: 60),
    ),
    selectedLeadingIcon: const Icon(Icons.offline_bolt_rounded),
    badgeCount: 1,
    onTap: () {},
  ),
  TabItem(
    title: const Text("Sailing", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
    tab: MyWidget(url: url3, child: "Sailing", key: GlobalKey(), color: Colors.blue, lead: const Icon(Icons.sailing_rounded, size: 60)),
    selectedLeadingIcon: const Icon(Icons.sailing_rounded),
    onTap: () {},
  ),
  TabItem(
    title: const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
    tab: MyWidget(url: url4, child: "Settings", key: GlobalKey(), color: Colors.red, lead: const Icon(Icons.handyman_rounded, size: 60)),
    selectedLeadingIcon: const Icon(Icons.handyman_rounded),
    onTap: () {},
  ),
];
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
