import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungschool/bodys/genius_classroom.dart';
import 'package:ungschool/bodys/home.dart';
import 'package:ungschool/bodys/library.dart';
import 'package:ungschool/bodys/more.dart';
import 'package:ungschool/bodys/my_classroom.dart';
import 'package:ungschool/utility/my_constant.dart';
import 'package:ungschool/widgets/show_title.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  final List<Widget> widgets = [
    Home(),
    GeniusClassroom(),
    MyClassRoom(),
    Library(),
    More(),
  ];

  final List<String> titles = [
    'Home',
    'Genius',
    'Classroom',
    'Library',
    'More',
  ];

  final List<IconData> iconDatas = [
    Icons.home,
    Icons.filter_2,
    Icons.filter_3,
    Icons.filter_3,
    Icons.more_outlined,
  ];

  int indexBody = 0;

  List<BottomNavigationBarItem> bottonNavigationBarItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    buildArrayItem();
  }

  void buildArrayItem() {
    int index = 0;
    for (var item in titles) {
      bottonNavigationBarItems.add(
        BottomNavigationBarItem(backgroundColor: MyConstant.light,
          icon: Icon(
            iconDatas[index],color: MyConstant.dart,
          ),
          label: item,
        ),
      );
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: Text('My Service'),
      ),
      drawer: Drawer(
        child: buildLogOut(context),
      ),
      body: widgets[indexBody],
      bottomNavigationBar: BottomNavigationBar(
        items: bottonNavigationBarItems,
        currentIndex: indexBody,
        onTap: (value) {
          setState(() {
            indexBody = value;
          });
        },
      ),
    );
  }

  Column buildLogOut(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            Navigator.pop(context);
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then(
                  (value) => Navigator.pushNamedAndRemoveUntil(
                      context, MyConstant.routeAuthen, (route) => false),
                );
          },
          tileColor: MyConstant.primary,
          leading: Icon(
            Icons.exit_to_app,
            size: 36,
            color: Colors.white,
          ),
          title: ShowTitle(
              title: 'LogOut', textStyle: MyConstant().h1WhiteStyle()),
        ),
      ],
    );
  }
}
