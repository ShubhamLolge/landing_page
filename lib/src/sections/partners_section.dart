import 'package:landing_page/imports.dart';

class PartnersSection extends StatefulWidget {
  const PartnersSection({Key? key}) : super(key: key);

  @override
  State<PartnersSection> createState() => _PartnersSectionState();
}

class _PartnersSectionState extends State<PartnersSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 50 : 160),
      margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 80 : 200 /* 160 */),
      child: Column(
        children: [
          const SectionTitle(title: PartnersSectionConstants.partnerSectionTitle),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: (Responsive.isMobile(context)) ? 50 : 169,
                  child: SvgPicture.asset(
                    PartnersSectionConstants.partnerSectionSlackImage,
                    width: (Responsive.isMobile(context)) ? 50 : 169,
                    height: (Responsive.isMobile(context)) ? 13 : 157,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const _PartnerSpacer(),
                SizedBox(
                  width: (Responsive.isMobile(context)) ? 50 : 169,
                  child: SvgPicture.asset(
                    PartnersSectionConstants.partnerSectionMicrosoftImage,
                    width: (Responsive.isMobile(context)) ? 50 : 169,
                    height: (Responsive.isMobile(context)) ? 13 : 157,
                  ),
                ),
                const _PartnerSpacer(),
                SizedBox(
                  width: (Responsive.isMobile(context)) ? 50 : 169,
                  child: SvgPicture.asset(
                    PartnersSectionConstants.partnerSectionSlackImage,
                    width: (Responsive.isMobile(context)) ? 50 : 169,
                    height: (Responsive.isMobile(context)) ? 13 : 157,
                  ),
                ),
                const _PartnerSpacer(),
                SizedBox(
                  width: (Responsive.isMobile(context)) ? 50 : 169,
                  child: SvgPicture.asset(
                    PartnersSectionConstants.partnerSectionMicrosoftImage,
                    width: (Responsive.isMobile(context)) ? 50 : 169,
                    height: (Responsive.isMobile(context)) ? 13 : 157,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PartnerSpacer extends StatelessWidget {
  const _PartnerSpacer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: (Responsive.isMobile(context)) ? 0 : 2,
      margin: EdgeInsets.symmetric(horizontal: (Responsive.isMobile(context)) ? 28 : 48),
      color: const Color(0xffC0C5D2),
    );
  }
}
