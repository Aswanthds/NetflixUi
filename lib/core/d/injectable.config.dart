// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix_ui/application/downloads/downloads_bloc.dart' as _i10;
import 'package:netflix_ui/application/fastLaugh/fast_laugh_bloc.dart' as _i11;
import 'package:netflix_ui/application/Home/home_bloc.dart' as _i12;
import 'package:netflix_ui/application/HotandNewBloc/hot_and_new_bloc.dart'
    as _i13;
import 'package:netflix_ui/application/search/searchresult_bloc.dart' as _i9;
import 'package:netflix_ui/Domain/Downloads/i_downloads_repo.dart' as _i5;
import 'package:netflix_ui/Domain/HotAndNew/hot_and_new_service.dart' as _i3;
import 'package:netflix_ui/Domain/Search/search_service.dart' as _i7;
import 'package:netflix_ui/Infrastructure/Downloads/downlods_repo.dart' as _i6;
import 'package:netflix_ui/Infrastructure/HotandNew/hot_and_new_impl.dart'
    as _i4;
import 'package:netflix_ui/Infrastructure/Search/search_impl.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.HotandNewService>(() => _i4.HotAndNewImplementation());
    gh.lazySingleton<_i5.IDownloadRepo>(() => _i6.DownloadsRepository());
    gh.lazySingleton<_i7.SearchServices>(() => _i8.SearchImpl());
    gh.factory<_i9.SearchresultBloc>(() => _i9.SearchresultBloc(
          gh<_i5.IDownloadRepo>(),
          gh<_i7.SearchServices>(),
        ));
    gh.factory<_i10.DownloadsBloc>(
        () => _i10.DownloadsBloc(gh<_i5.IDownloadRepo>()));
    gh.factory<_i11.FastLaughBloc>(
        () => _i11.FastLaughBloc(gh<_i5.IDownloadRepo>()));
    gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(gh<_i3.HotandNewService>()));
    gh.factory<_i13.HotAndNewBloc>(
        () => _i13.HotAndNewBloc(gh<_i3.HotandNewService>()));
    return this;
  }
}
