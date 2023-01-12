import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:git_action_test/multi_line_form.dart';
import 'package:git_action_test/version_controller.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(VersionController());
    var formController = TextEditingController();
    FocusNode node = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextButton(onPressed: () async {
            //   var res = await controller.getAndroidStoreVersionA(appId: 'kr.go.keis.worknet');
            //   print(res);
            //   var a = controller.appVersion;
            //   var s = controller.storeVersion;
            // }, child: Text('get version')),

            // FutureBuilder(
            //   future: controller.getAndroidStoreVersionA(
            //       appId: 'kr.go.keis.worknet'),
            //   builder: (context, snapshot) {
            //     print('data >> ${snapshot.hasData}');
            //     if (snapshot.hasData) {
            //       var a = controller.appVersion;
            //       var s = controller.storeVersion;
            //       return SizedBox(
            //         width: Get.width,
            //         height: Get.height * 0.1,
            //         child: Center(
            //             child: Text('$a >>> $s ${controller.needUpdate}')),
            //       );
            //     } else {
            //       return Container();
            //     }
            //   },
            // ),

            // Obx(
            //   () {
            //     var controller = Get.put(VersionController());
            //     var a = controller.appVersion;
            //     var s = controller.storeVersion;
            //     PackageInfo.fromPlatform().then((value) {
            //       controller.getAndroidStoreVersion(value,appId: 'kr.go.keis.worknet');
            //
            //     });
            //
            //     return SizedBox(
            //       width: Get.width,
            //       height: Get.height * 0.1,
            //       child:
            //           Center(child: Text('$a >>> $s ${controller.needUpdate}')),
            //     );
            //   },
            // ),

            // TextButton(
            //     onPressed: () async {
            //       var up = await InAppUpdate.checkForUpdate();
            //       print(up);
            //     },
            //     child: Text('update')),
            TextButton(onPressed: () {}, child: Text('')),
            TextButton(onPressed: () {}, child: Text('')),
            MultiLineField(
                validator: (e)=>null,
                controller: formController,
                focusNode: focusNode,
                hintText: hintText,
                abled: abled)

            // GetBuilder<VersionController>(
            //   init: VersionController(),
            //   builder: (controller) {
            //     var a = controller.appVersion;
            //     var s = controller.storeVersion;

            //     return SizedBox(
            //       width: Get.width * 0.1,
            //       height: Get.height * 0.1,
            //       child: Text('$a >>> $s'),
            //     );
            //   },
            // )

            // UpgradeAlert(
            //   upgrader: Upgrader(
            //     // debugDisplayAlways: true,
            //     durationUntilAlertAgain: Duration(seconds: 1),
            //     onIgnore: () => false,
            //     onLater: () => false,
            //   ),
            // ),
            // TextButton(
            //     onPressed: () async {
            //       final newVersion = NewVersion();
            //       final status = await newVersion.getVersionStatus();
            //       // print(status);
            //       if (status != null) {
            //         print(status.canUpdate);
            //         print(status.localVersion);
            //         print(status.storeVersion);
            //         print(status.appStoreLink);
            //         newVersion.showUpdateDialog(
            //           context: context,
            //           versionStatus: status,
            //           dialogTitle: 'Custom dialog title',
            //           dialogText: 'Custom dialog text',
            //           updateButtonText: 'Custom update button text',
            //           dismissButtonText: 'Custom dismiss button text',
            //           dismissAction: () {
            //             print(status);
            //           },
            //         );
            //       }
            //     },
            //     child: Text('버전 체크')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
