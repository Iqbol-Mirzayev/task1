import 'package:flutter/material.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 310,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      ListTile(
                        leading: CircleAvatar(
                         minRadius: 50,
                         maxRadius: 50,
                      
                          // child: Image.network("https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80")
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
                        leading: Text(
                          "To'lov",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        trailing: Text(DateTime.now().toString()),
                      ),
                      TextField(
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Kerakli summani kiriting",
                            hintStyle: TextStyle(color: Colors.red.shade800)),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint("Bosilyapti");
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
                            child: Center(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
