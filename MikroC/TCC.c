/***********************************************************************************************************
Projeto        :      SMG
Descri��o      :      Sistema de monitoramento e  controle de grupos geradores
Inicio         :      Dezembro/2018
Termino        :      Novembro/2019
Membros        :      Caio Pavan
                      Guilherme Gil
                      Gustavo Vinicius
                      Khayo Vannucci
                      Lucas Barros
***********************************************************************************************************/



//=====================================================================================
//                                BIBLIOTECAS
//=====================================================================================



/*************************************************************
      "BITMAP" DO ESCRITO EMERG�NCIA
*************************************************************/
       const code char EMER[1024] = {
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
        0,   0,   0,   0,   0, 128, 128, 128, 128, 128, 128, 128, 128,   0,   0,   0, 128, 128, 128,   0,   0,   0,   0, 128, 128, 128,   0,   0,   0, 128, 128, 128, 128, 128, 128, 128, 128,   0,   0,   0,   0, 128, 128, 128, 128, 128, 128,   0,   0,   0,   0,   0,   0,   0,   0, 128, 128, 128, 128, 128, 128,   0,   0,   0,   0, 128, 160, 184, 152, 152, 176, 160, 128,   0,   0,   0, 128, 128, 128,   0,   0,   0,   0,   0, 128, 128,   0,   0,   0,   0,   0,   0, 128, 128, 128, 128,   0,   0,   0,   0,   0, 128, 128, 128, 128, 128, 128, 128, 128,   0,   0,   0,   0,   0,   0, 128, 128, 128, 128,   0,   0,   0,   0,   0,   0,   0,   0,   0,
        0,   0,   0,   0,   0, 255, 255, 255,  49,  49,  49,  49,  49,   0,   0,   0, 255, 255,   7,  63, 240, 240,  31,   7, 255, 255,   0,   0,   0, 255, 255, 255,  49,  49,  49,  49,  49,   0,   0,   0,   0, 255, 255,  97,  97, 225, 243, 191,  31,   0,   0,   0, 252, 254,   7,   3,   1,  49,  49,  49, 241, 243,   0,   0,   0, 255, 255, 255,  49,  49,  49,  49,  49,   0,   0,   0, 255, 255,  15,  31, 124, 240, 192, 128, 255, 255,   0,   0, 248, 254, 255,   3,   3,   1,   1,   1,   1,   0,   0,   0,   0,   1,   1,   1, 255, 255,   1,   1,   1,   0,   0,   0,   0, 224, 252, 159, 131, 135, 191, 252, 224,   0,   0,   0,   0,   0,   0,   0,
        0,   0,   0,   0,   0,  15,  15,  15,  12,  12,  12,  12,  12,   0,   0,   0,  15,  15,   0,   0,   0,   0,   0,   0,  15,  15,   0,   0,   0,  15,  15,  15,  12,  12,  12,  12,  12,   0,   0,   0,   0,  15,  15,   0,   0,   0,   3,  15,  14,   8,   0,   0,   1,   7,   7,  14,  12,  12,  12,  12,  15,   7,   0,   0,   0,  15,  15,  15,  12,  12,  12,  12,  12,   0,   0,   0,  15,  15,   0,   0,   0,   1,   7,  15,  15,  15,   0,   0,   1,   3,   7,  14,  12,  12,  12,  12,   6,   0,   0,   0,   0,  12,  12,  12,  15,  15,  12,  12,  12,   0,   0,   8,  15,  15,   1,   1,   1,   1,   1,   3,  15,  15,   0,   0,   0,   0,   0,   0,
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0
       };


//=====================================================================================
//                                DEFINI��ES DE HARDWARE
//=====================================================================================
//Declara��o dos ports

char GLCD_DataPort at PORTD;

// Exemplo:  sbit NOME at PORTA.BIT (B0, B1, B2, B3, B4, B5, B6 OU B7)

