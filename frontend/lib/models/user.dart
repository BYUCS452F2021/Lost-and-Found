class User {
  final String id;
  final bool isStudent;
  final String name;
  final String phoneNumber;
  final String email;
  final int numFound;
  final int numRequested;

  User(this.id, this.isStudent, this.name, this.phoneNumber, this.email, this.numFound, this.numRequested);

  User.fromJson(Map<String, dynamic> json) 
    : id = json['byu_id'],
      isStudent = json['is_student'] == 1 ? true : false,
      name = json['name'],
      phoneNumber = json['phone_number'],
      email = json['email'],
      numFound = json['num_found'],
      numRequested = json['num_requested'];

}
