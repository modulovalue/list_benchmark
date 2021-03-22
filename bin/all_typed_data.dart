import 'dart:typed_data';

import 'package:list_benchmark/all.dart';

void main() {
  const data = CitiesTestDataImpl();
  for (final data in data.float64ListLongitudesDataSets()) {
    TypedDataBenchmarks(data)..printHeader()..runAll();
  }
}

class TypedDataBenchmarks {
  final Model<Float64List> model;
  const TypedDataBenchmarks(this.model);

  void printHeader() => print("=== Running: ${model.name} ${model.amount} ===");

  void runAll() => runAllTypedData(model.dataFactory);
}
