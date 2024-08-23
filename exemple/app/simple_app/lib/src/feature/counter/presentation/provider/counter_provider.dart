import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class CounterNotifier extends _$CounterNotifier {
  @override
  int build() => 0;

  @override
  set state(int newState) => super.state = newState;
  int update(int Function(int state) cb) {
    if (cb(state) >= 0) {
      return state = cb(state);
    }
    return 0;
  }
}
