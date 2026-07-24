// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/course_detail/presentation/cubit/course_detail_cubit.dart'
    as _i649;
import '../../features/courses/data/datasource/course_local_dao.dart' as _i367;
import '../../features/courses/data/datasource/course_local_dao_impl.dart'
    as _i164;
import '../../features/courses/data/repository_impl/course_repository_impl.dart'
    as _i739;
import '../../features/courses/domain/repository/course_repository.dart'
    as _i490;
import '../../features/courses/domain/usecase/get_courses_usecase.dart'
    as _i494;
import '../../features/courses/presentation/cubit/courses_cubit.dart' as _i1042;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i649.CourseDetailCubit>(() => _i649.CourseDetailCubit());
    gh.factory<_i367.CourseLocalDao>(() => _i164.CourseLocalDaoImpl());
    gh.factory<_i490.CourseRepository>(
      () => _i739.CourseRepositoryImpl(
        localDataSource: gh<_i367.CourseLocalDao>(),
      ),
    );
    gh.factory<_i494.GetCoursesUseCase>(
      () => _i494.GetCoursesUseCase(gh<_i490.CourseRepository>()),
    );
    gh.factory<_i1042.CoursesCubit>(
      () => _i1042.CoursesCubit(gh<_i494.GetCoursesUseCase>()),
    );
    return this;
  }
}
