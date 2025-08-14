enum ApiEnvironment {
  dev('http://rajwin.dyndns.org:8092/scriptcase/app/Sarpanch'),
  prod('https://cg.mmplactivations.com'),
  dummy('https://dummy-prod.rentitonline.ae');

  const ApiEnvironment(this.baseUrl);

  final String baseUrl;

  bool get isProd => this == ApiEnvironment.prod;

  bool get isDevMode {
    return this == ApiEnvironment.dev || this == ApiEnvironment.dummy;
  }
}

class ApiUrl {
  static String get login => '/api_login/index.php';

  static String get profile => '/api_register/index.php';

  static String get dashBoard => '/api_select/index.php';

  static String get getUser => '/api_login/index.php';

  static String get getCementSurvey => '/api_select/index.php';

  static String get updateSarpanchRecord => '/api_update/index.php';

  static String get attendance => '/api_update/index.php';

  static String get submitSurvey => '/api_update/index.php';

  static String get insertCollectionReq => '/api_update/index.php';

  static String get deleteCollectionReq => '/api_update/index.php';

  static String get imageUpload => '/api_image_upload/index.php';
}
