import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungschool/models/authen_model.dart';
import 'package:ungschool/models/user_model.dart';
import 'package:ungschool/utility/dialog.dart';
import 'package:ungschool/utility/my_constant.dart';
import 'package:ungschool/widgets/show_image.dart';
import 'package:ungschool/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(color: MyConstant.light),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildImage(size),
                    buildTitle(),
                    buildUser(size),
                    buildPassword(size),
                    buildLogin(size),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildLogin(double size) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: size * 0.6,
      child: ElevatedButton(
        style: MyConstant().myButtonStyle(),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            String user = userController.text;
            String password = passwordController.text;
            print('### user = $user, password = $password');
            checkAuthen(user: user, password: password);
          }
        },
        child: Text('Login'),
      ),
    );
  }

  Future<Null> checkAuthen({String? user, String? password}) async {
    UserModel model = UserModel(username: user!, password: password!);
    Map<String, dynamic> map = model.toMap();

    await Dio().post(MyConstant.apiCheckAuthen, data: map).then((value) async {
      String message = value.data['message'];
      // print('### message ==> $message');
      if (message == 'Login success') {
        AuthenModel authenModel = AuthenModel.fromMap(value.data['data']);
        // print('### api_pass ==>> ${authenModel.api_pass}');

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setInt(MyConstant.keyId, authenModel.id);
        preferences.setInt(MyConstant.keyUserId, authenModel.user_id);
        preferences.setString(MyConstant.keyUserLogin, authenModel.user_login);
        preferences.setString(MyConstant.keyApiPass, authenModel.api_pass);
        preferences.setInt(
            MyConstant.keyUserActivation, authenModel.user_activation);
        preferences.setInt(MyConstant.keyUserStatus, authenModel.user_status);

        Navigator.pushNamedAndRemoveUntil(
            context, MyConstant.routeMyService, (route) => false);
      } else {
        // Authen False
        MyDialog().normalDialog(context, message);
      }
    });
  }

  Container buildUser(double size) => Container(
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(top: 16),
        width: size * 0.6,
        child: TextFormField(
          controller: userController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Fill User in Blank';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.perm_identity,
              color: MyConstant.dart,
            ),
            labelStyle: MyConstant().h3Style(),
            labelText: 'User :',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyConstant.dart),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyConstant.light),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red.shade700),
            ),
          ),
        ),
      );

  Container buildPassword(double size) => Container(decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(top: 16),
        width: size * 0.6,
        child: TextFormField(
          controller: passwordController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Fill Password in Blank';
            } else {
              return null;
            }
          },
          obscureText: redEye,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  redEye = !redEye;
                });
              },
              icon: redEye
                  ? Icon(
                      Icons.remove_red_eye,
                      color: MyConstant.dart,
                    )
                  : Icon(
                      Icons.remove_red_eye_outlined,
                      color: MyConstant.light,
                    ),
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: MyConstant.dart,
            ),
            labelStyle: MyConstant().h3Style(),
            labelText: 'Password :',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyConstant.dart),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyConstant.light),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red.shade700),
            ),
          ),
        ),
      );

  ShowTitle buildTitle() => ShowTitle(
        title: MyConstant.appName,
        textStyle: MyConstant().h1Style(),
      );

  Container buildImage(double size) {
    return Container(
      width: size * 0.6,
      child: ShowImage(path: MyConstant.image1),
    );
  }
}
