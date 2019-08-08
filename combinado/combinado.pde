int[] valoresInsertion;
int[] valoresBubble;
int[] valoresMerge;
BubbleSort bubble;
InsertionSort insertion;
MergeSort merge;
Thread threadMerge;


void setup() {
  size(1000, 400);
  valoresInsertion = new int[width/2];
  valoresBubble = new int[valoresInsertion.length];
  valoresMerge = new int[valoresInsertion.length];
  for (int i = 0; i < valoresInsertion.length; i++) {
    int valor = round(random(height));
    valoresInsertion[i] = valor;
    valoresBubble[i] = valor;
    valoresMerge[i] = valor;
  }
  bubble = new BubbleSort(valoresBubble, this);
  insertion = new InsertionSort(valoresInsertion, this);
  merge = new MergeSort(valoresMerge, this);
  threadMerge = new Thread(merge);
  threadMerge.start();
}

void draw(){
  if (frameCount % 2 == 0) {
    background(255);
    //pintar(insertion.getValores(), 0);
    //pintar(merge.getValores(), 0);
    //pintar(bubble.getValores(), 500);
    
    //bubble.passo();
    insertion.passo();
    //merge.passo();
  }
}

void atualizarVisualizacao(){
  pintar(merge.getValores(), 0);
}

void pintar(int[] valores, int offset){
  for (int i = 0; i < valores.length; i++) {
    line(i+offset, width, i+offset, height - valores[i]);
  }
}
