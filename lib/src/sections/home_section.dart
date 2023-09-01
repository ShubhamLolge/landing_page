import 'package:landing_page/imports.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 80 : 200 /* 160 */),
      child: (Responsive.isMobile(context))
          ? const Column(
              children: [
                _Text(),
                SizedBox(height: 30),
                _Image(),
                SizedBox(height: 39),
                _Buttons(),
              ],
            )
          : Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(color: Colors.orange, width: 120),
                const _LeftSection(),
                const SizedBox(width: 91),
                const _Image(),
              ],
            ),
    );
  }
}

class _LeftSection extends StatelessWidget {
  const _LeftSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 502,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_Text(), SizedBox(height: 74), _Buttons()],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 502,
          child: RichText(
            textAlign: (Responsive.isMobile(context)) ? TextAlign.center : TextAlign.start,
            text: TextSpan(
              text: HomeSectionConstants.homeSectionDescriptionText1,
              style: TextStyle(
                color: AppColors.darkBlack,
                fontSize: (Responsive.isMobile(context)) ? 36 : 56,
                fontWeight: FontWeight.w800,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: HomeSectionConstants.homeSectionDescriptionText2,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: (Responsive.isMobile(context)) ? 36 : 56,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: HomeSectionConstants.homeSectionDescriptionText3,
                  style: TextStyle(
                    color: AppColors.darkBlack,
                    fontSize: (Responsive.isMobile(context)) ? 36 : 56,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: (Responsive.isMobile(context)) ? 20 : 36),
        Padding(
          padding: (Responsive.isMobile(context)) ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
          child: SizedBox(
            width: 502,
            child: Text(
              HomeSectionConstants.homeSectionDescriptionSubText,
              textAlign: (Responsive.isMobile(context)) ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                color: (Responsive.isMobile(context)) ? AppColors.darkGrey : AppColors.primary,
                fontWeight: FontWeight.w400,
                fontSize: (Responsive.isMobile(context)) ? 14 : 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (Responsive.isMobile(context)) ? const EdgeInsets.symmetric(horizontal: 33) : EdgeInsets.zero,
      child: SizedBox(
        width: 719,
        child: SvgPicture.asset(
          HomeSectionConstants.homeSectionImage,
          height: (Responsive.isMobile(context)) ? 164 : 390,
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 502,
      child: Row(
        mainAxisAlignment: (Responsive.isMobile(context)) ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Center(
            child: EXCButton(
              width: (Responsive.isMobile(context)) ? 161 : 208,
              height: (Responsive.isMobile(context)) ? 48 : 64,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    HomeSectionConstants.homeSectionHomeButton,
                    style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: (Responsive.isMobile(context)) ? 14 : 16),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right_rounded)
                ],
              ),
              onPressed: () => {},
            ),
          ),
          const Flexible(child: SizedBox(width: 32)),
          Center(
            child: EXCButton(
              width: (Responsive.isMobile(context)) ? 161 : 208,
              height: (Responsive.isMobile(context)) ? 48 : 64,
              color: AppColors.white,
              borderColor: AppColors.primary,
              child: Text(
                HomeSectionConstants.homeSectionLearnMoreButton,
                style: TextStyle(color: AppColors.darkBlack, fontWeight: FontWeight.w700, fontSize: (Responsive.isMobile(context)) ? 14 : 16),
              ),
              onPressed: () => {},
            ),
          )
        ],
      ),
    );
  }
}
