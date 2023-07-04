import 'package:faltool/lib.dart';

extension FalconFutureExtensionX<T> on Future<T> {}

extension FalconEitherFutureExtensions<L, R> on Future<R> {
  Future<Either<L, R>> get right => then((value) => Right(value));
}
