import 'package:flutter/material.dart';
import 'package:taska/core/constants.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    color: Colors.white),
                height: 310,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 170),
                      child:
                          Divider(color: Colors.black, height: 2, thickness: 3),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        minRadius: 40,
                        maxRadius: 40,
                        child: Image.asset("assets/profile_icon.png"),
                      ),
                      title: Text(
                        "Bobobek Turdiyev",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                      subtitle: Text(
                        "+998 66 230 00 15",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    ListTile(
                      leading: const Text(
                        "To'lov",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(DateTime.now().toIso8601String()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 100, left: 20),
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          focusColor: MyColors.colorEF476F,
                          
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.colorEF476F, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Kerakli summani kiriting ...",
                          hintStyle: TextStyle(color: MyColors.colorEF476F),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint("Pressed");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Center(
                            child: Text(
                              "Tasdiqlash",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
