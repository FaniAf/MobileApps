import 'package:flutter/material.dart';
import 'package:laptopapi/classdata/classdata.dart';
import 'package:laptopapi/dataservice/dataservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Cdata> showData;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    showData = getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: FutureBuilder<Cdata>(
          future: showData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          NetworkImage(snapshot.data!.image.toString()),
                    ),
                    Text(
                      "${snapshot.data!.firstName} ${snapshot.data!.maidenName} ${snapshot.data!.lastName}",
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'SourceSansPro',
                          color: Colors.teal.shade100,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150,
                      child: Divider(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    InkWell(
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.people,
                            color: Colors.teal,
                          ),
                          title: Text(
                            snapshot.data!.username!,
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 20,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.phone,
                            color: Colors.teal,
                          ),
                          title: Text(
                            snapshot.data!.phone.toString(),
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 20,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.email,
                            color: Colors.teal,
                          ),
                          title: Text(
                            snapshot.data!.email.toString(),
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 20,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.teal,
                          ),
                          title: Text(
                            snapshot.data!.birthDate.toString(),
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 20,
                                color: Colors.teal.shade900),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
