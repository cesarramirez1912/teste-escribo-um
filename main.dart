import 'dart:io';

Future<bool> validadorInteiroPositivo(int numero) async {
  return numero is int && numero > 0;
}

Future<int> valorInteiroPositivo(String numero) async {
  return int.parse(numero);
}

int somatorioTotal(int numeroInteiroPositivo) {
  int somatorio = 0;
  for (int i = 1; i <= numeroInteiroPositivo; i++) {
    if (i < numeroInteiroPositivo) {
      bool eDivisivelPorTres = i % 3 == 0;
      bool eDivisivelPorCinco = i % 5 == 0;

      if (eDivisivelPorTres || eDivisivelPorCinco) {
        somatorio += i;
      }
    }
  }
  return somatorio;
}

main() async {
  print("Informe um numero inteiro positivo: ");

  String valorDigitado = stdin.readLineSync()!;

  try {
    int numeroInteiroPositivo = await valorInteiroPositivo(valorDigitado);

    bool eInteiroPositivo =
        await validadorInteiroPositivo(numeroInteiroPositivo);

    if (eInteiroPositivo) {

      int somatorioFinal = somatorioTotal(numeroInteiroPositivo);
      print("O somatorio de todos os valores positivos divisives por 3 e 5: " +
          somatorioFinal.toString());

    } else {

      print("Numero nao e positivo");

    }
    
  } catch (e) {
    print("Valor nao e um numero inteiro");
  }
}
