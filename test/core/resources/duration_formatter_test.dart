import 'package:almentor/core/resources/Functions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DurationFormatter Unit Tests', () {
    test('should format duration correctly for seconds only', () {
      const duration = Duration(seconds: 45);
      final result = Functions.formatDuration(duration);
      expect(result, "00:45");
    });

    test('should format duration correctly for minutes and seconds', () {
      const duration = Duration(minutes: 5, seconds: 9);
      final result = Functions.formatDuration(duration);
      expect(result, "05:09");
    });

    test('should format duration correctly for exactly one hour', () {
      const duration = Duration(hours: 1);
      final result = Functions.formatDuration(duration);
      expect(result, "00:00");
    });
  });
}