//*******************************
// PORTA , do RA0 at� RA6
//*******************************
#define SENS_TEMP 0
#define BTN_TECLA 1
#define SENSO_VCC 2
sbit PRE_AQUEC at PORTA.B3;
sbit SOLENOIDE at PORTA.B4;
sbit MOTOR_PAR at PORTA.B5;

//*******************************
// PORTB , do RB0 at� RB7
//*******************************

//Pinos do display
sbit GLCD_CS1 at RB1_bit;
sbit GLCD_CS2 at RB0_bit;
sbit GLCD_RS  at RB2_bit;
sbit GLCD_RW  at RB3_bit;
sbit GLCD_EN  at RB4_bit;
sbit GLCD_RST at RB5_bit;
sbit GLCD_CS1_Direction at TRISB.B1;
sbit GLCD_CS2_Direction at TRISB.B0;
sbit GLCD_RS_Direction  at TRISB.B2;
sbit GLCD_RW_Direction  at TRISB.B3;
sbit GLCD_EN_Direction  at TRISB.B4;
sbit GLCD_RST_Direction at TRISB.B5;

//*******************************
// PORTC , do RC0,RC1,RC2,RC4,RC5,RC6 e RC7
//*******************************
//Exemplo:  sbit NOME at PORTC.BIT (B0, B1, B2, B3, B4, B5, B6 OU B7)

//Bot�o de emerg�ncia
sbit BTN_EMERGENCIA at PORTC.B2;

//*******************************
// PORTD , do RD0 at� RD7
//*******************************



//*******************************
// PORTE , do RE0 at� RE3
//*******************************
sbit RELE_REDE at PORTE.B0;
sbit RELE_GERADOR at PORTE.B1;


//=====================================================================================
//                        DEFINI��ES DE CONSTANTES
//=====================================================================================

// const NUMERO = 15;



//=====================================================================================
//                        DECLARA��O DAS VARI�VEIS  GLOBAIS
//=====================================================================================
//variaveis de calibracao
char txt_botao[7];
int botao;
int ultimo_botao;
int calibrar;

// Responsavel pela sele��o de painel
int pos_painel;
int max_tela;
int carregar_tela;
int carregar_subTela;
int carregar_barraCarga;
int carga;

// Variaveis conversor AD

//Tens�o Cont�nua
float tensaoVcc;
float store_Vcc;
char tensao_VccAnterior[7];
char txt_tensao_vcc[7];

//Temperatura motor
float temp_motor;
float temp_anterior_motor;
float store_temp;
char temp_motorAnterior[7];
char txt_temp_motor[7];

//constante para tela
char *menu0;
char *menu1;
char *menu2;
char *menu3;
char *menu4;
char *menu5;

// Variaveis de controle de modo funcionamento
int automatico = 0;
int manual = 1;

//=====================================================================================
//                        DECLARA��O DOS PROT�TIPOS
//=====================================================================================

/*************************************************************
      INICIO DAS ROTINAS DE TRANSFER�NCIA
*************************************************************/

//Desliga carga
//carga rede e carga gerador iniciam em 0
void desliga_carga();

//Liga carga da rede
void liga_rede();

//Liga carga da gerador
void liga_gerador();

/*************************************************************
      FIM DAS ROTINAS DE TRANSFER�NCIA
*************************************************************/





/*************************************************************
      INICIO DO TRATAMENTO DE DIPLAY E BOT�ES
*************************************************************/


/*Monitora a porta analogica medindo a tens�o gerada pelos bot�es e exibindo ou executando a fun��o correspondente a tens�o
Existe varia��o de tens�o dependendo do bot�o acionado devido aos diferentes resistores presentes no circuito
Deste modo, � possivel economizar portas digitais e at� mesmo adicionar novos bot�es ao painel*/

void tratamento_botoes();

//Cria o t�tulo e a moldura exibida no display
void tela(char *_menu);

//
void tela_principal();

//
void tela_tensaoVCC();

void tela_temperatura();

//fun��o para parada de emerg�ncia
void emergencia();

