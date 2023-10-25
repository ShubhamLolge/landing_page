import 'package:landing_page/lib.dart';

/// Functions
Widget visibilityToggle(Function? onToggle, bool isHidden) {
  return InkWell(
    onTap: onToggle != null ? () => onToggle() : null,
    child: Icon(isHidden ? Icons.visibility : Icons.visibility_off, color: AppColors.primary),
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
disableFAB({
  required ScrollController scrollController,
  required AnimationController animationController,
}) {
  scrollController.addListener(() {
    if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
      animationController.reverse();
    }
  });
}

/// To show the Floating Action Button when scroll control is in motion.
detectScroll({
  required ScrollController scrollController,
  required AnimationController animationController,
}) {
  scrollController.addListener(() {
    if (scrollController.position.hasPixels) {
      animationController.forward();
    }
  });
}

/// To scroll to specific widget using its [BuildContext]
scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}

/// Get String from Text('') widget.
String getStringFromTextWidget(String string) {
  String? resultString;
  // Extract text inside double quotes using RegExp match
  RegExp regex = RegExp(r'"([^"]*)"');
  Match? match = regex.firstMatch(string);

  if (match != null) {
    String result = match.group(1) ?? '';
    resultString = result;
  }
  return resultString!;
}
