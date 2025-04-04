import 'package:masoyinbo_mobile/env/env_fields.dart';
import 'package:masoyinbo_mobile/env/stg_env.dart';

abstract interface class Env implements EnvFields {
  factory Env() => _instance;

  static final Env _instance = _getEnv();

  /// Get the env based on environment
  static Env _getEnv() => StgEnv();
}
