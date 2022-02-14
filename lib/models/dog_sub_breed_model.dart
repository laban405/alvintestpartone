class DogSubBreedModel {
  static const NAME = "message";

  late String name;

  DogSubBreedModel({
    required this.name,
  });

  factory DogSubBreedModel.fromJson(snapshot) {
    return DogSubBreedModel(name: snapshot[NAME]);
  }
}