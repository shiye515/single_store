# single_store

a simple store hold all values in a singleton, recommended for use with ChangeNotifier & AnimatedBuilder.

## Features

- its simple, only one class and one method
- save values without InheritedWidget, so it can be used anywhere(not only in widget) 
- with ChangeNotifier & AnimatedBuilder,the store can be reactive
- also can be used to save const value(String, List, Map...)

## Usage

```dart
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
```