/*************************************************************
      FIM DO TRATAMENTO DE DIPLAY E BOT�ES
*************************************************************/










/*************************************************************
      INICIO DA LEITURA DE SENSORES
*************************************************************/

 //Fun��o de exibi��o da tens�o continua
void exibe_tensaoVcc();

//Fun��o de calculo de tens�o continua
long calcula_tensaoVcc();

//fun��o para exibi��o da temperatura
void exibe_temperatura();

//fun��o para calculo da temperatura
long calcula_temperatura();

/*************************************************************
      FIM DA LEITURA DE SENSORES
*************************************************************/


void calibra_botoes();

void pre_aquecimento();


/*************************************************************
      INICIO DAS ROTINAS DE FUNCIONAMENTO
*************************************************************/
void liga_solenoide_combustivel();
void desliga_solenoide_combustivel();

//rotinas de liga��o do equipamento: acionamento de solenoide forte, acionamento da solenoide fraca, libera��o da solenoide forte, acionamento do motor de arranque, parada do motor de arranque
void liga_gmg();

//rotinas de desligamento do motor: libera��o da solenoide fraca
void desliga_gmg();

//mesma rotida de desligamento, avisos visuais e sonoros
void parada_emergencia();

//exibe erros de partida e funcionamento
void erros();



/*************************************************************
      FIM DAS ROTINAS DE FUNCIONAMENTO
*************************************************************/








//=====================================================================================
//                        Verifica��o das INTERRUP��ES
//=====================================================================================
// void interrupt()
// {
     ///////////////////////////////////////////////////////////////////////////
         //Trata Interrup��o  **************************************************
     ///////////////////////////////////////////////////////////////////////////

//











//=====================================================================================
//                                PROGRAMA PRINCIPAL
//=====================================================================================

void main (void)
{

//nome dos menus
        menu0 = "   0 - Principal  ";
        menu1 = " 1 - Tensao Rede  ";
        menu2 = " 2 - Corrente Rede";
        menu3 = "  3 - Frequencia  ";
        menu4 = " 4 - Temperatura  ";
        menu5 = "5 - Tensao Bateria";

        max_tela = 6;

// Declara��o de vari�veis locais

//int x;

// Registradores de Configura��o:
        // configurando de an0 at� an3 como analogico, ver tabela datasheet p�gina 260
        ADCON1 |= 0b00001100;
        CMCON  |= 7;

// Configura��o dos PORTS de Entrada e Saida
// 0 -> configura o BIT como Sa�da
// 1 -> configura o BIT como Entrada

        //Port A, do RA0 at� RA6
        TRISA = 0b000111;

        //Port B, do RB0 at� RB7
        //TRISB = 0b00000000; // todos os BITs do PORTB est�o configurados como sa�da

        //Port C, RC0,RC1,RC2,RC4,RC5,RC6 e RC7
        TRISC = 0b10000000; // todos os BITs do PORTC est�o configurados como sa�da

        //Port D, do RD0 at� RD7
        TRISD = 0b11110000; // todos os BITs do PORTD est�o configurados como sa�da

        //Port E, do RE0 at� RE3
        TRISE = 0b00000000; // todos os BITs do PORTE est�o configurados como sa�da

        // zera as saidas
        PORTB = 0;
        PORTC = 0;
        PORTD = 0;
        PORTE = 0;

        Glcd_Init();                                   // Initialize GLCD
        Glcd_Fill(0x00);                               // Clear GLCD
        
        //Variavel de posi��o do painel
        pos_painel = 4;
        
        //Esta vari�vel � inciada em 1 e no final do la�o while, passa para 0. Quando um bot�o de navega��o � pressionado, ela � alterada para 1, dessa forma possibilitando entrar no la�o if que contem o c�digo da tela
        carregar_tela = 1;

        //mude este valor para 1 caso deseje calibrar os bot�es do painel, volte para 0 ao finalizar a calibra��o
        calibrar = 0;
        
        //mostra
        carga = 1;
        
        // variaveis de manual e autom�tico

        
        PRE_AQUEC = 0;
        SOLENOIDE = 0;
        MOTOR_PAR = 0;
//=====================================================================================
//         Inicio do Loop principal
//=====================================================================================

        while (1)
          {
              switch (pos_painel) {
                   case 0: tela(menu0); tela_principal(); break;
                   case 1: tela(menu1); break;
                   case 2: tela(menu2); break;
                   case 3: tela(menu3); break;
                   case 4: tela(menu4); tela_temperatura(); break;
                   case 5: tela(menu5); tela_tensaoVCC(); break;
                   }
              tratamento_botoes();
              pre_aquecimento();
              
              // quando equipamento estiver em automatico, as rotinas a baixo ser�o executas.
              
              /*if(automatico == 1){
              };*/

              
              while(BTN_EMERGENCIA){ //Quando emergencia � ativada pelo bot�o de emergencia
                   emergencia();

                   }


          }//fecha o while
}//fecha o void main




