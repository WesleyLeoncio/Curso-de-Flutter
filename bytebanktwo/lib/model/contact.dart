class Contact {
  int id;
  String name;
  int accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  Contact.fromJson(Map<String, dynamic> json)
      : id = 0,
        name = json['name'],
        accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'accountNumber': accountNumber};

  @override
  String toString() {
    return 'Contact{name: $name, nConta: $accountNumber}';
  }
}
 