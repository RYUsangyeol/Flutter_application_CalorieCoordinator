import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class FirstApp extends StatefulWidget {
  const FirstApp({super.key});

  @override
  State<FirstApp> createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<FirstApp> {
  TextEditingController value1 = TextEditingController();
  bool height_pressed = false;
  final sexlist = ["MALE", "FEMALE"];
  bool sex_pressed = false;
  final levellist = ["LOW", "HIGH"];
  bool level_pressed = false;

  void Save() {
    setState(
          () {
        height_pressed = true;
        height = (value1.value.text == '')
            ? height
            : double.parse(value1.value.text);
        double recommendedWeight = height * height / 10000;
        if (sex == "MALE") {
          if (activity_level == "LOW") {
            recommended_calories = recommendedWeight * 22 * 30;
          } else {
            recommended_calories = recommendedWeight * 22 * 35;
          }
        } else {
          if (activity_level == "LOW") {
            recommended_calories = recommendedWeight * 21 * 30;
          } else {
            recommended_calories = recommendedWeight * 21 * 35;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 86, 145, 89),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 15,
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              "Information",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 86, 145, 89),
                                width: 2,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                const Text('height(cm)'),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  style:
                                  const TextStyle(color: Colors.lightGreen),
                                  decoration: InputDecoration(
                                      hintText: (height != 0)
                                          ? '$height'
                                          : 'enter your height...',
                                      hintStyle: TextStyle(
                                        color: height_pressed
                                            ? Colors.lightGreen
                                            : Colors.grey,
                                        fontSize: height_pressed ? 15 : 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      )),
                                  keyboardType: TextInputType.number,
                                  controller: value1,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Text('sex'),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 130),
                                    child: DropdownButton(
                                        iconSize: 0.0,
                                        underline: const SizedBox(),
                                        hint: const Text(
                                          "choose your sex...",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        style: TextStyle(
                                          color: sex_pressed
                                              ? Colors.lightGreen
                                              : Colors.grey,
                                          fontSize: 16,
                                        ),
                                        value: sex,
                                        items: sexlist
                                            .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                            )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            sex_pressed = true;
                                            sex = value!;
                                          });
                                        }),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Text('activity level'),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 128),
                                    child: DropdownButton(
                                        iconSize: 0.0,
                                        underline: const SizedBox(),
                                        hint: const Text(
                                          "choose your level...",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        style: TextStyle(
                                          color: level_pressed
                                              ? Colors.lightGreen
                                              : Colors.grey,
                                          fontSize: 16,
                                        ),
                                        value: activity_level,
                                        items: levellist
                                            .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e,
                                            )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            level_pressed = true;
                                            activity_level = value!;
                                          });
                                        }),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 221, 235, 205),
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "recommended calories",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          (recommended_calories == 1)
                                              ? "00.00 (kcal)"
                                              : "${recommended_calories.toStringAsFixed(2)}(kcal)",
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 86, 145, 89)),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 86, 145, 89),
        onPressed: Save,
        tooltip: 'save',
        child: const Icon(
          Icons.data_saver_on,
        ),
      ),
    );
  }
}
