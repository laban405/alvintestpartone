class DogBreedModel {
  static const NAME = "message";

  late String name;

  DogBreedModel({
    required this.name,
  });

  factory DogBreedModel.fromJson(snapshot) {
    return DogBreedModel(name: snapshot[NAME]);
  }
}
