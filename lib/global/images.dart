abstract class AppImage {
  ///logos
  static String get companyLogo => 'company_logo'.iconPng;

  static String get appBarLogo => 'app_bar_logo'.iconPng;

  static String get home => 'home'.iconPng;

  static String get homeBanner => 'home_page_banner'.imageJpg;

  static String get banner1 => 'banner_1'.imageJpg;

  static String get banner2 => 'banner_2'.imageJpg;

  static String get banner3 => 'banner_3'.imageJpg;

  static String get currencyIcon => 'aed_currency_icon'.iconPng;

  static String get cartIcon => 'cart_icon'.iconPng;

  static String get homeIcon => 'home_icon'.iconPng;

  static String get menuIcon => 'menu_icon'.iconPng;

  static String get shoppingCartIcon => 'shopping_cart_icon'.iconPng;

  static String get bagIcon => 'bag_icon'.iconPng;

  //products icon

  static String get prod1 => 'prod_1'.prodPng;

  static String get prod2 => 'prod_2'.prodPng;

  static String get prod3 => 'prod_3'.prodPng;

  static String get prod4 => 'prod_4'.prodPng;

  static String get prod5 => 'prod_5'.prodPng;

  static String get prod6 => 'prod_6'.prodPng;

  static String get prod7 => 'prod_7'.prodPng;

  static String get prod8 => 'prod_8'.prodPng;
}

extension on String {
  ///for icon folder
  String get iconPng => 'assets/icons/$this.png';

  ///for product images
  String get prodPng => 'assets/products/$this.png';

  ///for logo folder
  // String get logoPng => 'assets/logos/$this.png';

  ///for svg folder
  // String get svg => 'assets/svgs/$this.svg';

  ///for logo folder
  String get imageJpg => 'assets/images/$this.jpg';
}
