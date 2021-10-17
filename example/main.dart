import 'package:flutter/material.dart';
import 'package:single_store/single_store.dart';

void main() async {
  runApp(MaterialApp(
    home: Example(),
  ));
}

class MyController with ChangeNotifier {
  int count = 0;

  MyController() {
    count += 1;
  }
}

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);
  final ctrl = SingleStore().get(() => MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: ctrl,
        builder: (ctx, _) {
          return Center(
            child: Text('${ctrl.count}'),
          );
        },
      ),
    );
  }
}
