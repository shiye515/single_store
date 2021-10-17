library single_store;

typedef ValueBuilder<T> = T Function();

class SingleStore {
  SingleStore._internal();

  factory SingleStore() => _instance;

  static late final SingleStore _instance = SingleStore._internal();
  List list = [];
  T get<T>(ValueBuilder<T> builder) {
    T? instance;
    if (list.isNotEmpty) {
      instance = list.firstWhere(
        (element) => element.runtimeType == T,
        orElse: () {},
      );
    }
    if (instance != null) {
      return instance;
    }
    instance = builder();
    list.add(instance);
    return instance!;
  }
}
