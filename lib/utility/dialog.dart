import 'package:flutter/material.dart';
import 'package:ungschool/utility/my_constant.dart';
import 'package:ungschool/widgets/show_image.dart';
import 'package:ungschool/widgets/show_title.dart';

class MyDialog {
  Future<Null> normalDialog(BuildContext context, String string) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.image3),
          title: ShowTitle(
            title: string,
            textStyle: MyConstant().h2Style(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
