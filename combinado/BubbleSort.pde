class BubbleSort extends Algoritmo{
  
  public BubbleSort(int[] valores, combinado principal){
    super(valores, principal);
  }
  
  public void passo() {
    for (int i = 1; i < valores.length; i++) {
      if(valores[i] < valores[i-1]) {
        int temp = valores[i-1];
        valores[i-1] = valores[i];
        valores[i] = temp;
        pintar(valores, 0);
      }
    }
  }
  
}
