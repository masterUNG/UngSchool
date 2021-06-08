import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungschool/states/authen.dart';
import 'package:ungschool/states/my_service.dart';
import 'package:ungschool/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/myService': (BuildContext context) => MyService(),
};

String? firstState;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? apiPass = preferences.getString(MyConstant.keyApiPass);
  // print('### apiPass from Precerance ==>> $apiPass');

  if (apiPass?.isEmpty ?? true) {
    // Logout Status
    firstState = MyConstant.routeAuthen;
  } else {
    // Login Status
    firstState = MyConstant.routeMyService;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: firstState,
    );
  }
}
