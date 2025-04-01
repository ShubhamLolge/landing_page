import 'package:floating_tabbar/lib.dart';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height * 1),
        child: Header(
          height: size.height * 0.1,
          color: Colors.grey.shade50,
          leading: Text("Leading", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          trailing: Text("Trailing", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
      ),
    );
  }
}

/// Header for the Flutter Web-app.
///
///
/// USE
/// ```dart
/// ```
class Header extends StatefulWidget {
  final Color? color;
  final double? elevation;
  final Widget? leading;
  final Widget? trailing;
  final double? height;
  final double? expandableHeight;
  final MainAxisAlignment? mainAxisAlignment;
  const Header({
    this.color,
    this.elevation = 1,
    this.leading,
    this.trailing,
    this.mainAxisAlignment,
    this.height,
    this.expandableHeight,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<TabItem> tabList = [
    TabItem(
      title: Text("HOME"),
      onTap: () {},
      tIOnTap: true,
    ),
    TabItem(
      title: Text("ABOUT"),
      onTap: () {},
      tIOnTap: true,
    ),
    TabItem(
      title: Text("Business"),
      onTap: () {},
      tIOnTap: true,
      children: [
        TabItem(
          title: Text("Option 1"),
          onTap: () {},
          tIOnTap: true,
        ),
        TabItem(
          title: Text("Option 2"),
          onTap: () {},
          tIOnTap: true,
        ),
      ],
    ),
    TabItem(
      title: Text("MEDIA"),
      onTap: () {},
      tIOnTap: true,
      children: [
        TabItem(
          title: Text("Option 1"),
          onTap: () {},
          tIOnTap: true,
        ),
        TabItem(
          title: Text("Option 2"),
          onTap: () {},
          tIOnTap: true,
        ),
      ],
    ),
    TabItem(
      title: Text("CONTACT"),
      onTap: () {},
      tIOnTap: true,
    ),
    TabItem(
      title: Text("COMPANIES"),
      onTap: () {},
      tIOnTap: true,
    ),
  ];

  List<Widget> tabButton() {
    List<Widget> list = [];
    tabList.forEach((ti) {
      if (ti.children == null) {
        list.add(HeaderTab(title: ti.title));
      }
      if (ti.children != null) {
        list.add(MouseRegion(
          onEnter: (_) => setState(() => isBusinessHovered = true),
          onExit: (_) => setState(() => isBusinessHovered = false),
          child: HeaderTab(title: ti.title),
        ));
      }
    });
    return list;
  }

  List<Widget> expandableTabs() {
    List<Widget> list = [];
    tabList.forEach((ti) {
      if (ti.children != null) {
        list.add(
          ExpandableTab(
            isHovering: isBusinessHovered,
            color: widget.color,
            elevation: widget.elevation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Business Option 1"),
                SizedBox(width: 20),
                Text("Business Option 2"),
              ],
            ),
          ),
        );
      }
    });
    return list;
  }

  bool isBusinessHovered = false;
  bool isMediaHovered = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: widget.elevation!,
          child: Container(
            color: widget.color,
            height: widget.height ?? size.height * 0.1, // Fixed height for the header row
            child: Row(
              children: [
                widget.leading == null
                    ? Container()
                    : Container(
                        height: widget.height ?? size.height * 0.1,
                        width: size.width * 0.1,
                        child: Center(child: widget.leading),
                      ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
                    children: tabButton(),
                    /*
                      children: [
                        HeaderTab(title: Text("HOME")),
                        HeaderTab(title: Text("ABOUT")),
                        MouseRegion(
                          onEnter: (_) => setState(() => isBusinessHovered = true),
                          onExit: (_) => setState(() => isBusinessHovered = false),
                          child: HeaderTab(title: Text("BUSINESS")),
                        ),
                        MouseRegion(
                          onEnter: (_) => setState(() => isMediaHovered = true),
                          onExit: (_) => setState(() => isMediaHovered = false),
                          child: HeaderTab(title: Text("MEDIA")),
                        ),
                        HeaderTab(title: Text("CONTACT")),
                        HeaderTab(title: Text("COMPANIES")),
                      ],                    
                    */
                  ),
                ),
                widget.trailing == null
                    ? Container()
                    : Container(
                        height: widget.height ?? size.height * 0.1,
                        width: size.width * 0.1,
                        child: Center(child: widget.trailing),
                      ),
              ],
            ),
          ),
        ),

        // ...expandableTabs(),

        // Expandable Business Area
        ExpandableTab(
          isHovering: isBusinessHovered,
          color: widget.color,
          elevation: widget.elevation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Business Option 1"),
              SizedBox(width: 20),
              Text("Business Option 2"),
            ],
          ),
        ),
        // Expandable Media Area
        ExpandableTab(
          color: widget.color,
          elevation: widget.elevation,
          isHovering: isMediaHovered,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Media Option 1"),
              SizedBox(width: 20),
              Text("Media Option 2"),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpandableTab extends StatelessWidget {
  final bool isHovering;
  final Color? color;
  final Widget child;
  final double? height;
  final Duration? duration;
  final double? elevation;
  const ExpandableTab({
    super.key,
    required this.isHovering,
    this.color,
    required this.child,
    this.height = 100,
    this.duration,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation!,
      child: AnimatedContainer(
        duration: duration ?? const Duration(milliseconds: 300),
        height: isHovering ? height : 0,
        color: color,
        child: isHovering ? child : null,
      ),
    );
  }
}

class HeaderTab extends StatelessWidget {
  final Widget title;
  final double? height;
  final double? width;
  final Color? color;
  final void Function()? onTap;

  const HeaderTab({required this.title, this.onTap, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        height: height ?? 60,
        width: width ?? 100,
        child: Center(child: title),
      ),
    );
  }
}
