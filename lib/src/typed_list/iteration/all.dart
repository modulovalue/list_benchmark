import 'dart:typed_data';

import 'package:benchmark_harness/benchmark_harness.dart';

void runAllTypedData(Float64List Function() factory) {
  _ExtractOneByOne(factory()).report();
  _ExtractAllViaForEach(factory()).report();
}

class _ExtractOneByOne extends BenchmarkBase {
  final Float64List sourceList;

  const _ExtractOneByOne(this.sourceList) : super('Float64List: extract one by one');

  @override
  void run() {
    // ignore: unused_local_variable
    var sum = 0.0;
    final length = sourceList.length;
    for (int i = 0; i < length; i++) {
      sum += sourceList[i];
    }
  }
}

class _ExtractAllViaForEach extends BenchmarkBase {
  final Float64List sourceList;

  const _ExtractAllViaForEach(this.sourceList) : super('Float64List: extract all via forEach');

  @override
  void run() {
    // ignore: unused_local_variable
    var sum = 0.0;
    sourceList.forEach((value) {
      sum += value;
    });
  }
}
