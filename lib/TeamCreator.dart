import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class teamCreator extends StatefulWidget {
  const teamCreator({Key? key}) : super(key: key);

  @override
  teamCreatorState createState() => teamCreatorState();
}

class teamCreatorState extends State<teamCreator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Creator'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un nombre a tu equipo';
                    }
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingresa un nombre a tu equipo';
                    }
                  },
                ),
              ),
            ]),
          ),
          Expanded(
            flex: 13,
            child: Column(children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('container');
                    },
                    child: const Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('container');
                    },
                    child: const Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Row(children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('container');
                    },
                    child: const Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('container');
                    },
                    child: const Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Row(children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('container');
                    },
                    child: const Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      print('container');
                    },
                    child: const Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
