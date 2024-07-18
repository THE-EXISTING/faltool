import 'package:faltool/lib.dart';

extension FalconEnumStringExtension on String {
  T toEnum<T extends Enum>(
    List<T> enumValues, {
    T? defaultValue,
    bool caseSensitive = false,
  }) =>
      caseSensitive
          ? enumValues.firstWhere(
              (e) => e.toValueString() == this,
              orElse: () => defaultValue!,
            )
          : enumValues.firstWhere(
              (e) => e.toValueString().toLowerCase() == toLowerCase(),
              orElse: () => defaultValue!,
            );

  T? toEnumOrNull<T extends Enum>(
    List<T> enumValues, {
    bool caseSensitive = false,
  }) =>
      caseSensitive
          ? enumValues.firstOrNullWhere((e) => e.toValueString() == this)
          : enumValues.firstOrNullWhere(
              (e) => e.toValueString().toLowerCase() == toLowerCase());
}

extension FalconEnumExtension on Enum {
  String toValueString() => EnumToString.convertToString(this);
}
