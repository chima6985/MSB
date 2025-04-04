import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

class UserHelper {
  static User? fetchUser({
    required AuthBloc authBloc,
  }) {
    final user = AppStorage.getUser();
    if (user != null) {
      return user;
    } else {
      authBloc.add(const AuthEvent.authSignOut());
      return null;
    }
  }
}
