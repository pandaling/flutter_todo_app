class AppEnv {
  late EnvModel env;
  AppEnv._singleton();
  static final AppEnv _instance = AppEnv._singleton();

  factory AppEnv(env) {
    EnvModel envModel = EnvModel.fromJson(env);
    _instance.env = envModel;
    return _instance;
  }

  static get obj => _instance.env;

  @override
  String toString() => '[$runtimeType]';
}

class EnvModel {
  final String baseUrl;

  EnvModel({
    required this.baseUrl,
  });

  factory EnvModel.fromJson(Map<String, dynamic> json) {
    return EnvModel(
      baseUrl: json['BASE_URL'],
    );
  }
}
