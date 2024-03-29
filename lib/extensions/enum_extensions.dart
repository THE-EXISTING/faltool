import 'package:faltool/lib.dart';

extension FalconEnumString on String {
  T toEnum<T>(List<T> enumValues) => enumValues.firstWhere((e) => e.toString() == this);

  T? toEnumOrNull<T>(List<T> enumValues) => enumValues.firstOrNullWhere((e) => e.toString() == this);
}
