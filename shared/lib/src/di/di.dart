import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt sharedGetIt = GetIt.instance;

/// Configure DI for shared module.
@injectableInit
void configureInjection() => sharedGetIt.init();
