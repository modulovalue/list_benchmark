import 'package:benchmark_harness/benchmark_harness.dart';

void runAllCloning<T>(List<T> Function() factory) {
  _List_from(factory()).report();
  _List_of(factory()).report();
  _List_toList_fixed(factory()).report();
  _List_toList_growable(factory()).report();
  _List_toList_default(factory()).report();
  _List_generate_element_at(factory()).report();
  _List_generate_operator(factory()).report();
  _List_spread(factory()).report();
  _Add_into_list_literal(factory()).report();
  _Put_into_filled_nullable_then_cast<T>(factory()).report();
}

class _Add_into_list_literal<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _Add_into_list_literal(this.sourceList) : super('Cloning: for, add into list literal');

  @override
  void run() {
    final list = <T>[];
    for (int i = 0; i < sourceList.length; i++) {
      list.add(sourceList[i]);
    }
  }
}

class _Put_into_filled_nullable_then_cast<T> extends BenchmarkBase {
  final List<T> sourceList;

  _Put_into_filled_nullable_then_cast(this.sourceList) : super('Cloning: for, put into filled nullable via [], cast');

  List<T> _list = [];

  @override
  void run() {
    final list = List<T?>.filled(sourceList.length, null);
    for (int i = 0; i < sourceList.length; i++) {
      list[i] = sourceList[i];
    }
    // ignore: unused_local_variable
    _list = list.cast<T>();
  }
}

class _List_from<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _List_from(this.sourceList) : super('Cloning: List.from');

  @override
  void run() => List<T>.from(sourceList);
}

class _List_generate_element_at<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _List_generate_element_at(this.sourceList) : super('Cloning: List.generate via elementAt');

  @override
  void run() => List.generate(sourceList.length, sourceList.elementAt);
}

class _List_generate_operator<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _List_generate_operator(this.sourceList) : super('Cloning: List.generate via []');

  @override
  void run() => List.generate(sourceList.length, (a) => sourceList[a]);
}

class _List_of<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _List_of(this.sourceList) : super('Cloning: List.of');

  @override
  void run() => List<T>.of(sourceList);
}

class _List_spread<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _List_spread(this.sourceList) : super('Cloning: List spread ([...list])');

  @override
  void run() => [...sourceList];
}

class _List_toList_fixed<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _List_toList_fixed(this.sourceList) : super('Cloning: List.toList(growable: false))');

  @override
  void run() => sourceList.toList(growable: false);
}

class _List_toList_default<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _List_toList_default(this.sourceList) : super('Cloning: List.toList(growable: default (true))');

  @override
  void run() => sourceList.toList();
}

class _List_toList_growable<T> extends BenchmarkBase {
  final List<T> sourceList;

  const _List_toList_growable(this.sourceList) : super('Cloning: List.toList(growable: true)');

  @override
  void run() => sourceList.toList(growable: true);
}
