import 'package:landing_page/lib.dart';

class SectionLable extends StatelessWidget {
  final String title;
  final double? smallScreenFontSize;
  final double? largeScreenFontSize;
  final Color? color;
  const SectionLable({
    Key? key,
    required this.title,
    this.largeScreenFontSize,
    this.color,
    this.smallScreenFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: (PlatformType.isMobile(context)) ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        color: color ?? AppColors.darkBlack,
        fontWeight: FontWeight.w800,
        fontSize: (PlatformType.isMobile(context)) ? (smallScreenFontSize ?? 24) : (largeScreenFontSize ?? 52),
      ),
    );
  }
}
