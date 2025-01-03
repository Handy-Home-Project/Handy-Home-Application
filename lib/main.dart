import 'package:flutter/material.dart';
import 'package:handy_home/app.dart';
import 'package:handy_home/commons/di/di.dart';
import 'package:handy_home/domain/repositories/shared_prefs_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _ensureInitializedApplication();

  runApp(const HandyHomeApplication());
}

Future<void> _ensureInitializedApplication() async {

  await DependencyInjection.configure();

  await DependencyInjection.getIt.get<SharedPreferencesRepository>().initSharedPrefs();

}