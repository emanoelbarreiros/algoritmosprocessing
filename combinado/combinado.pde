int[] valoresInsertion;
int[] valoresBubble;
BubbleSort bubble;
InsertionSort insertion;

void setup() {
  size(1000, 400);
  valoresInsertion = new int[width/2];
  valoresBubble = new int[valoresInsertion.length];
  for (int i = 0; i < valoresInsertion.length; i++) {
    int valor = round(random(height));
    valoresInsertion[i] = valor;
    valoresBubble[i] = valor;
  }
  bubble = new BubbleSort(valoresBubble);
  insertion = new InsertionSort(valoresInsertion);
}

void draw(){
  if (frameCount % 2 == 0) {
    background(255);
    pintar(insertion.getValores(), 0);
    pintar(bubble.getValores(), 500);
    
    bubble.passo();
    insertion.passo();
  }
}

void pintar(int[] valores, int offset){
  for (int i = 0; i < valores.length; i++) {
    line(i+offset, width, i+offset, height - valores[i]);
  }
}