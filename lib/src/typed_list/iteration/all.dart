import 'dart:typed_data';

import 'package:benchmark_harness/benchmark_harness.dart';

void runAllTypedData(Float64List Function() factory) {
  _ExtractOneByOne(factory()).report();
  _ExtractAllViaForEach(factory()).report();
}

class _ExtractOneByOne extends BenchmarkBase {
  final Float64List sourceList;

  const _ExtractOneByOne(this.sourceList) : super('Cloning: extract one by one');

  @override
  void run() {
    // ignore: unused_local_variable
    double start = 0;
    for (int i = 0; i < sourceList.length; i++) {
      start += sourceList[i];
    }

  }
}

class _ExtractAllViaForEach extends BenchmarkBase {
  final Float64List sourceList;

  const _ExtractAllViaForEach(this.sourceList) : super('Cloning: extract all via for each');

  @override
  void run() {
    // ignore: unused_local_variable
    double start = 0;
    sourceList.forEach((element) {
      start += element;
    });
  }
}
