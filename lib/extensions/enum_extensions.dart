import 'package:faltool/lib.dart';

extension FalconEnumStringExtension<T extends Enum> on String {
  T toEnum(
    List<T> enumValues, {
    bool caseSensitive = true,
  }) =>
      caseSensitive
          ? enumValues.firstWhere((e) => e.toValueString() == this)
          : enumValues.firstWhere(
              (e) => e.toValueString().toLowerCase() == toLowerCase());

  T? toEnumOrNull(
    List<T> enumValues, {
    bool caseSensitive = true,
  }) =>
      caseSensitive
          ? enumValues.firstOrNullWhere((e) => e.toValueString() == this)
          : enumValues.firstOrNullWhere(
              (e) => e.toValueString().toLowerCase() == toLowerCase());
}

extension FalconEnumExtension on Enum {
  String toValueString() => EnumToString.convertToString(this);
}
