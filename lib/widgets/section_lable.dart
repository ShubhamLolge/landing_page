import 'package:landing_page/lib.dart';

class SectionLable extends StatelessWidget {
  final String title;
  final double? smallScreenFontSize;
  final double? largeScreenFontSize;
  final Color? color;
  const SectionLable({
    super.key,
    required this.title,
    this.largeScreenFontSize,
    this.color,
    this.smallScreenFontSize,
  });

  @override
  Widget build(BuildContext context) {
    String platform = PlatformCheck().platformCheck(context: context);

    return Text(
      title,
      textAlign:
          platform == "Android" || platform == "iOS" || platform == "Web Mobile"
              ? TextAlign.center
              : TextAlign.start,
      style: TextStyle(
        color: color ?? AppColors.darkBlack,
        fontWeight: FontWeight.w800,
        fontSize: platform == "Android" ||
                platform == "iOS" ||
                platform == "Web Mobile"
            ? (smallScreenFontSize ?? 24)
            : (largeScreenFontSize ?? 52),
      ),
    );
  }
}
