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
import 'package:netflix_ui/application/downloads/downloads_bloc.dart' as _i8;
import 'package:netflix_ui/application/fastLaugh/fast_laugh_bloc.dart' as _i9;
import 'package:netflix_ui/application/search/searchresult_bloc.dart' as _i7;
import 'package:netflix_ui/Domain/Downloads/i_downloads_repo.dart' as _i3;
import 'package:netflix_ui/Domain/Search/search_service.dart' as _i5;
import 'package:netflix_ui/Infrastructure/Downloads/downlods_repo.dart' as _i4;
import 'package:netflix_ui/Infrastructure/Search/search_impl.dart' as _i6;

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
    gh.lazySingleton<_i3.IDownloadRepo>(() => _i4.DownloadsRepository());
    gh.lazySingleton<_i5.SearchServices>(() => _i6.SearchImpl());
    gh.factory<_i7.SearchresultBloc>(() => _i7.SearchresultBloc(
          gh<_i3.IDownloadRepo>(),
          gh<_i5.SearchServices>(),
        ));
    gh.factory<_i8.DownloadsBloc>(
        () => _i8.DownloadsBloc(gh<_i3.IDownloadRepo>()));
    gh.factory<_i9.FastLaughBloc>(
        () => _i9.FastLaughBloc(gh<_i3.IDownloadRepo>()));
    return this;
  }
}
