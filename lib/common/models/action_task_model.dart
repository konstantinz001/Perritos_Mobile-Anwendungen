class ActionTaskModel {
  final String actionID;
  final String emailID;
  final String title;
  final String description;
  final List<String> users;
  final List<String> dogs;

  ActionTaskModel(
    this.actionID,
    this.emailID,
    this.title,
    this.description,
    this.users,
    this.dogs
  );
}
