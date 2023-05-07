import 'package:faltool/faltool.dart';

extension FutureExtensionX<T> on Future<T> {
  // Future<T> thenIf(bool condition, FutureOr<T> onValue(T value)) {
  //   if (condition) {
  //     return this.then((value) => onValue(value));
  //   }
  //   return this;
  // }
}
