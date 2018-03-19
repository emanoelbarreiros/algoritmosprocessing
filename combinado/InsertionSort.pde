class InsertionSort extends Algoritmo {
  
  int j = 1;
  
  public InsertionSort(int[] valores){
    super(valores);
  }
  
  public void passo() {
    int chave = valores[j];
    int i = j - 1;
    while (i >= 0 && valores[i] > chave) {
      valores[i+1] = valores[i];
      i = i - 1;
    }
    valores[i+1] = chave;
    //controlando o laço
    j++;
    if (j >= valores.length){
      j = 1;
    }
  }
}