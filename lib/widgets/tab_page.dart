import 'package:flutter/material.dart';

// works well
class TabPage extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<Widget>? tabs; // List of tab widgets
  final List<Widget>? tabViews; // List of tab content views
  final int initialTabIndex; // Index of the initial tab
  final double? height;
  final double? width;
  final Widget? body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor; // Added background color property
  final GlobalKey<ScaffoldState> scaffoldKey;

  const TabPage({
    Key? key, // Add the missing key parameter
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.body,
    this.floatingActionButton,
    this.appBar,
    this.backgroundColor,
    this.tabs,
    this.tabViews,
    this.initialTabIndex = 0,
    required this.scaffoldKey,
  }) : super(key: key); // Initialize super with key

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      key: widget.key,
      child: Container(
        height: widget.height ?? size.height,
        width: widget.width ?? size.width,
        color: widget.backgroundColor ?? Colors.white, // Use background color
        padding: widget.padding,
        margin: widget.margin,
        child: Column(
          children: [
            widget.appBar ?? Container(),
            Expanded(child: widget.body ?? Container()),
            if (widget.floatingActionButton != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: widget.floatingActionButton,
                ),
              ),
          ],
        ),
      ),
    );
  }
}


// MY original code

// class TabPage extends StatefulWidget {
//   final EdgeInsetsGeometry? padding;
//   final EdgeInsetsGeometry? margin;
//   final double? height;
//   final double? width;
//   final Widget? body;
//   final Widget? floatingActionButton;
//   final PreferredSizeWidget? appBar;
//   const TabPage({
//     super.key,
//     this.padding,
//     this.margin,
//     this.height,
//     this.width,
//     this.body,
//     this.floatingActionButton,
//     this.appBar,
//   });

//   @override
//   State<TabPage> createState() => _TabPageState();
// }

// class _TabPageState extends State<TabPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Material(
//       child: Stack(
//         children: [
//           Container(
//             padding: widget.padding,
//             margin: widget.margin,
//             height: size.height,
//             width: size.width,
//             child: Column(
//               children: [
//                 widget.appBar ?? Container(),
//                 widget.body ?? Container(),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 10,
//             right: 10,
//             child: widget.floatingActionButton ?? Container(),
//           ),
//         ],
//       ),
//     );
//   }
// }
