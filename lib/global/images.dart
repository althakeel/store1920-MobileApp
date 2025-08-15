abstract class AppImage {
  ///logos
  static String get companyLogo => 'company_logo'.iconPng;

  static String get appBarLogo => 'app_bar_logo'.iconPng;

  static String get home => 'home'.iconPng;

  static String get banner1 => 'banner_1'.imageJpg;

  static String get banner2 => 'banner_2'.imageJpg;

  static String get banner3 => 'banner_3'.imageJpg;

  static String get currencyIcon => 'aed_currency_icon'.iconPng;

  static String get cartIcon => 'cart_icon'.iconPng;

  static String get homeIcon => 'home_icon'.iconPng;

  static String get menuIcon => 'menu_icon'.iconPng;

  static String get shoppingCartIcon => 'shopping_cart_icon'.iconPng;

  static String get bagIcon => 'bag_icon'.iconPng;

  //Icons
  static String get calendar => 'calendar'.svg;

  static String get cameraSvg => 'camera'.svg;

  static String get arrowDown => 'arrow_down'.svg;

  static String get backArrow => 'back_arrow'.svg;

  static String get editIcon => 'edit_icon'.svg;

  // images
  static String get topImage => 'top_image'.imageJpg;

  static String get bottomImage => 'lower_image'.imageJpg;
}

extension on String {
  ///for icon folder
  String get iconPng => 'assets/icons/$this.png';

  ///for logo folder
  // String get logoPng => 'assets/logos/$this.png';

  ///for svg folder
  String get svg => 'assets/svgs/$this.svg';

  ///for logo folder
  String get imageJpg => 'assets/images/$this.jpg';
}
