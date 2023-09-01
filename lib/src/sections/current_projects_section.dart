import 'package:landing_page/imports.dart';

class CurrentProjectsSection extends StatelessWidget {
  const CurrentProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 48 : 179),
      // margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 50 : 160),
      margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 80 : 200 /* 160 */),
      child: (Responsive.isMobile(context))
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Column(
                children: [
                  _Text(),
                  _MobileItem(
                    title: CurrentProjectsSectionConstants.cpsP1Title,
                    subTitle: CurrentProjectsSectionConstants.cpsP1Description,
                    assetName: CurrentProjectsSectionConstants.cpsP1Image,
                  ),
                  SizedBox(height: 40),
                  _MobileItem(
                    title: CurrentProjectsSectionConstants.cpsP2Title,
                    subTitle: CurrentProjectsSectionConstants.cpsP2Description,
                    assetName: CurrentProjectsSectionConstants.cpsP2Image,
                  ),
                  SizedBox(height: 40),
                  _MobileItem(
                    title: CurrentProjectsSectionConstants.cpsP3Title,
                    subTitle: CurrentProjectsSectionConstants.cpsP3Description,
                    assetName: CurrentProjectsSectionConstants.cpsP3Image,
                  )
                ],
              ),
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _Text(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  child: Wrap(
                    spacing: 30,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _OurInterestWebItem(
                        title: CurrentProjectsSectionConstants.cpsP1Title,
                        subTitle: CurrentProjectsSectionConstants.cpsP1Description,
                        assetName: CurrentProjectsSectionConstants.cpsP1Image,
                      ),
                      _OurInterestWebItem(
                        title: CurrentProjectsSectionConstants.cpsP2Title,
                        subTitle: CurrentProjectsSectionConstants.cpsP2Description,
                        assetName: CurrentProjectsSectionConstants.cpsP2Image,
                      ),
                      _OurInterestWebItem(
                        title: CurrentProjectsSectionConstants.cpsP3Title,
                        subTitle: CurrentProjectsSectionConstants.cpsP3Description,
                        assetName: CurrentProjectsSectionConstants.cpsP3Image,
                      ),
                    ],
                  ),
                )
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
        const SectionTitle(title: CurrentProjectsSectionConstants.cpsSectionTitle),
        SizedBox(height: (Responsive.isMobile(context)) ? 24 : 84),
      ],
    );
  }
}

class _OurInterestWebItem extends StatelessWidget {
  final String assetName;
  final String title;
  final String subTitle;

  const _OurInterestWebItem({Key? key, required this.assetName, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      // color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 378,
            height: 378,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(assetName),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(color: AppColors.darkBlack, fontWeight: FontWeight.w600, fontSize: 28),
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: subTitle,
              style: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: CurrentProjectsSectionConstants.cpsReadMoreButton,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
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

class _MobileItem extends StatelessWidget {
  final String assetName;
  final String title;
  final String subTitle;
  const _MobileItem({
    Key? key,
    required this.assetName,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 268,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(assetName),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          maxLines: 2,
          style: const TextStyle(
            color: AppColors.darkBlack,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          subTitle,
          maxLines: 2,
          style: const TextStyle(
            color: AppColors.darkBlack,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          CurrentProjectsSectionConstants.cpsReadLearnButton,
          maxLines: 2,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
