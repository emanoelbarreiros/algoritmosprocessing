int[] valores;
boolean trocado;

void setup(){
  size(400,400);
  fill(120);
  valores = new int[width];
  for (int i = 0; i < valores.length; i++){
    valores[i] = round(random(height));
  }
}

void draw() {
  if (frameCount % 2 == 0){
    background(255);
    for(int i = 0; i < valores.length; i++){
      line(i, width, i, height - valores[i]);
    }
    
    trocado = false;
    for (int i = 1; i < valores.length; i++) {
      if(valores[i] < valores[i-1]) {
        int temp = valores[i-1];
        valores[i-1] = valores[i];
        valores[i] = temp;
        trocado = true;
      }
    }
  }
}