//=====================================================================================
//                        DECLARA��O DAS FUN��ES
//=====================================================================================

void emergencia(){
       Glcd_Fill(0);
       while(BTN_EMERGENCIA){
       Glcd_Image(EMER);

       }
       Glcd_Fill(0);
       carregar_tela = 1;
}

void liga_solenoide_combustivel(){
       SOLENOIDE = 1;
}

void desliga_solenoide_combustivel(){
       SOLENOIDE = 0;
}

void desliga_carga(){
      RELE_GERADOR = 0;
      RELE_REDE = 1;
      carregar_barraCarga = 1;
      carga = 0;
      delay_ms(20);
}

void liga_rede(){
      if(RELE_GERADOR == 0 && RELE_REDE == 1){
          RELE_REDE = 0;
          carregar_barraCarga = 1;
          carga = 1;
          delay_ms(20);
      }
}

void liga_gerador(){
      if(RELE_GERADOR == 0 && RELE_REDE == 1){
          RELE_GERADOR = 1;
          carregar_barraCarga = 1;
          carga = 2;
          delay_ms(20);
      }
}

void tratamento_botoes(){
 botao = adc_read(BTN_TECLA);
 if(botao > 10){                                                       // Verifica se algum bot�o foi apertado
    Glcd_Box(5, 30, 80, 40, 0);                                        // Caso algum bot�o tenha sido pressionado, limpa a area de t�tulo
 }

 if(calibrar == 1){                                                     // verifica se modo calibra��o est� ativo
    if(botao != ultimo_botao){
         Glcd_Box(5, 50, 100, 60, 0);                                   // limpa area do texto onde eaparecer� valor e nome do bot�o
         ultimo_botao = botao;
    }
    intToStr(botao, txt_botao);                                         // transforma o valor de adc em string
    ltrim(txt_botao);
    Glcd_Write_Text_Adv(txt_botao, 40, 50);                             // exibe o valor do bot�o
    Glcd_Write_Text_Adv("Botao:", 5, 50);
    delay_ms(50);

 }

 if(botao >= 80 && botao <= 100){                                       // Bot�o liga gerador
    liga_gerador();
    Glcd_Write_Text_Adv("Gerador", 5, 30);
 }
 
 if(botao >= 120 && botao <= 140){                                      // Bot�o desliga carga
    desliga_carga();
    Glcd_Write_Text_Adv("Desliga Carga", 5, 30);
 }
 
 if(botao >= 170 && botao <= 190){                                      // Bot�o liga rede
    liga_rede();
    Glcd_Write_Text_Adv("Rede", 5, 30);
 }

 if(botao >= 200 && botao <= 220){                                      // Bot�o parar gerador
    Glcd_Write_Text_Adv("Parar GMG", 5, 30);
    PRE_AQUEC = 1;
 }
 
 if(botao >= 230 && botao <= 240){                                      // Bot�o parte gerador
   Glcd_Write_Text_Adv("Partir GMG", 5, 30);
   PRE_AQUEC = 0;
 }

 if(botao >= 310 && botao <= 330 && manual == 1){                       // Bot�o Autom�tico
   Glcd_Write_Text_Adv("Automatico", 5, 30);
      manual = 0;
      automatico = 1;
      carregar_tela = 1;
 }

 if(botao >= 590 && botao <= 610 && automatico == 1){                   // Bot�o Manual
   Glcd_Write_Text_Adv("Manual", 5, 30);
      manual = 1;
      automatico = 0;
      carregar_tela = 1;

 }

 if(botao >= 680 && botao <= 700) {                                     // Bot�o Reset
    Glcd_Write_Text_Adv("Reset", 5, 30);
    SOLENOIDE = !SOLENOIDE;
 }

 if(botao >= 830 && botao <= 850){                                      // Bot�o >> (direita)
    Glcd_Write_Text_Adv("Direita", 5, 30);
    if(calibrar == 0){
    if(pos_painel < max_tela){
        pos_painel++;
    }
    else{
        pos_painel = 0;
    }
    carregar_tela = 1;                                                  // esta variavel faz com que a tela seja carregada apanas uma vez
 }
 }
 
  if(botao >= 880 && botao <= 900){                                     // Bot�o reset + >>(direita)
    Glcd_Write_Text_Adv("Calibrar", 5, 30);
    delay_ms(200);
    calibrar = !calibrar;
    if(calibrar == 0){
         Glcd_Box(5, 50, 100, 60, 0);
    }
 }

 if(botao >= 980 && botao <= 1000){                                     // Bot�o << (esquerda)
    Glcd_Write_Text_Adv("Esquerda", 5, 30);
    if(calibrar == 0){
      if(pos_painel > 0){
          pos_painel--;
      }
      else{
          pos_painel = max_tela;
      }
      carregar_tela = 1;                                                 // esta variavel faz com que a tela seja carregada apanas uma vez
   }
 }

}

