class EnvConstants {
  const EnvConstants._();

  static const flavorKey = 'FLAVOR';
  static const appBasicAuthNameKey = 'APP_BASIC_AUTH_NAME';
  static const appBasicAuthPasswordKey = 'APP_BASIC_AUTH_PASSWORD';

  static late String flavor = const String.fromEnvironment(
    flavorKey,
    defaultValue: 'develop',
  );
  static late String appBasicAuthName = const String.fromEnvironment(
    appBasicAuthNameKey,
  );
  static late String appBasicAuthPassword = const String.fromEnvironment(
    appBasicAuthPasswordKey,
  );

  static void init() {
    // Log environment variables if needed
    print('[$flavorKey] $flavor');
    print('[$appBasicAuthNameKey] $appBasicAuthName');
    print('[$appBasicAuthPasswordKey] $appBasicAuthPassword');
  }
}
