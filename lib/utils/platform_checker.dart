import 'package:faltool/lib.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';

enum DevicePlatform { android, ios, windows, macOs, linux, web }

class PlatformChecker {
  static DevicePlatform get platform {
    if (isAndroid) {
      return DevicePlatform.android;
    } else if (isIos) {
      return DevicePlatform.ios;
    } else if (isLinux) {
      return DevicePlatform.linux;
    } else if (isWindows) {
      return DevicePlatform.windows;
    } else if (isMacOs) {
      return DevicePlatform.macOs;
    } else {
      return DevicePlatform.web;
    }
  }

  static bool get isMobile => isAndroid || isIos;

  static bool get isMobileApp => (isAndroid || isIos) && isNotWeb;

  static bool get isMobileOnWeb => (isAndroid || isIos) && isWeb;

  static bool get isDesktop => isMacOs || isLinux || isWindows || isFuchsia;

  static bool get isWeb => kIsWeb;

  static bool get isNotWeb => !kIsWeb;

  ///========================= PLATFORM =========================///
  static bool get isAndroid => Platform.isAndroid;

  static bool get isNotAndroid => !isAndroid;

  static bool get isAndroidApp => isAndroid && isNotWeb;

  static bool get isNotAndroidApp => !isAndroidApp;

  static bool get isAndroidOnWeb => userAgent.contains('Android');

  static bool get isIos => Platform.isIOS;

  static bool get isIosApp => isIos && isNotWeb;

  static bool get isIosOnWeb => userAgent.contains('iPhone');

  static bool get isLinux => Platform.isLinux;

  static bool get isLinuxApp => isLinux && isNotWeb;

  static bool get isLinuxOnWeb => userAgent.contains('Linux');

  static bool get isWindows => Platform.isWindows;

  static bool get isWindowsApp => isWindows && isNotWeb;

  static bool get isWindowsOnWeb => userAgent.contains('Windows');

  static bool get isMacOs => Platform.isMacOS;

  static bool get isMacOsApp => Platform.isMacOS && isNotWeb;

  static bool get isMacOsOnWeb => userAgent.contains('Macintosh');

  static bool get isFuchsia => Platform.isFuchsia;

  static Future<bool> get isChromeOS async {
    final packageInfo = await PackageInfo.fromPlatform();

    // Check if the app is running on an Android device with a Chrome OS package
    if (Platform.isAndroid &&
        packageInfo.packageName.startsWith('dev.flutter')) {
      final version = packageInfo.version;
      final versionComponents = version.split('.');
      final majorVersion = int.parse(versionComponents[0]);

      return majorVersion >= 50;
    }

    return false;
  }

  ///========================= WEBSITE =========================///

  static String get userAgent => html.window.navigator.userAgent;

  static bool get isChromeWeb =>
      userAgent.contains('Chrome') && !userAgent.contains('Chromium');

  static bool get isChromiumWeb => !userAgent.contains('Chromium');

  static bool get isFirefoxWeb => userAgent.contains('Firefox');

  static bool get isInternetExplorerWeb => userAgent.contains('Trident/7.0');

  static bool get isBraveWeb => userAgent.contains('Brave');

  static bool get isInAppBrowser =>
      userAgent.contains('instagram') ||
      userAgent.contains('fbav') ||
      userAgent.contains('kakaotalk') ||
      userAgent.contains('whatsapp') ||
      userAgent.contains('line');
}