void pre_aquecimento(){
       float max = 60;
       float min = 45;
       float temp;
       float prov;
       
       prov = calcula_temperatura();
       temp = (prov / 1023) * 100;
       

       if(temp <= min){
             PRE_AQUEC = 1;
       }

       if(temp >= max){
             PRE_AQUEC = 0;
       }

}

void exibe_temperatura(){
     int ajuste = 1;
     float anterior;

     store_temp = calcula_temperatura();
     temp_motor = (store_temp/1023)*100;
     FloatToStr_FixLen(temp_motor, txt_temp_motor, 4);
     ltrim(txt_temp_motor);

     if(store_temp >= anterior + ajuste || store_temp <= anterior - ajuste){
       Glcd_Box(70, 15, 92, 30, 0);
       strcpy(temp_motorAnterior, txt_temp_motor);
       Glcd_Write_Text_Adv("Temperatura: ", 10, 15);
       Glcd_Write_Text_Adv(txt_temp_motor, 72, 15);
       Glcd_Write_Text_Adv("C ", 93, 15);
       anterior = store_temp;
     }
}

long calcula_temperatura(){
     unsigned char i;
     float temp_store = 0;

     for(i = 0; i < 100 ; i++){
           temp_store += adc_read(SENS_TEMP);
     }

     return((temp_store/100)*5);
}

void exibe_tensaoVcc(){
     int ajuste = 15;
     float anterior;

     store_Vcc = calcula_TensaoVcc();
     tensaoVcc = (store_Vcc*30)/1023;
     FloatToStr_FixLen(tensaoVcc, txt_tensao_vcc, 4);
     ltrim(txt_tensao_vcc);

     if(store_Vcc >= anterior+ajuste || store_Vcc <= anterior-ajuste){
       Glcd_Box(70, 15, 89, 30, 0);
       Glcd_Write_Text_Adv("Bateria: ", 10, 15);
       Glcd_Write_Text_Adv(txt_tensao_Vcc, 70, 15);
       Glcd_Write_Text_Adv("V ", 90, 15);
       anterior = store_Vcc;
     }
}

