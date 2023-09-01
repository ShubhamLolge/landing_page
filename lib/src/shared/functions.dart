import 'package:landing_page/imports.dart';

// Functions
Widget visibilityToggle(Function? onToggle, bool isHidden) {
  return InkWell(
    onTap: onToggle != null ? () => onToggle() : null,
    child: Icon(isHidden ? Icons.visibility : Icons.visibility_off, color: AppColors.primary),
  );
}

/// To launch URL
Future<void> openUrlLink(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(
      Uri.parse(url),
    );
  } else {
    throw 'Could not launch $url';
  }
}

/// To scroll to specific widget using its [BuildContext]
scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}

errorTextStyle(context) {
  return TextStyle(
    fontSize: 10,
    color: Theme.of(context).colorScheme.error,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
}
