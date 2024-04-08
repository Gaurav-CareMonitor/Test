/// Contains all the configuration for the app
class AppConfig {
  static const String _flavor = String.fromEnvironment("FLUTTER_APP_FLAVOR");

  static String auth0ClientId = "RABi9Rxz1SXMlGBiTrKxkKVbrWLPx6Zz";
  static String auth0Domain = "caremonitor.au.auth0.com";
  static String auth0Scheme = "caremonitor";

  /// Defines the environment of the app
  ///
  /// depends on [_flavor] which is passed in the build command using --dart-define=flavor=abc
  static const AppEnv env =
      _flavor == 'GHS' ? AppEnv.caremonitor : AppEnv.caremonitor;

  static String appName = env.name;
  static String playStoreUrl = env.playStoreUrl;
  static String appStoreUrl = env.appStoreUrl;
  static int databaseVersion = env.databaseVersion;
  static String appLogo = env.logoUrl;
  static String appNameIcon = env.nameIconUrl;

  /// Interval for automatic sync
  /// This is the interval after which the app will automatically sync the data from HealthKit or Google Fit
  static const autoSyncInterval = Duration(minutes: 2);
}

enum AppEnv {
  caremonitor(
      name: "CareMonitor",
      databaseVersion: 1,
      logoUrl: "assets/logo.png",
      nameIconUrl: "assets/CareMonitorLogo.png",
      appIdHeader: "CMAPP",
      appStoreUrl: 'https://apps.apple.com/au/app/caremonitor/id1359688906',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.health.caremonitor',
      instabugKey: 'fce2c47dd75fb77980835fd2ddee7ec2',
      sentryDSN:
          'https://6c84b7ba01494fb4ae6f0e77e5b73ba7@o435990.ingest.sentry.io/5911933',
      privacyPolicyUrl: "https://caremonitor.com.au/privacy-policy",
      tnCUrl: "https://caremonitor.com.au/caremonitor-app-terms-of-use");

  /// Name of the app
  final String name;

  /// Url of the app logo
  final String logoUrl;

  /// Url of the app name icon
  final String nameIconUrl;

  /// Url of the app in the app store
  final String appStoreUrl;

  /// Url of the app in the play store
  final String playStoreUrl;

  /// Instabug key
  final String instabugKey;

  /// Sentry DSN
  /// The DSN tells the SDK where to send the events to
  final String sentryDSN;

  /// App id header
  /// This is used to identify the app in the backend
  /// and is sent in the header of every request with key 'App-Id'
  final String appIdHeader;

  /// Url of the privacy policy
  final String privacyPolicyUrl;

  /// Url of the terms and conditions
  final String tnCUrl;

  /// Database version
  /// specifies the schema version of the database being opened for sqflite
  final int databaseVersion;

  const AppEnv(
      {required this.name,
      required this.logoUrl,
      required this.nameIconUrl,
      required this.appStoreUrl,
      required this.playStoreUrl,
      required this.databaseVersion,
      required this.instabugKey,
      required this.sentryDSN,
      required this.appIdHeader,
      required this.privacyPolicyUrl,
      required this.tnCUrl});
}
