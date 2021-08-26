int random;
Jogador jogador = new Jogador();
BolaEspecial bolaEspecial = new BolaEspecial();
Bola bola = new Bola(jogador);
Barras[][] barras = new Barras[10][7];
int score, vida;
boolean jogoAcabou, jogoVenceu = false;
boolean naoComecou = true;
void setup() {
  random = (int)random(1, 10);
  vida = 2;
  size(600, 600);
  for (int contador = 0; contador<barras.length; contador++) {
    for (int contadorJ = 0; contadorJ<barras[7].length; contadorJ++) {
      barras[contador][contadorJ] = new Barras(contador*60, (20*contadorJ)+80);
    }
  }
}
void draw() {
  background(0);
  if (jogoAcabou == false) {
    textSize(40);
    text(score, 270, 50);
    bola.desenhaBola(jogador.posicaoJogadorX+50, jogador.posicaoJogadorY-10);
    bola.colisao(jogador);
    jogador.desenhaMove();
    for (int contador = 0; contador<barras.length; contador++) {
      for (int contadorJ = 1; contadorJ<barras[7].length; contadorJ++) {
        fill(40*contadorJ, 80*contadorJ, 30*contadorJ);
        barras[contador][contadorJ].desenhaBarra();
        barras[contador][contadorJ].colisao(bola);
        barras[contador][contadorJ].colisao(bolaEspecial, 1);
      }
    }
  }
  if (jogoAcabou == true) {
    if (jogoVenceu ==false) {
      text("Game Over", 210, 250);
    } else {
      text("Você venceu", 210, 250);
    }
    text("Score:" + score, 230, 50);
    text("Pressione na tela", 150, 380);
    text("para recomeçar", 150, 440);
    if (mousePressed == true) {
      random = (int)random(1, 10);
      jogoAcabou = false;
      naoComecou = true;
      jogoVenceu = false;
      vida=2;
      score=0;
      bolaEspecial.vidaEspecial = 1;
      bolaEspecial.posicaoBolaX = random(300, 400);
      bolaEspecial.posicaoBolaY = 300;
    }
  }
  if (score>=60) {
    jogoVenceu=true;
  }
  especial();
}
void especial() {
  bolaEspecial.desenhaBola();
  bolaEspecial.colisao(jogador);
}
