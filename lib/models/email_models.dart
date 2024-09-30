class EmailModel {
  int id;
  String firstName, lastName, email, subject, description;
  bool read;
  String? imageUrl;
  
  EmailModel({
    required this.firstName,
    required this.lastName,
    required this.subject,
    required this.email,
    required this.description,
    required this.id,
    required this.read,
     this.imageUrl,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      id: json['id'],
      firstName: json['firstName'],
      subject: json['subject'],
      lastName: json['lastName'],
      email: json['email'],
      read:json['read'],
      description:json['description'],
      imageUrl:json['imageUrl']
      
    );
  }


}