import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/ToolInnerCategoryItem.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Components/ToolsItem.dart';
import 'package:sportperformance/Screens/NotificationScreen.dart';
import 'package:sportperformance/utils/global.dart';

import 'MainScreen.dart';

class VidoeTraninigDetailScreen extends StatefulWidget {
  static const routeName = 'VidoeTraninigDetailScreen';
  @override
  State<VidoeTraninigDetailScreen> createState() =>
      _VidoeTraninigDetailScreenState();
}

class _VidoeTraninigDetailScreenState extends State<VidoeTraninigDetailScreen> {
  late String title;
  late String subTitle;
  late String image;

  final List<Map<String, dynamic>> categories = [
    {
      "title": "Exercises with Jumping Rope",
      "image": "assets/images/exercise1.png"
    },
    {
      "title": "Exercises with Jumping Rope",
      "image": "assets/images/exercise2.png"
    },
    {
      "title": "Exercises with Jumping Rope",
      "image": "assets/images/exercise3.png"
    },
  ];

  late List<Map<String, dynamic>> tabs = [];

  @override
  void didChangeDependencies() {
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    title = arg['title'];
    subTitle = arg['subTitle'];
    image = arg['image'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {"title":  context.translator.mainTab3, "icon": "assets/images/settings.png"},
      {"title": context.translator.mainTab4, "icon": "assets/images/profile.png"},
    ];
    var size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(darkMode.value
                    ? "assets/images/darkBg.png"
                    : "assets/images/bgImage.PNG"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: size.width / 2.5,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/tool.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/images/tool.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              NotificationScreen.routeName,
                            );
                          },
                          child: Image.asset(
                            "assets/images/notification.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 25),
                ToolsItem(
                  title: title,
                  image: image,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (ctx, i) => ToolInnerCategoryItem(
                        image: categories[i]['image'],
                        title: categories[i]['title'],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs),
    );
  }
}


//BottomNavigationBar(
//         elevation: 0,
//         iconSize: 30,
//         currentIndex: 2,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         selectedItemColor: Theme.of(context).primaryColorLight,
//         onTap: (page) => Get.to(MainScreen(page)),
//         items: List.generate(
//           tabs.length,
//           (index) => BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//             label: tabs[index]['title'],
//           ),
//         ),
//       ),