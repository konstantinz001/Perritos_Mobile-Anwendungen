class ActionWalkingModel {
  final String actionID;
  final String emailID;
  final DateTime begin;
  final DateTime end;
  final List<dynamic> users;
  final List<dynamic> dogs;

  ActionWalkingModel(
    this.actionID,
    this.emailID,
    this.begin,
    this.end,
    this.users,
    this.dogs
  );
}
