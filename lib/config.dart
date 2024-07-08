String get appEnv {
  String config =
      const String.fromEnvironment('APP_ENV', defaultValue: 'development');

  if (config == 'production') {
    return 'assets/env/env_prod.json';
  } else if (config == 'staging') {
    return 'assets/env/env_stage.json';
  } else {
    return 'assets/env/env_dev.json';
  }
}
