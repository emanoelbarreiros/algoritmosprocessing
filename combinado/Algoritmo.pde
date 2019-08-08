abstract class Algoritmo{
  
  protected int[] valores;
  protected combinado principal;
  
  public Algoritmo(int[] valores, combinado principal){
    this.valores = valores;
    this.principal = principal;
  }
  
  public abstract void passo();
  
  public int[] getValores(){
    return valores;
  }
}
