import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Map<String, dynamic> data;
  const Details({Key? key, required this.data}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Details', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text('Humidity'),
            title: Text('${widget.data['main']['humidity']}'),
          ),
          ListTile(
            leading: Text('Pressure'),
            title: Text('${widget.data['main']['pressure']}'),
          )
        ],
      ),
    );
  }
}
