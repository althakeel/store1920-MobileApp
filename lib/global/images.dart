abstract class AppImage {
  ///logos
  static String get companyLogo => 'company_logo'.iconPng;

  static String get newCompanyLogo => 'new_company_logo'.logoJpeg;

  static String get home => 'home'.iconPng;

  static String get signUpCamera => 'sign_up_camera'.iconPng;

  static String get user => 'user'.iconPng;

  static String get userMyProfile => 'user_my_profile'.iconPng;

  static String get arrowLeft => 'arrow_left'.iconPng;

  static String get editProfile => 'edit_profile'.iconPng;

  //Icons
  static String get calendar => 'calendar'.svg;

  static String get cameraSvg => 'camera'.svg;

  static String get arrowDown => 'arrow_down'.svg;

  static String get backArrow => 'back_arrow'.svg;

  static String get editIcon => 'edit_icon'.svg;

  // images
  static String get topImage => 'top_image'.logoJpeg;

  static String get bottomImage => 'lower_image'.logoJpeg;

  // flip book - All images are PNG format
  static String get img1 => 'img1'.flipImagesPng;

  static String get img2 => 'img2'.flipImagesPng;

  static String get img3 => 'img3'.flipImagesPng;

  static String get img4 => 'img4'.flipImagesPng;

  static String get img5 => 'img5'.flipImagesPng;

  static String get img6 => 'img6'.flipImagesPng;

  static String get img7 => 'img7'.flipImagesPng;

  static String get img8 => 'img8'.flipImagesPng;

  static String get img9 => 'img9'.flipImagesPng;

  static String get img10 => 'img10'.flipImagesPng;

  static String get img11 => 'img11'.flipImagesPng;

  static String get img12 => 'img12'.flipImagesPng;

  static String get img13 => 'img13'.flipImagesPng;

  static String get img14 => 'img14'.flipImagesPng;

  static String get img15 => 'img15'.flipImagesPng;

  static String get img16 => 'img16'.flipImagesPng;

  static String get img17 => 'img17'.flipImagesPng;

  static String get img18 => 'img18'.flipImagesPng;

  static String get img19 => 'img19'.flipImagesPng;

  static String get img20 => 'img20'.flipImagesPng;

  // Deck-specific images
  static String get img21_5 => 'img21(5)'.flipImagesPng;

  static String get img21_10 => 'img21(10)'.flipImagesPng;

  static String get img21_100 => 'img21(100)'.flipImagesPng;

  static String get img22 => 'img22'.flipImagesPng;

  static String get img23 => 'img23'.flipImagesPng;

  static String get img24 => 'img24'.flipImagesPng;

  static String get img25 => 'img25'.flipImagesPng;

  static String get img26 => 'img26'.flipImagesPng;
}

extension on String {
  ///for icon folder
  String get iconPng => 'assets/icons/$this.png';

  ///for logo folder
  String get logoPng => 'assets/logos/$this.png';

  ///for svg folder
  String get svg => 'assets/svgs/$this.svg';

  ///for logo folder
  String get logoJpeg => 'assets/images/$this.jpeg';

  ///for flip book folder (PNG files)
  String get flipImagesPng => 'assets/flip_book/$this.png';
}
