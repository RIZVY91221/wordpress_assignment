class HiveConstants {
  HiveConstants._();

  static Config CONFIGS = const Config();
  static Session SESSIONS = const Session();

  static final INIT_BOXS = [CONFIGS.CONFIG_BOX, CONFIGS.SYSTEM_BOX, SESSIONS.SESSION_AUTH_BOX];
}

class Config {
  const Config();

  String get CONFIG_BOX => "CONFIG_BOX";
  String get CONFIG_LOCALE => "CONFIG_LOCALE";
  String get SYSTEM_BOX => "SYSTEM_BOX";
}

class Session {
  const Session();

  String get SESSION_AUTH_BOX => "SESSION_AUTH_BOX";
  String get ACCESS_TOKEN => "ACCESS_TOKEN";
  String get USER_DEFAULT => "USER_DEFAULT";
  String get USER_ID => "USER_ID";
}
