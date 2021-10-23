import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: MyPage(),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late GetSocket socket;

  @override
  void initState() {
    print('init');
    socket = GetSocket('http://localhost:8084/socket');

    socket.onOpen(() {
      print('onOpen');
    });

    socket.onError((p0) {
      print(p0);
    });

    socket.onMessage((val) {
      print(val);
    });

    socket.onClose((p0) {
      print(p0.reason); 
      print('onClose $p0');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () async {
          print(await socket.connect());
        },
        icon: Icon(Icons.connect_without_contact_rounded),
        label: Text('Connncet!'),
      ),
    );
  }
}
