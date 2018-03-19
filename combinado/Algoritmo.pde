abstract class Algoritmo{
  
  protected int[] valores;
  
  public Algoritmo(int[] valores){
    this.valores = valores;
  }
  
  public abstract void passo();
  
  public int[] getValores(){
    return valores;
  }
}