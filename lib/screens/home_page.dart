import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taska/core/constants.dart';
import 'package:taska/screens/widgets/bottom_sheet.dart';
import 'package:taska/screens/qr_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                height: 196,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: MyColors.cont1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset("assets/Phone.png"),
                        Column(
                          children: [
                            Image.asset("assets/CTA.png"),
                            SizedBox(height: 30),
                            MaterialButton(
                              shape: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  )),
                              color: MyColors.backColor,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QRViewExample(),
                                    ));
                              },
                              child: const Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Scaner qilish",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Container(
                height: 144,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: MyColors.cont2,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Buyurtma olish",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Mijoz bergan buyurtmalarni\n qulay tarzda digital\n yozib oling",
                            maxLines: 3,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Image.asset("assets/Rectangle.png"),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QRViewExample(),
                                ));
                            debugPrint("Bosildi ");
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 40,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: BottomSheetExample(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.refresh),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.black,
      onTap: (int index) {},
    );
  }

  AppBar myAppBar() {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Bosh sahifa",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
