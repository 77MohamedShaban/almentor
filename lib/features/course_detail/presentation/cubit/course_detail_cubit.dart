import 'dart:async';
import 'package:almentor/core/remote/local/prefs_manager.dart';
import 'package:almentor/core/resources/internet_checker.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

part 'course_detail_state.dart';

@injectable
class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseDetailCubit() : super(CourseDetailInitial());

  VideoPlayerController? _controller;
  String? _courseId;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  Duration _lastPosition = Duration.zero;
  int _lastSavedSecond = -1;

  VideoPlayerController get controller => _controller!;

  Future<void> initializeVideo(String videoUrl, String courseId) async {
    emit(CourseDetailLoadingState());

    try {
      _courseId = courseId;

      _lastPosition = Duration.zero;
      _lastSavedSecond = -1;

      await _connectivitySubscription?.cancel();

      await _controller?.dispose();
      _controller = null;

      _controller = VideoPlayerController.networkUrl(
        Uri.parse(videoUrl),
      );

      await _controller!.initialize();

      /// 1. Resume playback using PrefsManager methods
      final savedPosition = PrefsManager.getCoursePosition(_courseId!);
      if (savedPosition > 0) {
        await _controller!.seekTo(Duration(seconds: savedPosition));
      }

      _controller!.addListener(_videoListener);

      /// 2. Listen to internet connection
      _connectivitySubscription = InternetChecker.onConnectivityChanged.listen((
        results,
      ) async {
        final hasConnection =
            results.contains(ConnectivityResult.mobile) ||
            results.contains(ConnectivityResult.wifi) ||
            results.contains(ConnectivityResult.ethernet);

        if (!hasConnection &&
            _controller != null &&
            _controller!.value.isPlaying) {
          await _controller!.pause();
          await saveProgress();

          if (!isClosed) {
            emit(_buildSuccessState());
          }
        }
      });

      emit(_buildSuccessState());
    } catch (e) {
      emit(CourseDetailErrorState("Failed to load video"));
    }
  }

  CourseDetailSuccessState _buildSuccessState() {
    final duration = _controller!.value.duration;
    final position = _controller!.value.position;

    final progress = duration.inSeconds == 0
        ? 0.0
        : position.inSeconds / duration.inSeconds;

    return CourseDetailSuccessState(
      controller: _controller!,
      isPlaying: _controller!.value.isPlaying,
      position: position,
      duration: duration,
      progress: progress.clamp(0.0, 1.0),
    );
  }

  void _videoListener() {
    if (_controller == null || isClosed) return;

    if (state is! CourseDetailSuccessState) return;

    final position = _controller!.value.position;

    if (position.inSeconds != _lastPosition.inSeconds) {
      _lastPosition = position;

      emit(_buildSuccessState());

      // Save every 5 seconds
      if (position.inSeconds > 0 &&
          position.inSeconds % 5 == 0 &&
          position.inSeconds != _lastSavedSecond) {
        _lastSavedSecond = position.inSeconds;
        unawaited(saveProgress());
      }

      // Reset progress when video finishes
      if (_controller!.value.duration != Duration.zero &&
          position >= _controller!.value.duration) {
        PrefsManager.saveCoursePosition(_courseId!, 0);
        PrefsManager.saveCourseProgress(_courseId!, 0);
      }
    }
  }

  Future<void> togglePlay() async {
    if (_controller == null) return;

    if (!_controller!.value.isPlaying) {
      final hasInternet = await InternetChecker.checkConnection();
      if (!hasInternet) {
        emit(NoInternetState("No Internet Connection"));
        return;
      }
      await _controller!.play();
    } else {
      await _controller!.pause();
      await saveProgress();
    }

    if (!isClosed) emit(_buildSuccessState());
  }

  Future<void> seekTo(Duration position) async {
    if (_controller == null) return;

    await _controller!.seekTo(position);
    await saveProgress();

    if (!isClosed) emit(_buildSuccessState());
  }

  /// 3. Save progress using PrefsManager methods
  Future<void> saveProgress() async {
    if (_controller == null || _courseId == null) return;

    final position = _controller!.value.position.inSeconds;
    final duration = _controller!.value.duration.inSeconds;

    await PrefsManager.saveCoursePosition(_courseId!, position);

    if (duration > 0) {
      final progress = position / duration;
      await PrefsManager.saveCourseProgress(_courseId!, progress);
    }
  }

  @override
  Future<void> close() async {
    await saveProgress();
    await _connectivitySubscription?.cancel();
    _controller?.removeListener(_videoListener);
    await _controller?.dispose();

    return super.close();
  }
}
