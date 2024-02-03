import 'package:landing_page/lib.dart';

/// Functions
Widget visibilityToggle(Function? onToggle, bool isHidden) {
  return InkWell(
    onTap: onToggle != null ? () => onToggle() : null,
    child: Icon(isHidden ? Icons.visibility : Icons.visibility_off,
        color: primary),
  );
}

/// To launch URL
/// use url launcher package for this method.
/*
  Future<void> openUrlLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      throw 'Could not launch $url';
    }
  }
*/

/// To hide the Floating Action Button when scroll control is at the top on the screen.
void disableFAB({
  required ScrollController scrollController,
  required AnimationController animationController,
}) {
  scrollController.addListener(() {
    if (scrollController.position.pixels ==
        scrollController.position.minScrollExtent) {
      animationController.reverse();
    }
  });
}

/// To indicate when [ScrollController] is in motion.
void detectScroll({
  required ScrollController scrollController,
  required AnimationController animationController,
}) {
  scrollController.addListener(() {
    if (scrollController.position.hasPixels) {
      animationController.forward();
    }
  });
}

/// To scroll to specific location using its [BuildContext]
scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}

/// scrolls to extreme top or bottom using [ScrollController]
void scrollsExtreme({
  required ScrollController scrollController,
  bool scrollToTop = false,
}) {
  scrollController.animateTo(
    scrollToTop == true
        ? scrollController.position.minScrollExtent
        : scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

/// Open drawer from right
void openRightDrawer({required GlobalKey<ScaffoldState> scaffoldKey}) {
  scaffoldKey.currentState!.openEndDrawer();
}

/// Open drawer from left
void openLeftDrawer({required GlobalKey<ScaffoldState> scaffoldKey}) {
  scaffoldKey.currentState!.openDrawer();
}

/// launch Url.
Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
