class Repo {
  final int id;
  final String name;
  final String description;

  Repo(this.id, this.name, this.description) {
    if (id == null) {
      throw ArgumentError("id of Repo cannot be null. "
          "Received: '$id'");
    }
    if (name == null) {
      throw ArgumentError("name of Repo cannot be null. "
          "Received: '$name'");
    }
    if (description == null) {
      throw ArgumentError("description of Repo cannot be null. "
          "Received: '$description'");
    }
  }
}