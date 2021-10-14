class Contact {
  final int id;
  final String name;
  final int nConta;


  Contact(this.id, this.name, this.nConta);

  @override
  String toString() {
    return 'Contact{name: $name, nConta: $nConta}';
  }
}