int[] valores;
int chave = 0;
int i = 0;
int j = 1;

void setup() {
  size(400, 400);
  fill(120);
  valores = new int[width];
  for (int i = 0; i < valores.length; i++) {
    valores[i] = round(random(height));
  }
}

void draw() {
  if (frameCount % 2 == 0) {
    background(255);
    for (int i = 0; i < valores.length; i++) {
      line(i, width, i, height - valores[i]);
    } //<>//
    chave = valores[j];
    i = j - 1;
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