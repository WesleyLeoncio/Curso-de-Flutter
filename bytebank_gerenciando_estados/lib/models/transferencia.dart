class Transferencia {
  final double valor;
  final int nConta;

  Transferencia(this.nConta, this.valor);

  @override
  String toString() {
    return 'Transferencia{ nConta: $nConta, valor: $valor}';
  }
}