class ActionDateModel {
  final String title;
  final String description;
  final DateTime begin;
  final DateTime end;
  final List<String> users;
  final List<String> dogs;

  ActionDateModel(
    this.title,
    this.description,
    this.begin,
    this.end,
    this.users,
    this.dogs
  );
}
