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

  // bottom navigation svgs

  static String get unHomeSvg => 'un-home'.svg;

  static String get homeSvg => 'home'.svg;

  static String get unShopSvg => 'un-shop'.svg;

  static String get shopSvg => 'shop'.svg;

  static String get unCategorySvg => 'un-category'.svg;

  static String get categorySvg => 'category'.svg;

  static String get unProfileSvg => 'un-profile'.svg;

  static String get profileSvg => 'profile'.svg;

  //sub_category icon

  static String get adhesive => 'adhesives_sealers'.subCatPng;

  static String get air => 'air_quality'.subCatPng;

  static String get appliances => 'appliances'.subCatPng;

  static String get audio => 'audio_radio'.subCatPng;

  static String get subElectronics => 'electronics'.subCatPng;

  static String get subMenCloth => 'men_clothing'.subCatPng;

  static String get subToolsHome => 'tools_home_improv'.subCatPng;

  static String get womenCloth => 'women_clothing'.subCatPng;

  //category icon

  static String get appliance => 'appliance'.catPng;

  static String get automative => 'automative'.catPng;

  static String get electronics => 'electronics'.catPng;

  static String get menCloth => 'men_clothing'.catPng;

  static String get petSupplies => 'pet_supplies'.catPng;

  static String get smartHome => 'smart_home'.catPng;

  static String get sportsOutdoor => 'sports_outdoor'.catPng;

  static String get toolsHome => 'tools_home_improv'.catPng;

  static String get toys => 'toys'.catPng;

  static String get womenClothing => 'womens_clothing'.catPng;

  static String get beautyOutdoors => 'beauty_outdoors'.catPng;

  static String get cellPhone => 'cell_phone'.catPng;
}

extension on String {
  ///for icon folder
  String get iconPng => 'assets/icons/$this.png';

  ///for product images
  String get prodPng => 'assets/products/$this.png';

  String get catPng => 'assets/category/$this.png';

  String get subCatPng => 'assets/sub_category/$this.png';

  ///for logo folder
  // String get logoPng => 'assets/logos/$this.png';

  ///for svg folder
  String get svg => 'assets/svgs/$this.svg';

  ///for logo folder
  String get imageJpg => 'assets/images/$this.jpg';
}
