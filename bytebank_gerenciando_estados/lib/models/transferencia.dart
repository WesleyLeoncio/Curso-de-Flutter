class Transferencia {
  final double valor;
  final int nConta;

  Transferencia(this.nConta, this.valor);

  String toStringValor(){
    return 'R\$: $valor';
  }

  String toStringConta(){
    return 'Conta: $nConta';
  }
}