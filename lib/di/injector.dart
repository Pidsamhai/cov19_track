import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

var getit = GetIt.instance;

@injectableInit
void configureInjection() =>  $initGetIt(getit);