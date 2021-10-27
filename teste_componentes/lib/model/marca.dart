
class Marca {
  final int id;
  final String nomeMarca;

  Marca(this.id, this.nomeMarca);

  Marca.fromJson(Map<String, dynamic> json)
      : id = 0,
        nomeMarca = json['nomeMarca'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'nomeMarca': nomeMarca,
      };

  @override
  String toString() {
    return 'Marca{id: $id, nomeMarca: $nomeMarca}';
  }
}
