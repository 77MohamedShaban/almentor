import 'package:almentor/core/di/di.dart';
import 'package:almentor/features/course_detail/presentation/cubit/course_detail_cubit.dart';
import 'package:almentor/features/course_detail/presentation/screens/course_detail_screen.dart';
import 'package:almentor/features/courses/data/model/course.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCourseDetailCubit extends MockCubit<CourseDetailState> implements CourseDetailCubit {}

void main() {
  late MockCourseDetailCubit mockCubit;
  final testCourse = Course(
    id: "c001",
    title: "Test Course",
    videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  );

  setUpAll(() {
    registerFallbackValue(CourseDetailInitial());
  });

  setUp(() {
    mockCubit = MockCourseDetailCubit();
    
    // Setup GetIt for the test
    getIt.allowReassignment = true;
    getIt.registerSingleton<CourseDetailCubit>(mockCubit);

    // Default stubs
    when(() => mockCubit.initializeVideo(any(), any())).thenAnswer((_) async {});
    when(() => mockCubit.saveProgress()).thenAnswer((_) async {});
    when(() => mockCubit.close()).thenAnswer((_) async {});
    when(() => mockCubit.state).thenReturn(CourseDetailInitial());
  });

  Widget createWidgetUnderTest() {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        home: CourseDetailScreen(course: testCourse),
      ),
    );
  }

  testWidgets('should show loading indicator when state is loading', (tester) async {
    when(() => mockCubit.state).thenReturn(CourseDetailLoadingState());

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('should show error message when state is error', (tester) async {
    const errorMessage = "Error loading video";
    when(() => mockCubit.state).thenReturn(CourseDetailErrorState(errorMessage));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(find.text(errorMessage), findsOneWidget);
    expect(find.text("Retry"), findsOneWidget);
  });
}