long calcula_tensaoVcc(){
     unsigned char i;
     float volt_store = 0;
     
     for(i = 0; i < 100 ; i++){
           volt_store += adc_read(SENSO_VCC);
     }

     return(volt_store/100);
}

void tela(char *_menu){
     if(carregar_tela == 1){                                            // Verifica se a tela ja foi carregada
         Glcd_Rectangle(0,0,127, 63, 1);                                // Cria a borda da tela
         Glcd_box(0, 0, 127, 12, 1);                                    // Cria a faixa preta de t�tulo
         Glcd_Set_Font_Adv(Glcd_defaultFont, 0, 0);                     // Troca a cor padr�o da fonte para "branco"
         Glcd_Write_Text_Adv(_menu, 30, 1);                             // Escreve o nome do menu, que ser� "puxado" do switch contido no main
         Glcd_Circle(118, 6, 6, 2);
         if(automatico == 1){
            Glcd_Write_Text_Adv( "A" , 115, 1);
         }
         if(manual == 1){
            Glcd_Write_Text_Adv( "M" , 115, 1);
         }
         Glcd_Set_Font_Adv(Glcd_defaultFont, 1, 0);                     // Volta a cor padr�o de fonte para "preto"
         carregar_tela = 0;
         carregar_subTela = 1;                                          // Permite que a subtela seja carregada
         
     }
}

void tela_principal(){
     if(carregar_subTela == 1){                                         // Verifica se a subtela(local onde aparecem as informa��es ja foi carregada
         Glcd_box(1, 13, 126, 62, 0);
         carregar_barraCarga = 1;
         carregar_subTela = 0;
     }
     //esta sendo implementado
     
     if(carregar_barraCarga == 1){
     GLCD_rectangle(0, 51, 127, 63, 1);
     GLCD_box(1, 52, 126, 62, 0);
     switch(carga){
       case 0:
            Glcd_Write_Text_Adv("REDE", 6, 52);
            Glcd_box(43,51,85, 62, 1);
            Glcd_Set_Font_Adv(Glcd_defaultFont, 0, 0);
            Glcd_Write_Text_Adv("OFF", 55, 52);
            Glcd_Set_Font_Adv(Glcd_defaultFont, 1, 0);
            Glcd_Write_Text_Adv("GMG", 96, 52);
            carregar_barraCarga = 0;
            break;
       case 1:
            Glcd_box(1,51,42, 62, 1);
            Glcd_Set_Font_Adv(Glcd_defaultFont, 0, 0);
            Glcd_Write_Text_Adv("REDE", 6, 52);
            Glcd_Set_Font_Adv(Glcd_defaultFont, 1, 0);
            Glcd_Write_Text_Adv("OFF", 55, 52);
            Glcd_Write_Text_Adv("GMG", 96, 52);
            carregar_barraCarga = 0;
            break;
       case 2:
            Glcd_Write_Text_Adv("REDE", 6, 52);
            Glcd_Write_Text_Adv("OFF", 55, 52);
            Glcd_box(85,51,126, 62, 1);
            Glcd_Set_Font_Adv(Glcd_defaultFont, 0, 0);
            Glcd_Write_Text_Adv("GMG", 96, 52);
            Glcd_Set_Font_Adv(Glcd_defaultFont, 1, 0);
            carregar_barraCarga = 0;
            break;
     }
     }
}

void tela_tensaoVCC(){
     if(carregar_subTela == 1){                                          // Verifica se a subtela(local onde aparecem as informa��es ja foi carregada
         Glcd_box(1, 13, 126, 62, 0);
         carregar_subTela = 0;
     }   
     exibe_tensaoVcc();
}

void tela_temperatura(){
     if(carregar_subTela == 1){                                          // Verifica se a subtela(local onde aparecem as informa��es ja foi carregada
         Glcd_box(1, 13, 126, 62, 0);
         carregar_subTela = 0;
     }
     exibe_temperatura();
}
