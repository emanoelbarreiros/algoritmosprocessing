int[] valores;
boolean inverter = false;
int tamanho = 30;
int vermelho;
int azul;
int i = 1;
boolean rodar = true;
boolean trocou = false;
boolean passo = false;

void setup(){
  size(400,400);
  strokeWeight(1);
  fill(120);
  stroke(0);
  valores = new int[width/tamanho];
  for (int i = 0; i < valores.length; i++){
    valores[i] = round(random(height));
  }
  background(255);
  for (int j = 0; j < valores.length; j++){
    rect(j*tamanho, height - valores[j], tamanho, valores[j]);
  }
}

void draw(){
  if (frameCount % 10 == 0 && rodar && passo){
    passo = false;
    if (inverter) {
      pintar(valores, i-1,i);
      inverter = false;
    } else {
      pintar(valores, i, i-1);
      if (valores[i] < valores[i-1]){
        int temp = valores[i]; //<>//
        valores[i] = valores[i-1];
        valores[i-1] = temp;
        inverter = true;
        trocou = true;
      }
      i++;
      if (i > valores.length - 1){
        i = 1;
        rodar = trocou;
        trocou = false;
      }
    }
  }
}


void pintar(int[] valores, int vermelho, int azul){
  background(255);
  for (int j = 0; j < valores.length; j++){
    if (j == vermelho) {
      fill(255,0,0);
    } else if (j == azul){
      fill(0,0,255);
    } else {
      fill(120);
    }
    rect(j*tamanho, height - valores[j], tamanho, valores[j]);
  }
}

void keyReleased(){
  passo = true;
}