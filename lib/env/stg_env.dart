import 'package:envied/envied.dart';
import 'package:masoyinbo_mobile/env/env.dart';
import 'package:masoyinbo_mobile/env/env_fields.dart';

part 'stg_env.g.dart';

@Envied(name: 'Env', path: 'assets/env/stg.env')
final class StgEnv implements Env, EnvFields {
  StgEnv();

  @override
  @EnviedField(varName: 'API_BASE_URL', obfuscate: true)
  final String apiBaseUrl = _Env.apiBaseUrl;
}
