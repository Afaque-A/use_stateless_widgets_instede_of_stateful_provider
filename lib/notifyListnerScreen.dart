import 'package:flutter/material.dart';

class Notifylistnerscreen extends StatelessWidget {
  Notifylistnerscreen({super.key});

  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> _tooler = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: _tooler,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _tooler.value,
                  decoration: InputDecoration(
                      hintText: 'password',
                      suffix: InkWell(
                          onTap: () {
                            _tooler.value = !_tooler.value;
                          },
                          child: Icon(_tooler.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility))),
                );
              }),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _count,
                builder: (context, value, child) {
                  return Center(
                      child: Text(
                    _count.value.toString(),
                    style: TextStyle(fontSize: 50),
                  ));
                }),
          ),
          // Text('data')
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _count.value++;
        print(_count.value.toString());
        Icon(Icons.refresh);
      }),
    );
  }
}
