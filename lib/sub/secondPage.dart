import 'package:flutter/material.dart';
import 'package:flutter_application_1/calorieInfo.dart';
import 'package:flutter_application_1/main.dart';

class SecondApp extends StatefulWidget {
  final List<CalorieInfo>? list;
  const SecondApp({Key? key, this.list}) : super(key: key);

  @override
  State<SecondApp> createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  void Up(int num) {
    total_calories += double.parse(widget.list![num].calories!);
    total_carbohydrate += double.parse(widget.list![num].carbohydrate!);
    total_fat += double.parse(widget.list![num].fat!);
    total_protein += double.parse(widget.list![num].protein!);
    total_sugars += double.parse(widget.list![num].sugars!);
    total_natrium += double.parse(widget.list![num].natrium!);
    widget.list![num].number += 1;
  }

  void Down(int num) {
    if (widget.list![num].number > 0) {
      total_calories -= double.parse(widget.list![num].calories!);
      total_carbohydrate -= double.parse(widget.list![num].carbohydrate!);
      total_fat -= double.parse(widget.list![num].fat!);
      total_protein -= double.parse(widget.list![num].protein!);
      total_sugars -= double.parse(widget.list![num].sugars!);
      total_natrium -= double.parse(widget.list![num].natrium!);
      widget.list![num].number -= 1;
    }
  }

  void CartUp(int num) {
    // widget.list와 list_cart의 index가 다르므로 새로운 함수로 반영
    for (int i = 0; i < widget.list!.length; i++) {
      if (widget.list![i].name == list_cart![num].name) {
        Up(i);
      }
    }
  }

  void CartDown(int num) {
    for (int i = 0; i < widget.list!.length; i++) {
      if (widget.list![i].name == list_cart![num].name) {
        Down(i);
      }
    }
  }

  void Reset() {
    total_calories = 0;
    total_carbohydrate = 0;
    total_fat = 0;
    total_protein = 0;
    total_sugars = 0;
    total_natrium = 0;
    setState(() {
      for (int i = 0; i < widget.list!.length; i++) {
        widget.list![i].number = 0;
      }
    });
  }

  void Cart() {
    setState(() {
      List<CalorieInfo> listCart1 = [];
      for (int i = 0; i < widget.list!.length; i++) {
        if (widget.list![i].number > 0) {
          listCart1.add(widget.list![i]);
        }
      }
      list_cart = listCart1;
      setState(() {
        list_cart!.sort((b, a) => a.number.compareTo(b.number));
      });
    });
  }

  void Sort() {
    setState(() {
      widget.list!.sort((a, b) => a.name!.compareTo(b.name!));
    });
  }

  void LikedSort() {
    setState(() {
      widget.list!
          .sort((b, a) => a.isLiked.toString().compareTo(b.isLiked.toString()));
    });
  }

  int Total() {
    int sum = 0;
    for (int i = 0; i < widget.list!.length; i++) {
      sum += widget.list![i].number;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 47),
              child: Container(
                height: 50,
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
                        width: 80,
                      ),
                      Text(
                        "Selection",
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
              child: SizedBox(
                height: 640,
                child: Center(
                  child: ListView.builder(
                      itemBuilder: (context, position) {
                        return GestureDetector(
                          child: Card(
                            elevation: 3,
                            child: Container(
                              color: widget.list![position].isPressed
                                  ? const Color.fromARGB(255, 221, 235, 205)
                                  : Colors.white,
                              child: ListTile(
                                subtitle: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.list![position].name!,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color:
                                        (widget.list![position].number == 0)
                                            ? Colors.grey
                                            : const Color.fromARGB(
                                            163, 130, 176, 78),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.list![position].number}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: (widget.list![position]
                                                .number ==
                                                0)
                                                ? Colors.grey
                                                : const Color.fromARGB(
                                                163, 130, 176, 78),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                              Icons.add_circle_outline),
                                          onPressed: () {
                                            setState(
                                                  () {
                                                Up(position);
                                              },
                                            );
                                          },
                                        ),

                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                          onPressed: () {
                                            setState(
                                                  () {
                                                Down(position);
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                trailing: IconButton(
                                  color: widget.list![position].isLiked
                                      ? const Color.fromARGB(255, 226, 162, 158)
                                      : Colors.grey,
                                  icon: Icon(widget.list![position].isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border),
                                  onPressed: () {
                                    setState(
                                          () {
                                        widget.list![position].isLiked =
                                        !widget.list![position].isLiked;
                                      },
                                    );
                                    Sort();
                                    LikedSort();
                                  },
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              widget.list![position].isPressed = true;
                            });
                            AlertDialog dialog = AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor:
                              const Color.fromARGB(255, 221, 235, 205),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.energy_savings_leaf,
                                    color: Color.fromARGB(255, 86, 145, 89),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "nutrient ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text("(${widget.list![position].name})",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                              content: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        "- Calories : ${widget.list![position].calories}kcal"),
                                    Text(
                                        "- Carbohydrate : ${widget.list![position].carbohydrate}g"),
                                    Text(
                                        "- Fat : ${widget.list![position].fat}g"),
                                    Text(
                                        "- Protein : ${widget.list![position].protein}g"),
                                    Text(
                                        "- Sugars : ${widget.list![position].sugars}g"),
                                    Text(
                                        "- Natrium : ${widget.list![position].natrium}mg"),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            widget.list![position].isPressed =
                                            false;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color:
                                          Color.fromARGB(255, 86, 145, 89),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );

                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => dialog);
                          },
                        );
                      },
                      itemCount: widget.list!.length),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "cart",
            backgroundColor: const Color.fromARGB(255, 86, 145, 89),
            onPressed: () {
              Cart();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: const Color.fromARGB(255, 86, 145, 89),
                        title: const Text("MY CART"),
                        centerTitle: true,
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Container(
                              height: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:
                                  const Color.fromARGB(255, 221, 235, 205)),
                              child: ListView.builder(
                                  itemCount: list_cart!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 35,
                                      ),
                                      child: Card(
                                        elevation: 0,
                                        color: const Color.fromARGB(
                                            255, 221, 235, 205),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(50)),
                                        child: ListTile(
                                          subtitle: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.circle_outlined,
                                                    size: 10,
                                                    color: Color.fromARGB(
                                                        255, 86, 145, 89),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    list_cart![index].name!,
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: Color.fromARGB(
                                                          255, 86, 145, 89),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "${list_cart![index].number} set",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 86, 145, 89),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Text(
                              'Total :  ${Total()} sets',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            tooltip: 'cart',
            child: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: 'reset',
            backgroundColor: const Color.fromARGB(255, 86, 145, 89),
            onPressed: Reset,
            tooltip: 'reset',
            child: const Icon(
              Icons.refresh_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
