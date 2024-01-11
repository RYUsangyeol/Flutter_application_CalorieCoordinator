import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class ThirdApp extends StatelessWidget {
  List<List<int>> getscore() {
    List<int> scores = [0, 0, 0, 0, 0, 0];
    List<double> elements = [
      total_calories / recommended_calories * 100,
      total_carbohydrate / 324 * 100,
      total_fat / 54 * 100,
      total_protein / 55 * 100,
      total_sugars,
      total_natrium / 2400 * 100,
    ];
    int index = -1;
    for (var element in elements) {
      index++;
      if (element < 15) {
        scores[index] += 80;
      } else if (element < 30) {
        scores[index] += 100;
      } else if (element < 40) {
        scores[index] += 80;
      } else if (element < 55) {
        scores[index] += 60;
      } else if (element < 70) {
        scores[index] += 40;
      } else if (element < 85) {
        scores[index] += 20;
      }
    }
    int sumScore = 0;
    List<int> weeks = [];
    for (int i = 0; i < 6; i++) {
      sumScore += scores[i];
      if (scores[i] <= 60) {
        weeks.add(i);
      }
    }
    double averageScore = sumScore / 6;
    int grade = 3;
    if (averageScore >= 80) {
      grade = 1;
    } else if (averageScore >= 60) {
      grade = 2;
    }
    return [
      [averageScore.toInt(), grade],
      weeks
    ];
  }

  String getweeks() {
    List<String> elements = [
      "calories",
      "carbohydrate",
      "fat",
      "protein",
      "sugars",
      "natrium"
    ];
    String weeks = '';
    if (getscore()[1].isNotEmpty) {
      weeks += 'Reduce ';
      for (int i = 0; i < getscore()[1].length; i++) {
        if (i + 1 == getscore()[1].length) {
          weeks += elements[getscore()[1][i]];
        } else {
          weeks += elements[getscore()[1][i]];
          weeks += ', ';
        }
      }
    } else {
      weeks += "You're doing great!";
    }
    return weeks;
  }

  const ThirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 47),
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
                          width: 90,
                        ),
                        Text(
                          "Report",
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
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 86, 145, 89),
                        width: 2,
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 221, 235, 205),
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "1. Calories : ${total_calories.toStringAsFixed(0)} kcal -  ",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Text(
                                          "${(total_calories / recommended_calories * 100).toStringAsFixed(2)}%",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 86, 145, 89),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "2. Carbohydrate : ${total_carbohydrate.toStringAsFixed(0)} g -  ",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w200)),
                                      Text(
                                          "${(total_carbohydrate / 324 * 100).toStringAsFixed(2)}%",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 86, 145, 89),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "3. Fat : ${total_fat.toStringAsFixed(0)} g -  ",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w200)),
                                      Text(
                                          "${(total_fat / 54 * 100).toStringAsFixed(2)}%",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 86, 145, 89),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "4. Protein : ${total_protein.toStringAsFixed(0)} g -  ",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w200)),
                                      Text(
                                        "${(total_protein / 55 * 100).toStringAsFixed(2)}%",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color:
                                          Color.fromARGB(255, 86, 145, 89),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "5. Sugars : ${total_sugars.toStringAsFixed(0)} g -  ",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w200)),
                                      Text(
                                        "${(total_sugars).toStringAsFixed(2)}%",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color:
                                          Color.fromARGB(255, 86, 145, 89),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "6. Natrium : ${total_natrium.toStringAsFixed(0)} mg -  ",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Text(
                                          "${(total_natrium / 2400 * 100).toStringAsFixed(2)}%",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 86, 145, 89),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            getscore()[0][1] == 1
                                ? Icons.sentiment_satisfied_alt_rounded
                                : getscore()[0][1] == 2
                                ? Icons.sentiment_neutral_rounded
                                : Icons.sentiment_dissatisfied_rounded,
                            color: getscore()[0][1] == 1
                                ? Colors.lightGreen
                                : getscore()[0][1] == 2
                                ? Colors.amber
                                : Colors.red,
                            size: 80,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "${getscore()[0][0]}points",
                            style: const TextStyle(
                                fontSize: 50,
                                color: Color.fromARGB(255, 86, 145, 89),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lightbulb,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Tip : ${getweeks()}",style: TextStyle(fontSize: 12,)),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
