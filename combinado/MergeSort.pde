import java.util.concurrent.locks.*;

class MergeSort extends Algoritmo implements Runnable {
  
  private Lock lock = new ReentrantLock();
  private Condition esperar = lock.newCondition();

  public MergeSort(int[] valores, combinado principal) {
    super(valores, principal);
  }

  public void passo() {
    esperar.signal();
  }
  
  public void run(){
    ordenar(0, valores.length - 1);
  }

  public void ordenar(int inicio, int fim) {
    try{
      lock.lock();
      esperar.await();
      
      if (inicio < fim) {
        int meio = (inicio + fim)/2;
        ordenar(inicio, meio);
        ordenar(meio + 1, fim);
        unir(inicio, meio, fim);
      }
    } catch(Exception e){
      println(e);
      throw new RuntimeException(e);
    } //finally {
      //lock.unlock();
    //}
    
  }

  private void unir(int inicio, int meio, int fim) {
    //inicializando tamanhos
    int tamanhoEsquerda = meio - inicio + 1;
    int tamanhoDireita = fim - meio;

    //inicializando vetores de trabalho
    int[] esquerda = new int[tamanhoEsquerda + 1];
    int[] direita = new int[tamanhoDireita + 1];

    //copiando dados para o vetor de trabalho esquerdo
    for (int i = 0; i < tamanhoEsquerda; i++) {
      esquerda[i] = valores[inicio + i];
    }
    //copiando dados para o vetor de trabalho direito
    for (int j = 0; j < tamanhoDireita; j++) {
      direita[j] = valores[meio + j + 1];
    }

    esquerda[tamanhoEsquerda] = Integer.MAX_VALUE;  // null indicates infinity
    direita[tamanhoDireita] = Integer.MAX_VALUE;

    int i = 0, j = 0;

    for (int k = inicio; k <= fim; k++) {
      if (esquerda[i] <= direita[j]) {
        valores[k] = esquerda[i++];
      } else {
        valores[k] = direita[j++];
      }
    }
  }
}
