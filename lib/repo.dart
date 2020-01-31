class Repo {
  final int id;
  final String name;
  final String description;
  final String language;
  final int stargazersCount;
  final int forksCount;

  Repo(this.id, this.name, this.description, this.language, this.stargazersCount, this.forksCount) {
    if (id == null) {
      throw ArgumentError("id of Repo cannot be null. "
          "Received: '$id'");
    }
    if (name == null) {
      throw ArgumentError("name of Repo cannot be null. "
          "Received: '$name'");
    }
  }
}