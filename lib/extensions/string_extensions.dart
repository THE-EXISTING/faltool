import 'package:faltool/faltool.dart';

extension StringExtensionX on String {
  static const _urlPattern =
      r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

  String get removeWhiteSpace => replaceAll(RegExp(r"\s+"), "");

  bool get isUrl {
    final regexUrl = RegExp(_urlPattern, caseSensitive: false);
    return regexUrl.hasMatch(this);
  }

  bool get isNotUrl => !isUrl;

  int toIntOrZero() {
    final noWhitSpace = removeWhiteSpace;
    if (noWhitSpace.isEmpty) return 0;
    return noWhitSpace.toInt();
  }

  String get removeHttp => replaceAll(RegExp(r'https?://'), '');
}
