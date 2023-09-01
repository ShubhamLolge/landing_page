import 'package:landing_page/imports.dart';

class OurInterestsSection extends StatelessWidget {
  const OurInterestsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 50 : 160),
      margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 80 : 200 /* 160 */),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _Text(),
          SizedBox(height: (Responsive.isMobile(context)) ? 18 : 65),
          if (Responsive.isMobile(context)) ...[
            const _MobileInterests()
          ] else ...[
            const _WebInterests(),
          ],
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: OurInterestsSectionConstants.oiSectionTitle),
        SizedBox(height: (Responsive.isMobile(context)) ? 16 : 35),
        Container(
          width: 765,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            OurInterestsSectionConstants.oiSectionDescription,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.w400, fontSize: (Responsive.isMobile(context)) ? 12 : 20),
          ),
        ),
      ],
    );
  }
}

class _WebInterests extends StatelessWidget {
  const _WebInterests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 121),
      child: Wrap(
        spacing: 30,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 24,
        children: [
          _WebItem(
            assetName: OurInterestsSectionConstants.oisBCCImage,
            title: OurInterestsSectionConstants.oisBCCTitle,
            subTitle: OurInterestsSectionConstants.oisBCCDescription,
          ),
          _WebItem(
            assetName: OurInterestsSectionConstants.oisQPImage,
            title: OurInterestsSectionConstants.oisQPTitle,
            subTitle: OurInterestsSectionConstants.oisQPDescription,
          ),
          _WebItem(
            assetName: OurInterestsSectionConstants.oisVPImage,
            title: OurInterestsSectionConstants.oisVPTitle,
            subTitle: OurInterestsSectionConstants.oisVPDescription,
          ),
        ],
      ),
    );
  }
}

class _WebItem extends StatelessWidget {
  final String assetName;
  final String title;
  final String subTitle;

  const _WebItem({Key? key, required this.assetName, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 379,
      padding: const EdgeInsets.symmetric(
        horizontal: 44,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: SvgPicture.asset(assetName),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(color: AppColors.darkBlack, fontWeight: FontWeight.w700, fontSize: 28),
          ),
          const SizedBox(height: 24),
          Text(
            subTitle,
            style: const TextStyle(height: 1.6, color: AppColors.darkGrey, fontWeight: FontWeight.w400, fontSize: 18),
          ),
          const SizedBox(height: 32),
          const Text(
            OurInterestsSectionConstants.oiSectionReadMoreButton,
            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class _MobileInterests extends StatelessWidget {
  const _MobileInterests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _MobileItem(
          assetName: OurInterestsSectionConstants.oisBCCImage,
          title: OurInterestsSectionConstants.oisBCCTitle,
          subTitle: OurInterestsSectionConstants.oisBCCDescription,
        ),
        _MobileItem(
          assetName: OurInterestsSectionConstants.oisQPImage,
          title: OurInterestsSectionConstants.oisQPTitle,
          subTitle: OurInterestsSectionConstants.oisQPDescription,
        ),
        _MobileItem(
          assetName: OurInterestsSectionConstants.oisVPImage,
          title: OurInterestsSectionConstants.oisVPTitle,
          subTitle: OurInterestsSectionConstants.oisVPDescription,
        ),
      ],
    );
  }
}

class _MobileItem extends StatelessWidget {
  final String assetName;
  final String title;
  final String subTitle;
  const _MobileItem({Key? key, required this.assetName, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(left: 24, top: 24, bottom: 24, right: 65),
      child: ClipRRect(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset(assetName),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(height: 1.6, color: AppColors.darkBlack, fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  const Text(
                    '${OurInterestsSectionConstants.oiSectionReadMoreButton}...',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
