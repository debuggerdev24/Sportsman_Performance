import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/screens/fms_pdf_screen.dart';
import 'package:sportperformance/utils/global.dart';
import '../Utils/Color.dart';
import '../main.dart';
import '../snackbar.dart';

class FmsScreen extends StatefulWidget {
  const FmsScreen({super.key});

  @override
  State<FmsScreen> createState() => _FmsScreenState();
}

class _FmsScreenState extends State<FmsScreen> {
  late List<Map<String, dynamic>> tabs;
  late List testList;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    testList = [
      context.translator.deepSquat,//"SENTADILLA PROFUNDA",
      context.translator.fencePass,//"PASO DE VALLA",
      context.translator.stringInLine,//"ZANCADA EN LINEA",
      context.translator.shoulderMobility,//"MOVILIDAD DE HOMBROS",
      context.translator.shoulderDiscardTest,//"PRUEBA DE DESCARTE DE HOMBRO",
      context.translator.shoulderMobilityAgain,//"MOVILIDAD DE HOMBROS",
      context.translator.activeStraightLegRaise,//"ELEVACIÓN ACTIVA DE PIERNARECTA",
      context.translator.trunkStabilityFlexion,//"FLEXIÓN CON ESTABILIDAD DE TRONCO",
      context.translator.extensionDiscardTest,//"PRUEBA DESCARTE EXTENSIÓN",
      context.translator.rotaryStability,//"ESTABILIDAD ROTATORIA",
      context.translator.flexionDiscardTest,//"PRUEBA DESCARTE FLEXIÓN",
      context.translator.ankleFlexibility,//"FLEXIBILIDAD DE TOBILLO"
    ];

    tabs = [
      {
        "title": context.translator.mainTab1,
        "icon": "assets/images/home.png",
      },
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {
        "title": context.translator.mainTab3,
        "icon": "assets/images/settings.png"
      },
      {
        "title": context.translator.mainTab2,
        "icon": "assets/images/dumble.png"
      },
      {
        "title": context.translator.mainTab4,
        "icon": "assets/images/profile.png"
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                children: [
                  //todo ------------------> appBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: size.width / 2.5,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            spacing: 8,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/entertainment-screen');
                                },
                                child: Image.asset(
                                  "assets/images/tool.png",
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/plan&programing');
                                },
                                child: Image.asset(
                                  darkMode.value
                                      ? "assets/images/plans_darkmode.png"
                                      : "assets/images/plans.png",
                                  //"assets/images/tool.png",
                                  height: 25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/notification');
                                },
                                child: Image.asset(
                                  darkMode.value
                                      ? "assets/images/notifi_darkmode.png"
                                      : "assets/images/notifi.png",
                                  //"assets/images/notification.png",
                                  height: 28,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          // todo --> old code
                          // Row(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     InkWell(
                          //       onTap: () {
                          //         Get.toNamed('/entertainment-screen');
                          //       },
                          //       child: Image.asset(
                          //         "assets/images/tool.png",
                          //         width: 30,
                          //         height: 30,
                          //         fit: BoxFit.fill,
                          //       ),
                          //     ),
                          //     const SizedBox(width: 10),
                          //     InkWell(
                          //       onTap: () {
                          //         // Navigator.push(context, MaterialPageRoute(builder: (context)=> PlanScree(changeTab),));
                          //       },
                          //       child: Image.asset(
                          //         "assets/images/tool.png",
                          //         width: 30,
                          //         height: 30,
                          //         fit: BoxFit.fill,
                          //       ),
                          //     ),
                          //     const SizedBox(width: 10),
                          //     InkWell(
                          //       onTap: () {
                          //         Get.toNamed('/notification');
                          //       },
                          //       child: Image.asset(
                          //         "assets/images/notification.png",
                          //         width: 25,
                          //         height: 25,
                          //         fit: BoxFit.fill,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     //Navigator.push(context, MaterialPageRoute(builder: (context)=> PlanScree(changeTab),));
                          //     //Get.toNamed('/goal-screen');
                          //   },
                          //   child: Text(
                          //     context.translator.planTitle2,
                          //     //'Pagos',
                          //     style:
                          //         Theme.of(context).textTheme.bodyLarge!.copyWith(
                          //               fontSize: 14,
                          //               color: primaryColor,
                          //               fontWeight: FontWeight.w600,
                          //             ),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Gap(size.height * 0.02),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => FmsPdfScreen()),
                            );
                          },
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: primaryColor
                                        .withAlpha((0.22 * 255).toInt()),
                                    //primaryColor.withOpacity(0.2),
                                    spreadRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border:
                              Border.all(color: primaryColor, width: 0.5),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: primaryColor
                                        .withAlpha((0.25 * 255).toInt()),
                                    //primaryColor.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'DOCS',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.teal,
                                    child: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  title: Text(
                                    "FMS",
                                    //todo -------> change 5 : controller.nutritions!.nutritionDoc!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      String url =
                                          "https://firebasestorage.googleapis.com/v0/b/dev-develop-qzrx64.appspot.com/o/sp.pdf?alt=media&token=24264350-4d81-41ef-bfd8-7e3eeb2c0ac7";

                                      FileDownloader.downloadFile(
                                        url: url,
                                        //"https://sportsperformance.cl/image/nutrition/20241206164319.pdf",
                                        onDownloadCompleted: (value) async {
                                          snackbar(
                                            context: context,
                                            msg: "File Saved Successfully",
                                            title: 'Success',
                                          );
                                          myLog("path $value");
                                          // await OpenFile.open(value);
                                        },
                                      );
                                    },
                                    child: const Icon(
                                      Icons.download,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                        Gap(size.height * 0.032),
                        Table(
                          border: TableBorder.all(color: darkMode.value ? Colors.white70 : Colors.black87,borderRadius: BorderRadius.circular(8)),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FixedColumnWidth(135),
                            1: FixedColumnWidth(100),
                            2: FixedColumnWidth(100),
                            // 3: pw.FixedColumnWidth(75),
                          },
                          children: [
                            //todo ---------------------> Table Head
                            TableRow(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8),),
                                color: darkMode.value ? Colors.black54 : Colors.grey.shade500,
                              ),
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 4),
                                  child: Center(
                                    child: Text(
                                      "TEST",
                                      style: TextStyle(fontSize: size.width * 0.038),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "RAW SCORE",
                                    style: TextStyle(fontSize: size.width * 0.038),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "FINAL SCORE",
                                    style: TextStyle(fontSize: size.width * 0.038),
                                  ),
                                ),
                              ],
                            ),
                            ...List.generate(
                              testList.length,
                              (index) => buildTableRow(testList[index], index,size),
                            ),
                          ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs),
    );
  }
}

TableRow buildTableRow(String data, int index,Size size) {
  return TableRow(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 08, horizontal: 03),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            data,
            style: TextStyle(fontSize: size.width * 0.034),
          ),
        ),
      ),
      (index == 0 || index == 6 || index == 7 || index == 9)
          ? Center(
              child: Text("-"),
            )
          : Table(
              border: TableBorder.all(color: darkMode.value ? Colors.white70 : Colors.black87),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FixedColumnWidth(40),
                1: FixedColumnWidth(60),
                // 3: FixedColumnWidth(75),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Center(
                        child: Text("I",style: TextStyle(fontSize: size.width * 0.038),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Center(
                        child: Text("-"),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.5),
                      child: Center(
                        child: Text("D",style: TextStyle(fontSize: size.width * 0.038),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.5),
                      child: Center(
                        child: Text("-"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      Center(
        child: Text("-"),
      ),
    ],
  );
}