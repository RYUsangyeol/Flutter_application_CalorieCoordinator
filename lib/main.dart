import 'package:flutter/material.dart';
import 'package:flutter_application_1/calorieInfo.dart';
import 'sub/thirdPage.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';

// firtPage - 기본 정보
double height = 0;
String? sex;
String? activity_level;
double recommended_calories = 1;
// secondPage - 식사 정보
List<CalorieInfo>? list_cart = [];
double total_calories = 0;
double total_carbohydrate = 0;
double total_fat = 0;
double total_protein = 0;
double total_sugars = 0;
double total_natrium = 0;
// thirdPage - 영양 점수
int total_score = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<CalorieInfo> calorieInfoList = List.empty(growable: true);

  @override
  void initState() {
    // 컨트롤러 지정
    super.initState();
    controller = TabController(length: 3, vsync: this);

    DB.sort(
          (a, b) => a["식품명"]!.compareTo(b["식품명"]!),
    );

    for (int i = 0; i < DB.length; i++) {
      calorieInfoList.add(
        CalorieInfo(
          name: DB[i]["식품명"],
          calories: DB[i]["에너지"],
          carbohydrate: DB[i]["탄수화물"],
          protein: DB[i]["단백질"],
          fat: DB[i]["지방"],
          sugars: DB[i]["당류"],
          natrium: DB[i]["나트륨"],
        ),
      );
    }
  }

  @override
  void dispose() {git push origin main
    // 메모리 누수 방지
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 145, 89),
        title: const Center(
          child: Text(
            "Calorie Coordinator",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          const FirstApp(),
          SecondApp(list: calorieInfoList),
          const ThirdApp()
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const <Tab>[
          Tab(
            icon: Icon(
              Icons.person_outline,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.rice_bowl_outlined,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.analytics_outlined,
            ),
          ),
        ],
        indicatorColor: const Color.fromARGB(255, 86, 145, 89),
        unselectedLabelColor: Colors.grey,
        labelColor: const Color.fromARGB(255, 86, 145, 89),
      ),
    );
  }
}
