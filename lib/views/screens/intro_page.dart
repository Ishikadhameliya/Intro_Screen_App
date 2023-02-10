import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  State<intro> createState() => _introState();
}

int initvalue = 0;
bool isskips = false;
TextStyle text = const TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
TextStyle intros = const TextStyle(fontWeight: FontWeight.w400, fontSize: 20);

class _introState extends State<intro> {
  @override
  void initState() {
    super.initState();
    initvalue = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: _height * 0.15),
            IndexedStack(
              index: initvalue,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Introduction 1",
                      style: text,
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisi nulla purus neque\n quisque dictum dui. Accumsan \nfames adipiscing.",
                        style: intros,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(radius: 10),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Introduction 2",
                      style: text,
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisi nulla purus neque\n quisque dictum dui. Accumsan \nfames adipiscing.",
                        style: intros,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Introduction 3",
                      style: text,
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisi nulla purus neque\n quisque dictum dui. Accumsan \nfames adipiscing.",
                        style: intros,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Text("Explore the app", style: text),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisi nulla purus neque\n quisque dictum dui. Accumsan \nfames adipiscing.",
                        style: intros,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 10),
                        CircleAvatar(radius: 10),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            (initvalue == 3)
                ? SizedBox(
              width: _width * 0.9,
              height: _height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  setState(() async {
                    SharedPreferences pres =
                    await SharedPreferences.getInstance();
                    pres.setBool('isskips', true);

                    Navigator.of(context).pushReplacementNamed('/');
                  });
                },
                child: const Text("Get Started"),
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    onPressed: () {
                      setState(() async {
                        initvalue = 3;
                      });
                    },
                    child: const Text("SKIP")),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (initvalue < 3) {
                          initvalue++;
                        }
                      });
                    },
                    child: const Text("NEXT"))
              ],
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}