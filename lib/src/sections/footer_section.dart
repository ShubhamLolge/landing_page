import 'package:landing_page/imports.dart';

class FooterSection extends StatelessWidget {
  final List<NavItem> navItems;
  const FooterSection({Key? key, required this.navItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBlack,
      height: (Responsive.isMobile(context)) ? 376 : 302,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(height: 302, color: const Color(0xff2B2B2B)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(5),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(),
                    SizedBox(width: 10),
                    SectionTitle(title: appName, largeScreenFontSize: 35, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 28,
                children: [
                  InkWell(
                    onTap: () => openUrlLink(LaunchUrls.FACEBOOK_URL),
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      child: SvgPicture.asset(FooterSectionConstants.fsFacebookImage, height: 36, width: 36),
                    ),
                  ),
                  InkWell(
                    onTap: () => openUrlLink(LaunchUrls.TWITTER_URL),
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      child: SvgPicture.asset(FooterSectionConstants.fsTwitchImage, height: 36, width: 36),
                    ),
                  ),
                  InkWell(
                    onTap: () => openUrlLink(LaunchUrls.LINKED_IN_URL),
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      child: SvgPicture.asset(FooterSectionConstants.fsLinkedInImage, height: 36, width: 36),
                    ),
                  ),
                  InkWell(
                    onTap: () => openUrlLink(LaunchUrls.GITHUB_URL),
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      child: SvgPicture.asset(FooterSectionConstants.fsGithubImage, height: 36, width: 36),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: (Responsive.isMobile(context)) ? 50 : 40,
                runSpacing: (Responsive.isMobile(context)) ? 35 : 40,
                children: const [
                  Text(Home, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18)),
                  Text(AboutUs, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18)),
                  Text(OurInterests, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18)),
                  Text(OurValues, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18)),
                  Text(Projects, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 18)),
                ],
              ),
              const SizedBox(height: 40)
            ],
          )
        ],
      ),
    );
  }
}
