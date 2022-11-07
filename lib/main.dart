import 'dart:convert';

import 'package:api_exp/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const api_key = 'b83f41d75bdf7690a852f05f98d08c57';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? weatherData;
  String? query;
  TextEditingController searchController = TextEditingController();



  void getData() async {
    query = searchController.text;
    Uri temp = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=b83f41d75bdf7690a852f05f98d08c57&units=metric');
    http.Response x = await http.get(temp);
    setState(() {
      weatherData = jsonDecode(x.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => getData(),
        child: Icon(Icons.search),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'My Weather App',
            style: TextStyle(color: Colors.black),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            weatherData==null ? Container():
            Text(
              '${weatherData!['main']['temp']} C',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
                controller: searchController,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => Details(
                                data: weatherData!,
                              ))));
                },
                child: Text('Details'))
          ],
        ),
      ),
    );
  }
}
