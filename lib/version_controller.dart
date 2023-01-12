import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class Version {
  int major = 0;
  int minor = 0;
  int patch = 0;

  Version(String version) {
    major = int.parse(version.split('.').first);
    minor = int.parse(version.split('.')[1]);
    patch = int.parse(version.split('.').last);
  }
}

class VersionController extends GetxController {
  late PackageInfo _packageInfo;
  String appVersion = '0';
  String storeVersion = '0';
  var needUpdate = false.obs;

  @override
  void onInit() async {
    super.onInit();
    appVersion = await getAppVersion();
    print(appVersion);
    needUpdate(await checkVersion());
  }

  Future<String> getAppVersion() async {
    _packageInfo = await PackageInfo.fromPlatform();
    return _packageInfo.version;
  }

  Future<bool> checkVersion() async {
    String storeAppVersion = '0.0.0';
    if (Platform.isAndroid) {
      storeAppVersion =
          (await getAndroidStoreVersion(_packageInfo)) ?? storeAppVersion;
    } else if (Platform.isIOS) {
      storeAppVersion = (await getiOSStoreVersion(_packageInfo));
    }
    print(storeAppVersion);
    print(appVersion);
    storeVersion = storeAppVersion;
    return appVersion != storeVersion;
  }

  bool compareVersion(Version local, Version remote) {
    if (local.major < remote.major) return true;
    if (local.minor < remote.minor) return true;
    if (local.patch < remote.patch) return true;
    return false;
  }

  Future<String?> getAndroidStoreVersion(PackageInfo packageInfo,{String? appId}) async {
    final id = appId??packageInfo.packageName;
    print(id);

    final uri = Uri.https('play.google.com', '/store/apps/details',
        {'id': id, 'hl': 'en', 'gl': 'US'});
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      print('Can\'t find an app in the Play Store with the id: $id');
      return null;
    }
    final document = parse(response.body);
    print(document);
    final elements = document.getElementsByClassName('hAyfc');
    final versionElement = elements.firstWhere(
      (elm) => elm.querySelector('.BgcNfc')?.text == 'Current Version',
    );
    return "";
  }

  Future<String?> getAndroidStoreVersionA({String? appId}) async {
    final id = appId;
    print(id);
    final uri = Uri.https('play.google.com', '/store/apps/details',
        {'id': id});
    try {
      final response = await http.get(uri);
      print(response.statusCode);
      if (response.statusCode != 200) {
        print('Can\'t find an app in the Play Store with the id: $id');
        return null;
      }
      final document = parse(response.body);
      print(document.runtimeType);
      final elements = document.getElementsByClassName('hAyfc');
      final versionElement = elements.firstWhere(
            (elm) => elm.querySelector('.BgcNfc')?.text == 'Current Version',
      );
    } catch (e){
      print(e.runtimeType);
    }

    return "";
  }

  Future<dynamic> getiOSStoreVersion(PackageInfo packageInfo) async {
    final id = packageInfo.packageName;
    final parameters = {'bundleId': id};
    final uri = Uri.https('itunes.apple.com', '/lookup', parameters);
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      // debugPrint('Can\'t find an app in the App Store with the id: $id');
      return null;
    }
    final jsonObj = json.decode(response.body);
    return jsonObj['results'][0]['version'];
  }

  String getStoreUrl() {
    if (Platform.isAndroid) {
      return 'https://play.google.com/store/apps/details?id=${_packageInfo.packageName}';
    } else if (Platform.isIOS) {
      // return 'https://apps.apple.com/kr/app/${_packageInfo.appName}/id${ConstantString.APP_STORE_ID}';
      return 'https://';
    } else {
      return 'https://';
    }
  }

  openAppStore() {
    launchUrl(Uri.parse(getStoreUrl()));
  }
}
