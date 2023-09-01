// ignore_for_file: constant_identifier_names

import 'package:landing_page/imports.dart';

const String appName = "LandingPage";
const Duration kDuration = Duration(milliseconds: 600);
const String drawerImage = "assets/svg/drawer.svg";
const String Home = "Home";
const String Partners = "Partners";
const String AboutUs = "About Us";
const String OurInterests = "Our Interests";
const String OurValues = "Our Values";
const String Projects = "Projects";

class HeaderSectionConstants {
  static const String headerSectionSignUpButton = "Sign Up";
  static const String headerSectionAppVersion = "V 1.0";
}

class HomeSectionConstants {
  static const String homeSectionDescriptionText1 = 'Let’s take a \ntour to ';
  static const String homeSectionDescriptionText2 = 'Blockchain';
  static const String homeSectionDescriptionText3 = '\nTechnology';
  static const String homeSectionDescriptionSubText = "We are highly focused by blockchain technology that will lead positively to the future web.";
  static const String homeSectionHomeButton = "Home";
  static const String homeSectionLearnMoreButton = "Learn more";

  static const String homeSectionImage = "assets/svg/people1.svg";
}

class PartnersSectionConstants {
  static const String partnerSectionTitle = "Partners";
  static const String partnerSectionSlackImage = "assets/svg/partners/slack.svg";
  static const String partnerSectionMicrosoftImage = "assets/svg/microsoft.svg";
}

class AboutUsSectionConstants {
  static const String aboutUsSectionTitle = "About Us";
  static const String aboutUsSectionSummary =
      "We generated names based on a multitude of factors and picked the one that resonated with us the most. Our founder first engaged with the blockchain in 2013";
  static const String aboutUsSectionImage = "assets/svg/about_us.svg";
  static const String aboutUsSectionProjectDone = 'Project Done';
  static const String aboutUsSectionProjectDoneCount = '600+';
  static const String aboutUsSectionHappyClients = 'Happy Clients';
  static const String aboutUsSectionHappyClientsCount = '950+';
  static const String aboutUsSectionEmployee = 'Employee';
  static const String aboutUsSectionEmployeeCount = '30+';
}

class OurInterestsSectionConstants {
  static const String oiSectionTitle = "Our Interests";
  static const String oiSectionDescription =
      "It's the norm these days to lay out a roadmap that gives stakeholders an indication of the direction that the project aspires to go. Inspired by Elon Musk’s 2006 masterplan, these are our skeleton ambitions.";

  // Blockchain Card
  static const String oisBCCImage = 'assets/svg/our_interest_1.svg';
  static const String oisBCCTitle = 'Blockchain product ';
  static const String oisBCCDescription = 'Create something novel that has never been done on the blockchain before Build a product';

  // Quality Product
  static const String oisQPImage = 'assets/svg/our_interest_2.svg';
  static const String oisQPTitle = 'Quality product';
  static const String oisQPDescription = 'Create something novel that has never been done on the blockchain before Build a product';

  // viable Product
  static const String oisVPImage = 'assets/svg/our_interest_3.svg';
  static const String oisVPTitle = 'Viable product';
  static const String oisVPDescription = 'Create something novel that has never been done on the blockchain before Build a product';

  static const String oiSectionReadMoreButton = 'Read More';
}

class OurValuesSectionConstants {
  static const String ourValuesSectionTitle = "Our Values";
  static const String ourValuesSectionButton = "Read More";
  static const String ourValuesSectionDescription =
      'anftw is a hallmark. The team members may change, but the quality of our project execution will not.An outstanding team can build a product in any industry. Don’t be intimidated by incumbents.';
  static const String ourValuesSectionSectionImage = "assets/svg/our_values.svg";
}

class CurrentProjectsSectionConstants {
  static const String cpsSectionTitle = "Current Projects";
  static const String cpsReadMoreButton = ' Read more';
  static const String cpsReadLearnButton = 'Learn more.';

  // Project One
  static const String cpsP1Title = 'Certified Great \nExpectations Lover ';
  static const String cpsP1Description = 'Certified Great Expectations Lover - To add value to ';
  static const String cpsP1Image = 'assets/png/current_project_1.png';

  // Project Two
  static const String cpsP2Title = 'BlockSpace - \nA solar System ';
  static const String cpsP2Description = 'BlockSpace - We built the first ever accurate model of ';
  static const String cpsP2Image = 'assets/png/current_project_2.png';

  // Project Three
  static const String cpsP3Title = '0xProxy - \nA web 3.0 Website';
  static const String cpsP3Description = 'BlockSpace - This project was a collaborative exercise';
  static const String cpsP3Image = 'assets/png/current_project_3.png';
}

class FooterSectionConstants {
  // static const String fsHomeTitle = "Home";
  // static const String fsAboutUsTitle = "About us";
  // static const String fsOurInterestTitle = "Our interests";
  // static const String fsValuesTitle = "Values";
  // static const String fsProjectsTitle = "Current Projects";
  static const String fsFacebookImage = 'assets/svg/social/facebook.svg';
  static const String fsTwitchImage = 'assets/svg/social/twitch.svg';
  static const String fsLinkedInImage = 'assets/svg/social/linkedin.svg';
  static const String fsGithubImage = 'assets/svg/social/github.svg';
}

//URL Links
class LaunchUrls {
  static const String LINKED_IN_URL = "https://in.linkedin.com/";
  static const String INSTAGRAM_URL = "https://www.instagram.com/";
  static const String GITHUB_URL = "https://github.com/";
  static const String FACEBOOK_URL = "https://facebook.com/";
  static const String TWITTER_URL = "http://twitter.com/";
}

class NavItem {
  final String name;
  final GlobalKey key;
  final Widget? icon;
  bool isSelected;

  NavItem({
    required this.name,
    required this.key,
    this.icon,
    this.isSelected = false,
  });
}

class AppColors {
  AppColors._();
  // static const Color primary = Color(0XFFFF6600);
  static const Color primary = Color.fromARGB(255, 12, 102, 132);
  static const Color darkBlack = Color(0XFF2B2B2B);
  static const Color darkGrey = Color(0XFF5B5B5B);
  static const Color white = Color(0XFFFFFFFF);
}

class Dimensions {
  static double defaultTextSize = 16.00;
  static double smallTextSize = 14.00;
  static double extraSmallTextSize = 12.00;
  static double largeTextSize = 18.00;
  static double extraLargeTextSize = 22.00;

  static const double defaultPaddingSize = 30.00;
  static const double marginSize = 20.00;
  static const double heightSize = 12.00;
  static const double widthSize = 10.00;
  static const double radius = 10.00;
  static const double buttonHeight = 45.00;
}

class FontFamily {
  FontFamily._();
  static const String manrope = "Manrope";
}

class AppStyles {
  static var underLineBorder = const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));

  static var addressBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: AppColors.primary),
  );

  static var focusedTransparentBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: Colors.transparent),
  );
  static var energyBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}
