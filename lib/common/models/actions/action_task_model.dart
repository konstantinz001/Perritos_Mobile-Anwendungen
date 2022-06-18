class ActionTaskModel {
  final String actionID;
  final String emailID;
  final String title;
  final String description;
  final List<dynamic> users;
  final List<dynamic> dogs;

  ActionTaskModel(
    this.actionID,
    this.emailID,
    this.title,
    this.description,
    this.users,
    this.dogs
  );
}
