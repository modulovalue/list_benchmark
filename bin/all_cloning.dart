import 'package:list_benchmark/src/*.dart';

void main() {
  const data = CitiesTestDataImpl();
  for (final data in data.dynamicCitiesDataSets()) {
    CloningBenchmarks<dynamic>(data)..printHeader()..runAll();
  }
  for (final data in data.citiesDataSets()) {
    CloningBenchmarks(data)..printHeader()..runAll();
  }
  for (final data in data.integerLongitudesDataSets()) {
    CloningBenchmarks(data)..printHeader()..runAll();
  }
  for (final data in data.doubleLongitudesDataSets()) {
    CloningBenchmarks(data)..printHeader()..runAll();
  }
}

class CloningBenchmarks<T> {
  final Model<List<T>> model;
  const CloningBenchmarks(this.model);

  void printHeader() => print("=== Running: ${model.name} ${model.amount} ===");

  void runAll() => runAllCloning(model.dataFactory);
}
