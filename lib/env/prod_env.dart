import 'package:envied/envied.dart';
import 'package:masoyinbo_mobile/env/env.dart';
import 'package:masoyinbo_mobile/env/env_fields.dart';

part 'prod_env.g.dart';

@Envied(name: 'Env', path: 'assets/env/prod.env')
final class ProdEnv implements Env, EnvFields {
  ProdEnv();

  @override
  @EnviedField(varName: 'API_BASE_URL', obfuscate: true)
  final String apiBaseUrl = _Env.apiBaseUrl;
}
