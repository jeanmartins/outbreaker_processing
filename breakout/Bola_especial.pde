class BolaEspecial {
  float posicaoBolaX, posicaoBolaY, aceleracaoX, aceleracaoY, testarColisaoX, testarColisaoY, distancia, raio;
  BolaEspecial() {
    this.aceleracaoX = 5;
    this.aceleracaoY = 3;
    this.posicaoBolaX = 300;
    this.posicaoBolaY = 300;
    this.raio = 10;
  }
  void desenhaBola(float posicaoTempX, float posicaoTempY) {
    noStroke();
    if(vida != 0){
    if(score>=2){
    circle(this.posicaoBolaX, this.posicaoBolaY, this.raio*2);
      moverBola();
    }
    }
    }
  
  void moverBola(){
    this.posicaoBolaX+=this.aceleracaoX;
    if (this.posicaoBolaX >= width) {
      this.aceleracaoX = -5;
    }
    if (this.posicaoBolaX <= 0) {
      this.aceleracaoX = 5;
    }
    this.posicaoBolaY+=this.aceleracaoY;
    this.aceleracaoY+= 0.01;
    if (this.posicaoBolaY >= height) {
      vida-=1;
      this.posicaoBolaY = 300;
      }
    if (this.posicaoBolaY <= 0) {
      this.aceleracaoY = 5;
    }
  }
  void colisao(Jogador outro) {
    testarColisaoX = this.posicaoBolaX;
    testarColisaoY = this.posicaoBolaY;

    if (this.posicaoBolaX < outro.posicaoJogadorX) {
      testarColisaoX = outro.posicaoJogadorX;
    } else if (this.posicaoBolaX > outro.posicaoJogadorX + outro.larguraJogador) {
      testarColisaoX = outro.posicaoJogadorX + outro.larguraJogador;
    }

    if (this.posicaoBolaY < outro.posicaoJogadorY) {
      testarColisaoY = outro.posicaoJogadorY;
    } else if (this.posicaoBolaY > outro.posicaoJogadorY + outro.alturaJogador) {
      testarColisaoY =  outro.posicaoJogadorY + outro.alturaJogador;
    }
    this.distancia = sqrt(sq(this.posicaoBolaX - testarColisaoX) + sq(this.posicaoBolaY - testarColisaoY));

    if ( this.distancia <= this.raio) {
      this.aceleracaoY = 5;
      if (testarColisaoY == outro.posicaoJogadorY) {
        this.aceleracaoY = -5;
      }
    }
  }
}
