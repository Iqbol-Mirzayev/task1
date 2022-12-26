import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taska/core/constants.dart';
import 'package:taska/cubit/cubit/qr_cubit.dart';
import 'package:taska/screens/qr_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;
  // final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      appBar: myAppBar(),
      body: BlocConsumer<QrCubit, QrState>(
        listener: (context, state) {
          if (state is QrSuccess) {
            showModalBottomSheet<void>(
              // isDismissible: false,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      color: Colors.white),
                  height: 310,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 170),
                        child: Divider(
                            color: Colors.black, height: 2, thickness: 3),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          minRadius: 40,
                          maxRadius: 40,
                          child: Image.asset("assets/profile_icon.png"),
                        ),
                        title: const Text(
                          "Bobobek Turdiyev",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                        ),
                        subtitle: const Text(
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
                              borderSide: BorderSide(
                                  color: MyColors.colorEF476F,
                                  style: BorderStyle.solid),
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
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
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
                            const SizedBox(width: 20),
                            Image.asset("assets/Phone.png"),
                            Column(
                              children: [
                                Image.asset("assets/CTA.png"),
                                const SizedBox(height: 30),
                                MaterialButton(
                                  shape: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      )),
                                  color: MyColors.backColor,
                                  onPressed: () {
                                    context
                                        .read<QrCubit>()
                                        .changeState(QrOpen());
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const QRViewExample()));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
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
                  const SizedBox(height: 32),
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
                                context.read<QrCubit>().changeState(QrOpen());
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const QRViewExample()));
                                debugPrint("Bosildi ");
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                size: 35,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
