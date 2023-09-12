/// User data fields

class Users {
  final String firstName;
  final String lastName;
  final String email;
  final int contactNo;
  final String password;
  final String evcarId;
  final String evcarNumberPlate;
  final bool isProvider;

  Users(this.firstName, this.lastName, this.email, this.contactNo,
      this.password, this.evcarId, this.evcarNumberPlate, this.isProvider);
}
