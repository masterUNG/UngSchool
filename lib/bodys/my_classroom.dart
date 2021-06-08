import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungschool/models/classroom_model.dart';
import 'package:ungschool/utility/my_constant.dart';
import 'package:ungschool/widgets/show_progress.dart';
import 'package:ungschool/widgets/show_title.dart';

class MyClassRoom extends StatefulWidget {
  const MyClassRoom({Key? key}) : super(key: key);

  @override
  _MyClassRoomState createState() => _MyClassRoomState();
}

class _MyClassRoomState extends State<MyClassRoom> {
  bool statusLoad = true;
  bool? haveData;

  List<ClassRoomModel> classRoomModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readClassRoom();
  }

  Future<Null> readClassRoom() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? userId = preferences.getInt(MyConstant.keyUserId);
    // print('### userId Logined ==> $userId');

    String path = MyConstant.apiClassRoom;
    // userId = 90;
    path = '$path$userId';

    // print('### pathAPI => $path');

    await Dio().get(path).then((value) {
      // print('### value => $value');

      List<dynamic> data = value.data['data'];
      // print('## data  ==> ${data.length}');
      if (data.length == 0) {
        setState(() {
          statusLoad = false;
          haveData = false;
        });
      } else {
        for (var item in data) {
          print('##### item ==> $item ####');

          ClassRoomModel classRoomModel = ClassRoomModel.fromMap(item);
          // print('### cource name ==>> ${classRoomModel.course_name}');
          setState(() {
            haveData = true;
            statusLoad = false;
            classRoomModels.add(classRoomModel);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statusLoad
          ? ShowProgress()
          : haveData!
              ? ListView.builder(
                  itemCount: classRoomModels.length,
                  itemBuilder: (context, index) =>
                      Text(classRoomModels[index].course_name),
                )
              : Center(
                  child: ShowTitle(
                    title: 'No ClassRoom',
                    textStyle: MyConstant().h1Style(),
                  ),
                ),
    );
  }
}
