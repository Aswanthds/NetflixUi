import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/core/d/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configInjection() async {
  await getIt.init();
}
