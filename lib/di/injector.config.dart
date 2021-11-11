// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../db/database.dart' as _i3;
import '../repository/ddc_repository.dart' as _i5;
import '../view_model/home_view_model.dart' as _i6;
import '../view_model/time_line_view_model.dart' as _i7;
import 'di_module.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.AppDatabase>(appModule.appDatabase);
  gh.singleton<_i4.Dio>(appModule.ddcService());
  gh.factory<_i5.DDCRepository>(
      () => _i5.DDCRepositoryImpl(get<_i4.Dio>(), get<_i3.AppDatabase>()));
  gh.singleton<_i6.HomeViewModel>(
      _i6.HomeViewModel(repository: get<_i5.DDCRepository>()));
  gh.singleton<_i7.TimelineViewModel>(
      _i7.TimelineViewModel(repository: get<_i5.DDCRepository>()));
  return get;
}

class _$AppModule extends _i8.AppModule {}
