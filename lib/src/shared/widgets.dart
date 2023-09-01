import 'dart:ui';
import 'package:landing_page/imports.dart';

// Logo
Widget newLogo({required BuildContext context}) {
  return RotationTransition(
    turns: const AlwaysStoppedAnimation(55 / 360),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      width: Responsive.isMobile(context) ? 45 : 75,
      height: Responsive.isMobile(context) ? 45 : 75,
      child: CustomPaint(
        painter: CircleProgress(
          currentProgress: 70,
          arcColor: Colors.white,
          trackColor: Colors.transparent,
          circleRadius: Responsive.isMobile(context) ? 11 : 20,
          strokeWidth: Responsive.isMobile(context) ? 6 : 10,
          context: context,
        ),
      ),
    ),
  );
}

// Logo
class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return appLogo();
    return newLogo(context: context);
  }
}

/// App logo, use this with changed url for different projects
Widget appLogo({
  AlignmentGeometry alignment = Alignment.center,
  bool allowDrawingOutsideViewBox = false,
  AssetBundle? bundle,
  bool cacheColorFilter = false,
  Clip clipBehavior = Clip.hardEdge,
  Color? color,
  BlendMode colorBlendMode = BlendMode.srcIn,
  bool excludeFromSemantics = false,
  BoxFit fit = BoxFit.contain,
  double? height,
  double? width,
  Key? key,
  bool matchTextDirection = false,
  String? package,
  Widget Function(BuildContext)? placeholderBuilder,
  String? semanticsLabel,
  SvgTheme? theme,
}) {
  return SvgPicture.asset(
    "assets/svg/logo.svg",
    key: key,
    alignment: alignment,
    allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
    bundle: bundle,
    cacheColorFilter: cacheColorFilter,
    clipBehavior: clipBehavior,
    color: color,
    colorBlendMode: colorBlendMode,
    excludeFromSemantics: excludeFromSemantics,
    fit: fit,
    height: height,
    width: width,
    matchTextDirection: matchTextDirection,
    package: package,
    placeholderBuilder: placeholderBuilder,
    semanticsLabel: semanticsLabel,
    theme: theme,
  );
}

///
class EXCButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? text;
  final double? fontSize;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? color, borderColor, textColor;
  final double height;
  final double width;
  final double? borderRadius;
  const EXCButton({
    Key? key,
    this.onPressed,
    this.child,
    this.text,
    this.fontSize,
    this.color,
    this.borderColor,
    this.textColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius,
    required this.height,
    required this.width,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.primary,
            disabledForegroundColor: color ?? AppColors.primary.withOpacity(0.38),
            disabledBackgroundColor: color ?? AppColors.primary.withOpacity(0.12),
            elevation: 0.0,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 15,
              horizontal: horizontalPadding ?? 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              side: BorderSide(color: onPressed == null ? Colors.transparent : borderColor ?? color ?? AppColors.primary),
            ),
            minimumSize: Size(width, height)),
        child: text != null ? Text(text!, style: buttonTextStyle()) : child);
  }

  buttonTextStyle() {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: fontSize ?? 16,
      color: textColor ?? borderColor ?? Colors.white,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    );
  }
}

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  // This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}

/// [CircleProgress] is a type of Pie Chart
class CircleProgress extends CustomPainter {
  final double currentProgress;
  final double? circleRadius;
  final double? strokeWidth;
  final Color? arcColor;
  final Color? trackColor;
  final bool showPointer;
  final BuildContext context;
  CircleProgress({
    required this.currentProgress,
    this.arcColor,
    this.trackColor,
    this.circleRadius,
    this.strokeWidth,
    this.showPointer = false,
    required this.context,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = strokeWidth ?? 30
      ..color = trackColor ?? const Color.fromRGBO(10, 10, 10, 0.1)
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = strokeWidth ?? 30
      ..color = arcColor ?? Theme.of(context).primaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = circleRadius ?? min(size.width / 2, size.height / 2) - 10;
    canvas.drawCircle(center, radius, outerCircle); // this draws main outer circle
    double angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      false,
      completeArc,
    );
    final offset = Offset(
      center.dx + radius * cos(-pi / 2 + angle),
      center.dy + radius * sin(-pi / 2 + angle),
    );
    showPointer == true
        ? canvas.drawCircle(
            offset,
            5,
            Paint()
              ..strokeWidth = 5
              ..color = Colors.white
              ..style = PaintingStyle.fill,
          )
        : Container();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final double? smallScreenFontSize;
  final double? largeScreenFontSize;
  final Color? color;
  const SectionTitle({
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
      textAlign: (Responsive.isMobile(context)) ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        color: color ?? AppColors.darkBlack,
        fontWeight: FontWeight.w800,
        fontSize: (Responsive.isMobile(context)) ? (smallScreenFontSize ?? 24) : (largeScreenFontSize ?? 52),
      ),
    );
  }
}

/// When wrapped with [Vitrify] widget it converts the look of the widget to glass card look.
///
/// If the look is not as you expected then turn the color of your widget i.e. [child] to [Colors.transparent]
/// then it shall work as expected.
class Vitrify extends StatelessWidget {
  /// [child] as a widget for [Vitrify].
  final Widget child;

  /// [opacity] value will determine how clear will the filter look.
  final double opacity;

  /// [radius] BorderRadius for the corners.
  final BorderRadius? radius;

  /// [color] background color.
  final Color color;

  const Vitrify({
    Key? key,
    required this.child,
    this.opacity = .4,
    this.radius,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(5),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(color: color.withOpacity(opacity), child: child),
      ),
    );
  }
}


/*  
  // ORIGINAL USECASE DO NOT DELETE

  Widget detectScrollOn({
    required Key key,
    required String name,
    required Widget child,
  }) {
    /*  
          // Need to use package: visibility_detector: ^0.4.0+2

          // variables needed
          late final AnimationController _controller = AnimationController(
            duration: const Duration(milliseconds: 300),
            vsync: this,
          );

          late final Animation<double> _animation = CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          );

          // Need to Use Scroll detector in this way
          detectScrollOn(
            key: navItems[2].key,
            name: navItems[2].name,
            child: const AboutUsSection(),
          ); // 2nd Nav Item


          // this to respond
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: ScaleTransition(
            scale: _animation,
            child: FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                scrollToSection(navItems[0].key.currentContext!);
                _controller.reverse();
              },
              child: const Icon(Icons.keyboard_double_arrow_up_rounded, size: 30, color: AppColors.white),
            ),
          ),
      */

    return VisibilityDetector(
      key: Key(name),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 10) {
          _controller.forward();
        }
      },
      child: Container(key: key, child: child),
    );
  }
*/
