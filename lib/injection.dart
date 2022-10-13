import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:linting_test/injection.config.dart';

GetIt get di => GetIt.I;

@InjectableInit(preferRelativeImports: false)
void configureDependencies() => $initGetIt(di);
