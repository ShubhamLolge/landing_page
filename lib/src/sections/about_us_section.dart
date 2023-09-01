import 'package:floating_tabbar/Widgets/floater.dart';
import 'package:landing_page/imports.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({Key? key}) : super(key: key);

  @override
  State<AboutUsSection> createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Responsive.isMobile(context) ? 80 : 200 /* 160 */),
      child: (Responsive.isMobile(context))
          ? const Column(
              children: [
                _AboutUsText(),
                _Image(),
                SizedBox(height: 16),
                _Frame111(),
              ],
            )
          : const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.end,
              children: [
                SizedBox(width: 105),
                _Image(),
                SizedBox(width: 30),
                _RightSection(),
                SizedBox(width: 120),
              ],
            ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 546,
      child: SvgPicture.asset(AboutUsSectionConstants.aboutUsSectionImage, width: 546, height: 331),
    );
  }
}

class _RightSection extends StatelessWidget {
  const _RightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 639,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _AboutUsText(),
          const SizedBox(height: 35),
          ClipRRect(borderRadius: BorderRadius.circular(10), child: const _Frame100()),
        ],
      ),
    );
  }
}

class _AboutUsText extends StatelessWidget {
  const _AboutUsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 639,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionTitle(title: AboutUsSectionConstants.aboutUsSectionTitle),
          SizedBox(height: (Responsive.isMobile(context)) ? 16 : 35),
          Padding(
            padding: (Responsive.isMobile(context)) ? const EdgeInsets.symmetric(horizontal: 26) : EdgeInsets.zero,
            child: Text(
              AboutUsSectionConstants.aboutUsSectionSummary,
              textAlign: (Responsive.isMobile(context)) ? TextAlign.center : TextAlign.start,
              style: TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.w400, height: 1.6, fontSize: (Responsive.isMobile(context)) ? 12 : 20),
            ),
          ),
        ],
      ),
    );
  }
}

class _Frame100 extends StatelessWidget {
  const _Frame100({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
      color: AppColors.white,
      child: const Row(
        children: [
          _Frame100Item(
            title: AboutUsSectionConstants.aboutUsSectionProjectDone,
            count: AboutUsSectionConstants.aboutUsSectionProjectDoneCount,
          ),
          _Frame100ItemSpacer(),
          _Frame100Item(
            title: AboutUsSectionConstants.aboutUsSectionHappyClients,
            count: AboutUsSectionConstants.aboutUsSectionHappyClientsCount,
          ),
          _Frame100ItemSpacer(),
          _Frame100Item(
            title: AboutUsSectionConstants.aboutUsSectionEmployee,
            count: AboutUsSectionConstants.aboutUsSectionEmployeeCount,
          )
        ],
      ),
    );
  }
}

class _Frame100Item extends StatelessWidget {
  final String title;
  final String count;
  const _Frame100Item({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.w600, fontSize: 23),
          ),
          Text(
            count,
            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 40),
          ),
        ],
      ),
    );
  }
}

class _Frame100ItemSpacer extends StatelessWidget {
  const _Frame100ItemSpacer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 3,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.primary,
    );
  }
}

class _Frame111 extends StatelessWidget {
  const _Frame111({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: const Column(
        children: [
          _Frame111Item(
            count: AboutUsSectionConstants.aboutUsSectionProjectDoneCount,
            title: AboutUsSectionConstants.aboutUsSectionProjectDone,
          ),
          SizedBox(height: 16),
          _Frame111Spacer(),
          SizedBox(height: 32),
          _Frame111Item(
            title: AboutUsSectionConstants.aboutUsSectionHappyClients,
            count: AboutUsSectionConstants.aboutUsSectionHappyClientsCount,
          ),
          SizedBox(height: 16),
          _Frame111Spacer(),
          SizedBox(height: 32),
          _Frame111Item(
            title: AboutUsSectionConstants.aboutUsSectionEmployee,
            count: AboutUsSectionConstants.aboutUsSectionEmployeeCount,
          ),
        ],
      ),
    );
  }
}

class _Frame111Item extends StatelessWidget {
  final String title;
  final String count;
  const _Frame111Item({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Floater(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 64,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    // color: const Color(0xffFFEDE6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      count,
                      style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _Frame111Spacer extends StatelessWidget {
  const _Frame111Spacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      height: 2,
      width: double.infinity,
    );
  }
}
