class Contact {
   int id;
   String name;
   int nConta;

  Contact(this.id, this.name, this.nConta);

  @override
  String toString() {
    return 'Contact{name: $name, nConta: $nConta}';
  }
}