import 'dart:typed_data';

abstract class CitiesTestData {
  List<String> cities1();
  List<String> cities10();
  List<String> cities100();
  List<String> cities1000();
  List<String> cities10000();
  List<String> cities100000();
  List<double> longitudes1();
  List<double> longitudes10();
  List<double> longitudes100();
  List<double> longitudes1000();
  List<double> longitudes10000();
  List<double> longitudes100000();
  List<int> integerLongitudes1();
  List<int> integerLongitudes10();
  List<int> integerLongitudes100();
  List<int> integerLongitudes1000();
  List<int> integerLongitudes10000();
  List<int> integerLongitudes100000();
}

class Model<T> {
  final int amount;
  final String name;
  final T Function() dataFactory;

  const Model(this.amount, this.name, this.dataFactory);
}

extension CitiesTestDataExtension on CitiesTestData {
  List<Model<List<int>>> integerLongitudesDataSets() => [
    Model(1, "integer longitudes", integerLongitudes1),
    Model(10, "integer longitudes", integerLongitudes10),
    Model(100, "integer longitudes", integerLongitudes100),
    Model(1000, "integer longitudes", integerLongitudes1000),
    Model(10000, "integer longitudes", integerLongitudes10000),
    Model(100000, "integer longitudes", integerLongitudes100000),
  ];
  List<Model<List<double>>> doubleLongitudesDataSets() => [
    Model(1, "double longitudes", longitudes1),
    Model(10, "double longitudes", longitudes10),
    Model(100, "double longitudes", longitudes100),
    Model(1000, "double longitudes", longitudes1000),
    Model(10000, "double longitudes", longitudes10000),
    Model(100000, "double longitudes", longitudes100000),
  ];
  List<Model<Float64List>> float64ListLongitudesDataSets() => [
    Model(1, "Float64List longitudes", () => Float64List.fromList(longitudes1())),
    Model(10, "Float64List longitudes", () => Float64List.fromList(longitudes10())),
    Model(100, "Float64List longitudes", () => Float64List.fromList(longitudes100())),
    Model(1000, "Float64List longitudes", () => Float64List.fromList(longitudes1000())),
    Model(10000, "Float64List longitudes", () => Float64List.fromList(longitudes10000())),
    Model(100000, "Float64List longitudes", () => Float64List.fromList(longitudes100000())),
    Model(1000000, "Float64List longitudes", () => Float64List.fromList(longitudes100000().expand((a) => [a, a, a, a, a, a, a, a, a, a]).toList())),
  ];
  List<Model<List<String>>> citiesDataSets() => [
    Model(1, "cities", cities1),
    Model(10, "cities", cities10),
    Model(100, "cities", cities100),
    Model(1000, "cities", cities1000),
    Model(10000, "cities", cities10000),
    Model(100000, "cities", cities100000),
  ];
  List<Model<List<dynamic>>> dynamicCitiesDataSets() => [
    Model<List<dynamic>>(1, "dynamic cities", () => cities1().cast<dynamic>()),
    Model<List<dynamic>>(10, "dynamic cities", () => cities10().cast<dynamic>()),
    Model<List<dynamic>>(100, "dynamic cities", () => cities100().cast<dynamic>()),
    Model<List<dynamic>>(1000, "dynamic cities", () => cities1000().cast<dynamic>()),
    Model<List<dynamic>>(10000, "dynamic cities", () => cities10000().cast<dynamic>()),
    Model<List<dynamic>>(100000, "dynamic cities", () => cities100000().cast<dynamic>()),
  ];
}
