
_main:

;TCC.c,349 :: 		void main (void)
;TCC.c,353 :: 		menu0 = "   0 - Principal  ";
	MOVLW       ?lstr1_TCC+0
	MOVWF       _menu0+0 
	MOVLW       hi_addr(?lstr1_TCC+0)
	MOVWF       _menu0+1 
;TCC.c,354 :: 		menu1 = " 1 - Tensao Rede  ";
	MOVLW       ?lstr2_TCC+0
	MOVWF       _menu1+0 
	MOVLW       hi_addr(?lstr2_TCC+0)
	MOVWF       _menu1+1 
;TCC.c,355 :: 		menu2 = " 2 - Corrente Rede";
	MOVLW       ?lstr3_TCC+0
	MOVWF       _menu2+0 
	MOVLW       hi_addr(?lstr3_TCC+0)
	MOVWF       _menu2+1 
;TCC.c,356 :: 		menu3 = "  3 - Frequencia  ";
	MOVLW       ?lstr4_TCC+0
	MOVWF       _menu3+0 
	MOVLW       hi_addr(?lstr4_TCC+0)
	MOVWF       _menu3+1 
;TCC.c,357 :: 		menu4 = " 4 - Temperatura  ";
	MOVLW       ?lstr5_TCC+0
	MOVWF       _menu4+0 
	MOVLW       hi_addr(?lstr5_TCC+0)
	MOVWF       _menu4+1 
;TCC.c,358 :: 		menu5 = "5 - Tensao Bateria";
	MOVLW       ?lstr6_TCC+0
	MOVWF       _menu5+0 
	MOVLW       hi_addr(?lstr6_TCC+0)
	MOVWF       _menu5+1 
;TCC.c,360 :: 		max_tela = 6;
	MOVLW       6
	MOVWF       _max_tela+0 
	MOVLW       0
	MOVWF       _max_tela+1 
;TCC.c,362 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;TCC.c,363 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;TCC.c,364 :: 		UART1_Write_Text("Start");
	MOVLW       ?lstr7_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr7_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,365 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,366 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,367 :: 		UART1_write_text("Pressione H para ajuda");
	MOVLW       ?lstr8_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,368 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,369 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,374 :: 		tensao_anterior_rede_r = 0;
	CLRF        _tensao_anterior_rede_r+0 
	CLRF        _tensao_anterior_rede_r+1 
	CLRF        _tensao_anterior_rede_r+2 
	CLRF        _tensao_anterior_rede_r+3 
;TCC.c,375 :: 		temp_anterior_motor = 0;
	CLRF        _temp_anterior_motor+0 
	CLRF        _temp_anterior_motor+1 
	CLRF        _temp_anterior_motor+2 
	CLRF        _temp_anterior_motor+3 
;TCC.c,382 :: 		ADCON1 |= 0b00001011;
	MOVLW       11
	IORWF       ADCON1+0, 1 
;TCC.c,383 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;TCC.c,390 :: 		TRISA = 0b1111111;  // todos os BITs do PORTA estão configurados como entrada
	MOVLW       127
	MOVWF       TRISA+0 
;TCC.c,397 :: 		TRISC = 0b10000000; // todos os BITs do PORTC estão configurados como saída
	MOVLW       128
	MOVWF       TRISC+0 
;TCC.c,400 :: 		TRISD = 0b11110000; // todos os BITs do PORTD estão configurados como saída
	MOVLW       240
	MOVWF       TRISD+0 
;TCC.c,403 :: 		TRISE = 0b00000000; // todos os BITs do PORTE estão configurados como saída
	CLRF        TRISE+0 
;TCC.c,406 :: 		PORTB = 0;
	CLRF        PORTB+0 
;TCC.c,407 :: 		PORTC = 0;
	CLRF        PORTC+0 
;TCC.c,408 :: 		PORTD = 0;
	CLRF        PORTD+0 
;TCC.c,409 :: 		PORTE = 0;
	CLRF        PORTE+0 
;TCC.c,411 :: 		Glcd_Init();                                   // Initialize GLCD
	CALL        _Glcd_Init+0, 0
;TCC.c,412 :: 		Glcd_Fill(0x00);                               // Clear GLCD
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;TCC.c,415 :: 		pos_painel = 4;
	MOVLW       4
	MOVWF       _pos_painel+0 
	MOVLW       0
	MOVWF       _pos_painel+1 
;TCC.c,417 :: 		carregar_tela = 1;
	MOVLW       1
	MOVWF       _carregar_tela+0 
	MOVLW       0
	MOVWF       _carregar_tela+1 
;TCC.c,420 :: 		calibrar = 0;
	CLRF        _calibrar+0 
	CLRF        _calibrar+1 
;TCC.c,422 :: 		emerg = 0;
	CLRF        _emerg+0 
	CLRF        _emerg+1 
;TCC.c,424 :: 		carga = 1;
	MOVLW       1
	MOVWF       _carga+0 
	MOVLW       0
	MOVWF       _carga+1 
;TCC.c,430 :: 		while (1)
L_main1:
;TCC.c,432 :: 		switch (pos_painel) {
	GOTO        L_main3
;TCC.c,433 :: 		case 0: tela(menu0); tela_principal(); break;
L_main5:
	MOVF        _menu0+0, 0 
	MOVWF       FARG_tela__menu+0 
	MOVF        _menu0+1, 0 
	MOVWF       FARG_tela__menu+1 
	CALL        _tela+0, 0
	CALL        _tela_principal+0, 0
	GOTO        L_main4
;TCC.c,434 :: 		case 1: tela(menu1);  break;
L_main6:
	MOVF        _menu1+0, 0 
	MOVWF       FARG_tela__menu+0 
	MOVF        _menu1+1, 0 
	MOVWF       FARG_tela__menu+1 
	CALL        _tela+0, 0
	GOTO        L_main4
;TCC.c,435 :: 		case 2: tela(menu2);  break;
L_main7:
	MOVF        _menu2+0, 0 
	MOVWF       FARG_tela__menu+0 
	MOVF        _menu2+1, 0 
	MOVWF       FARG_tela__menu+1 
	CALL        _tela+0, 0
	GOTO        L_main4
;TCC.c,436 :: 		case 3: tela(menu3);  break;
L_main8:
	MOVF        _menu3+0, 0 
	MOVWF       FARG_tela__menu+0 
	MOVF        _menu3+1, 0 
	MOVWF       FARG_tela__menu+1 
	CALL        _tela+0, 0
	GOTO        L_main4
;TCC.c,437 :: 		case 4: tela(menu4); exibe_temperatura(); break;
L_main9:
	MOVF        _menu4+0, 0 
	MOVWF       FARG_tela__menu+0 
	MOVF        _menu4+1, 0 
	MOVWF       FARG_tela__menu+1 
	CALL        _tela+0, 0
	CALL        _exibe_temperatura+0, 0
	GOTO        L_main4
;TCC.c,438 :: 		case 5: tela(menu5); tela_tensaoVCC(); break;
L_main10:
	MOVF        _menu5+0, 0 
	MOVWF       FARG_tela__menu+0 
	MOVF        _menu5+1, 0 
	MOVWF       FARG_tela__menu+1 
	CALL        _tela+0, 0
	CALL        _tela_tensaoVCC+0, 0
	GOTO        L_main4
;TCC.c,439 :: 		}
L_main3:
	MOVLW       0
	XORWF       _pos_painel+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main121
	MOVLW       0
	XORWF       _pos_painel+0, 0 
L__main121:
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
	MOVLW       0
	XORWF       _pos_painel+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main122
	MOVLW       1
	XORWF       _pos_painel+0, 0 
L__main122:
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
	MOVLW       0
	XORWF       _pos_painel+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main123
	MOVLW       2
	XORWF       _pos_painel+0, 0 
L__main123:
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
	MOVLW       0
	XORWF       _pos_painel+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main124
	MOVLW       3
	XORWF       _pos_painel+0, 0 
L__main124:
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
	MOVLW       0
	XORWF       _pos_painel+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main125
	MOVLW       4
	XORWF       _pos_painel+0, 0 
L__main125:
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
	MOVLW       0
	XORWF       _pos_painel+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main126
	MOVLW       5
	XORWF       _pos_painel+0, 0 
L__main126:
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
L_main4:
;TCC.c,440 :: 		tratamento_botoes();
	CALL        _tratamento_botoes+0, 0
;TCC.c,441 :: 		serial_menu();
	CALL        _serial_menu+0, 0
;TCC.c,443 :: 		while(BTN_EMERGENCIA){ //Quando emergencia é ativada pelo botão de emergencia
L_main11:
	BTFSS       PORTC+0, 2 
	GOTO        L_main12
;TCC.c,444 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,445 :: 		UART1_write_text("MODO DE EMERGENCIA ATIVADO");
	MOVLW       ?lstr9_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,446 :: 		emergencia();
	CALL        _emergencia+0, 0
;TCC.c,448 :: 		}
	GOTO        L_main11
L_main12:
;TCC.c,449 :: 		while(emerg){ //quando emergencia é ativada pelo terminal
L_main13:
	MOVF        _emerg+0, 0 
	IORWF       _emerg+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
;TCC.c,451 :: 		emergencia();
	CALL        _emergencia+0, 0
;TCC.c,452 :: 		}
	GOTO        L_main13
L_main14:
;TCC.c,454 :: 		}//fecha o while
	GOTO        L_main1
;TCC.c,455 :: 		}//fecha o void main
L_end_main:
	GOTO        $+0
; end of _main

_emergencia:

;TCC.c,464 :: 		void emergencia(){
;TCC.c,465 :: 		Glcd_Fill(0);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;TCC.c,466 :: 		while(emerg){
L_emergencia15:
	MOVF        _emerg+0, 0 
	IORWF       _emerg+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_emergencia16
;TCC.c,467 :: 		Glcd_Image(EMER);
	MOVLW       _EMER+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_EMER+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_EMER+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;TCC.c,469 :: 		if(BTN_EMERGENCIA == 1 && emerg == 1){
	BTFSS       PORTC+0, 2 
	GOTO        L_emergencia19
	MOVLW       0
	XORWF       _emerg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__emergencia128
	MOVLW       1
	XORWF       _emerg+0, 0 
L__emergencia128:
	BTFSS       STATUS+0, 2 
	GOTO        L_emergencia19
L__emergencia107:
;TCC.c,470 :: 		emerg = 0;
	CLRF        _emerg+0 
	CLRF        _emerg+1 
;TCC.c,471 :: 		UART1_write_text("Solte o botao de emergencia para resetar");
	MOVLW       ?lstr10_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,473 :: 		}
L_emergencia19:
;TCC.c,475 :: 		}
	GOTO        L_emergencia15
L_emergencia16:
;TCC.c,476 :: 		while(BTN_EMERGENCIA){
L_emergencia20:
	BTFSS       PORTC+0, 2 
	GOTO        L_emergencia21
;TCC.c,477 :: 		Glcd_Image(EMER);
	MOVLW       _EMER+0
	MOVWF       FARG_Glcd_Image_image+0 
	MOVLW       hi_addr(_EMER+0)
	MOVWF       FARG_Glcd_Image_image+1 
	MOVLW       higher_addr(_EMER+0)
	MOVWF       FARG_Glcd_Image_image+2 
	CALL        _Glcd_Image+0, 0
;TCC.c,479 :: 		if(emerg == 1){
	MOVLW       0
	XORWF       _emerg+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__emergencia129
	MOVLW       1
	XORWF       _emerg+0, 0 
L__emergencia129:
	BTFSS       STATUS+0, 2 
	GOTO        L_emergencia22
;TCC.c,481 :: 		emerg = 0;
	CLRF        _emerg+0 
	CLRF        _emerg+1 
;TCC.c,482 :: 		}
L_emergencia22:
;TCC.c,484 :: 		}
	GOTO        L_emergencia20
L_emergencia21:
;TCC.c,485 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,486 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,487 :: 		UART1_write_text("Pronto para operar");
	MOVLW       ?lstr11_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,488 :: 		UART1_write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,489 :: 		UART1_write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,490 :: 		Glcd_Fill(0);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;TCC.c,491 :: 		carregar_tela = 1;
	MOVLW       1
	MOVWF       _carregar_tela+0 
	MOVLW       0
	MOVWF       _carregar_tela+1 
;TCC.c,492 :: 		}
L_end_emergencia:
	RETURN      0
; end of _emergencia

_desliga_carga:

;TCC.c,494 :: 		void desliga_carga(){
;TCC.c,495 :: 		RELE_GERADOR = 0;
	BCF         PORTE+0, 1 
;TCC.c,496 :: 		RELE_REDE = 1;
	BSF         PORTE+0, 0 
;TCC.c,497 :: 		Glcd_Write_Text_Adv("desliga", 5, 30);
	MOVLW       ?lstr12_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr12_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,498 :: 		carregar_barraCarga = 1;
	MOVLW       1
	MOVWF       _carregar_barraCarga+0 
	MOVLW       0
	MOVWF       _carregar_barraCarga+1 
;TCC.c,499 :: 		carga = 0;
	CLRF        _carga+0 
	CLRF        _carga+1 
;TCC.c,500 :: 		delay_ms(20);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_desliga_carga23:
	DECFSZ      R13, 1, 1
	BRA         L_desliga_carga23
	DECFSZ      R12, 1, 1
	BRA         L_desliga_carga23
	NOP
	NOP
;TCC.c,501 :: 		}
L_end_desliga_carga:
	RETURN      0
; end of _desliga_carga

_liga_rede:

;TCC.c,503 :: 		void liga_rede(){
;TCC.c,504 :: 		if(RELE_GERADOR == 0 && RELE_REDE == 1){
	BTFSC       PORTE+0, 1 
	GOTO        L_liga_rede26
	BTFSS       PORTE+0, 0 
	GOTO        L_liga_rede26
L__liga_rede108:
;TCC.c,505 :: 		RELE_REDE =0;
	BCF         PORTE+0, 0 
;TCC.c,506 :: 		Glcd_Write_Text_Adv("rede", 5, 30);
	MOVLW       ?lstr13_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr13_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,507 :: 		carregar_barraCarga = 1;
	MOVLW       1
	MOVWF       _carregar_barraCarga+0 
	MOVLW       0
	MOVWF       _carregar_barraCarga+1 
;TCC.c,508 :: 		carga = 1;
	MOVLW       1
	MOVWF       _carga+0 
	MOVLW       0
	MOVWF       _carga+1 
;TCC.c,509 :: 		delay_ms(20);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_liga_rede27:
	DECFSZ      R13, 1, 1
	BRA         L_liga_rede27
	DECFSZ      R12, 1, 1
	BRA         L_liga_rede27
	NOP
	NOP
;TCC.c,510 :: 		}
L_liga_rede26:
;TCC.c,511 :: 		}
L_end_liga_rede:
	RETURN      0
; end of _liga_rede

_liga_gerador:

;TCC.c,513 :: 		void liga_gerador(){
;TCC.c,514 :: 		if(RELE_GERADOR == 0 && RELE_REDE == 1){
	BTFSC       PORTE+0, 1 
	GOTO        L_liga_gerador30
	BTFSS       PORTE+0, 0 
	GOTO        L_liga_gerador30
L__liga_gerador109:
;TCC.c,515 :: 		RELE_GERADOR = 1;
	BSF         PORTE+0, 1 
;TCC.c,516 :: 		Glcd_Write_Text_Adv("gerador", 5, 30);
	MOVLW       ?lstr14_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr14_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,517 :: 		carregar_barraCarga = 1;
	MOVLW       1
	MOVWF       _carregar_barraCarga+0 
	MOVLW       0
	MOVWF       _carregar_barraCarga+1 
;TCC.c,518 :: 		carga = 2;
	MOVLW       2
	MOVWF       _carga+0 
	MOVLW       0
	MOVWF       _carga+1 
;TCC.c,519 :: 		delay_ms(20);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_liga_gerador31:
	DECFSZ      R13, 1, 1
	BRA         L_liga_gerador31
	DECFSZ      R12, 1, 1
	BRA         L_liga_gerador31
	NOP
	NOP
;TCC.c,520 :: 		}
L_liga_gerador30:
;TCC.c,521 :: 		}
L_end_liga_gerador:
	RETURN      0
; end of _liga_gerador

_tratamento_botoes:

;TCC.c,523 :: 		void tratamento_botoes(){
;TCC.c,524 :: 		botao = adc_read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _botao+0 
	MOVF        R1, 0 
	MOVWF       _botao+1 
;TCC.c,525 :: 		if(botao > 10){                                                       //Verifica se algum botão foi apertado
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes134
	MOVF        R0, 0 
	SUBLW       10
L__tratamento_botoes134:
	BTFSC       STATUS+0, 0 
	GOTO        L_tratamento_botoes32
;TCC.c,526 :: 		Glcd_Box(5, 30, 50, 40, 0);                                        //Caso algum botão tenha sido pressionado, limpa a area de título
	MOVLW       5
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       30
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       50
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       40
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,527 :: 		}
L_tratamento_botoes32:
;TCC.c,529 :: 		if(calibrar == 1){                                                     //verifica se modo calibração está ativo
	MOVLW       0
	XORWF       _calibrar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes135
	MOVLW       1
	XORWF       _calibrar+0, 0 
L__tratamento_botoes135:
	BTFSS       STATUS+0, 2 
	GOTO        L_tratamento_botoes33
;TCC.c,530 :: 		if(botao != ultimo_botao){
	MOVF        _botao+1, 0 
	XORWF       _ultimo_botao+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes136
	MOVF        _ultimo_botao+0, 0 
	XORWF       _botao+0, 0 
L__tratamento_botoes136:
	BTFSC       STATUS+0, 2 
	GOTO        L_tratamento_botoes34
;TCC.c,531 :: 		Glcd_Box(5, 20, 100, 40, 0);                                   //limpa area do texto onde eaparecerá valor e nome do botão
	MOVLW       5
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       20
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       100
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       40
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,532 :: 		ultimo_botao = botao;
	MOVF        _botao+0, 0 
	MOVWF       _ultimo_botao+0 
	MOVF        _botao+1, 0 
	MOVWF       _ultimo_botao+1 
;TCC.c,533 :: 		}
L_tratamento_botoes34:
;TCC.c,534 :: 		intToStr(botao, txt_botao);                                         //transforma o valor de adc em string
	MOVF        _botao+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _botao+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt_botao+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt_botao+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;TCC.c,535 :: 		ltrim(txt_botao);
	MOVLW       _txt_botao+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt_botao+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;TCC.c,536 :: 		Glcd_Write_Text_Adv(txt_botao, 40, 20);                             //exibe o valor do botão
	MOVLW       _txt_botao+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_txt_botao+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       40
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       20
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,537 :: 		Glcd_Write_Text_Adv("botao:", 5, 20);
	MOVLW       ?lstr15_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr15_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       20
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,538 :: 		delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_tratamento_botoes35:
	DECFSZ      R13, 1, 1
	BRA         L_tratamento_botoes35
	DECFSZ      R12, 1, 1
	BRA         L_tratamento_botoes35
	DECFSZ      R11, 1, 1
	BRA         L_tratamento_botoes35
	NOP
	NOP
;TCC.c,540 :: 		}
L_tratamento_botoes33:
;TCC.c,542 :: 		if(botao >= 80 && botao <= 100){
	MOVLW       128
	XORWF       _botao+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes137
	MOVLW       80
	SUBWF       _botao+0, 0 
L__tratamento_botoes137:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes38
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _botao+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes138
	MOVF        _botao+0, 0 
	SUBLW       100
L__tratamento_botoes138:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes38
L__tratamento_botoes116:
;TCC.c,543 :: 		liga_rede();
	CALL        _liga_rede+0, 0
;TCC.c,544 :: 		}
L_tratamento_botoes38:
;TCC.c,546 :: 		if(botao >= 170 && botao <= 190){
	MOVLW       128
	XORWF       _botao+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes139
	MOVLW       170
	SUBWF       _botao+0, 0 
L__tratamento_botoes139:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes41
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _botao+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes140
	MOVF        _botao+0, 0 
	SUBLW       190
L__tratamento_botoes140:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes41
L__tratamento_botoes115:
;TCC.c,547 :: 		desliga_carga();
	CALL        _desliga_carga+0, 0
;TCC.c,548 :: 		}
L_tratamento_botoes41:
;TCC.c,550 :: 		if(botao >= 310 && botao <= 330){
	MOVLW       128
	XORWF       _botao+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       1
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes141
	MOVLW       54
	SUBWF       _botao+0, 0 
L__tratamento_botoes141:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes44
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       _botao+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes142
	MOVF        _botao+0, 0 
	SUBLW       74
L__tratamento_botoes142:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes44
L__tratamento_botoes114:
;TCC.c,551 :: 		liga_gerador();
	CALL        _liga_gerador+0, 0
;TCC.c,553 :: 		}
L_tratamento_botoes44:
;TCC.c,555 :: 		if(botao >= 980 && botao <= 1000){
	MOVLW       128
	XORWF       _botao+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       3
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes143
	MOVLW       212
	SUBWF       _botao+0, 0 
L__tratamento_botoes143:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes47
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       _botao+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes144
	MOVF        _botao+0, 0 
	SUBLW       232
L__tratamento_botoes144:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes47
L__tratamento_botoes113:
;TCC.c,556 :: 		Glcd_Write_Text_Adv("esquerda", 5, 30);
	MOVLW       ?lstr16_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr16_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,557 :: 		if(pos_painel > 0){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _pos_painel+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes145
	MOVF        _pos_painel+0, 0 
	SUBLW       0
L__tratamento_botoes145:
	BTFSC       STATUS+0, 0 
	GOTO        L_tratamento_botoes48
;TCC.c,558 :: 		pos_painel--;
	MOVLW       1
	SUBWF       _pos_painel+0, 1 
	MOVLW       0
	SUBWFB      _pos_painel+1, 1 
;TCC.c,559 :: 		}
	GOTO        L_tratamento_botoes49
L_tratamento_botoes48:
;TCC.c,561 :: 		pos_painel = max_tela;
	MOVF        _max_tela+0, 0 
	MOVWF       _pos_painel+0 
	MOVF        _max_tela+1, 0 
	MOVWF       _pos_painel+1 
;TCC.c,562 :: 		}
L_tratamento_botoes49:
;TCC.c,563 :: 		carregar_tela = 1;                                                 // esta variavel faz com que a tela seja carregada apanas uma vez
	MOVLW       1
	MOVWF       _carregar_tela+0 
	MOVLW       0
	MOVWF       _carregar_tela+1 
;TCC.c,565 :: 		}
L_tratamento_botoes47:
;TCC.c,567 :: 		if (botao >= 830 && botao <= 850){
	MOVLW       128
	XORWF       _botao+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       3
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes146
	MOVLW       62
	SUBWF       _botao+0, 0 
L__tratamento_botoes146:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes52
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       _botao+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes147
	MOVF        _botao+0, 0 
	SUBLW       82
L__tratamento_botoes147:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes52
L__tratamento_botoes112:
;TCC.c,568 :: 		Glcd_Write_Text_Adv("direita", 5, 30);
	MOVLW       ?lstr17_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr17_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,569 :: 		if(pos_painel < max_tela){
	MOVLW       128
	XORWF       _pos_painel+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _max_tela+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes148
	MOVF        _max_tela+0, 0 
	SUBWF       _pos_painel+0, 0 
L__tratamento_botoes148:
	BTFSC       STATUS+0, 0 
	GOTO        L_tratamento_botoes53
;TCC.c,570 :: 		pos_painel++;
	INFSNZ      _pos_painel+0, 1 
	INCF        _pos_painel+1, 1 
;TCC.c,571 :: 		}
	GOTO        L_tratamento_botoes54
L_tratamento_botoes53:
;TCC.c,573 :: 		pos_painel = 0;
	CLRF        _pos_painel+0 
	CLRF        _pos_painel+1 
;TCC.c,574 :: 		}
L_tratamento_botoes54:
;TCC.c,575 :: 		carregar_tela = 1;                                                  // esta variavel faz com que a tela seja carregada apanas uma vez
	MOVLW       1
	MOVWF       _carregar_tela+0 
	MOVLW       0
	MOVWF       _carregar_tela+1 
;TCC.c,576 :: 		}
L_tratamento_botoes52:
;TCC.c,578 :: 		if (botao >= 590 && botao <= 610){
	MOVLW       128
	XORWF       _botao+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       2
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes149
	MOVLW       78
	SUBWF       _botao+0, 0 
L__tratamento_botoes149:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes57
	MOVLW       128
	XORLW       2
	MOVWF       R0 
	MOVLW       128
	XORWF       _botao+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes150
	MOVF        _botao+0, 0 
	SUBLW       98
L__tratamento_botoes150:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes57
L__tratamento_botoes111:
;TCC.c,579 :: 		Glcd_Write_Text_Adv("liga calibracao", 5, 30);
	MOVLW       ?lstr18_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr18_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,580 :: 		calibrar = 1;                                                       //ativa o modo calibração
	MOVLW       1
	MOVWF       _calibrar+0 
	MOVLW       0
	MOVWF       _calibrar+1 
;TCC.c,581 :: 		}
L_tratamento_botoes57:
;TCC.c,583 :: 		if (botao >= 680 && botao <= 700) {
	MOVLW       128
	XORWF       _botao+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       2
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes151
	MOVLW       168
	SUBWF       _botao+0, 0 
L__tratamento_botoes151:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes60
	MOVLW       128
	XORLW       2
	MOVWF       R0 
	MOVLW       128
	XORWF       _botao+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tratamento_botoes152
	MOVF        _botao+0, 0 
	SUBLW       188
L__tratamento_botoes152:
	BTFSS       STATUS+0, 0 
	GOTO        L_tratamento_botoes60
L__tratamento_botoes110:
;TCC.c,584 :: 		Glcd_Write_Text_Adv("desliga calibracao", 5, 30);
	MOVLW       ?lstr19_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr19_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,585 :: 		calibrar = 0;                                                       //desativa o modo calibração
	CLRF        _calibrar+0 
	CLRF        _calibrar+1 
;TCC.c,586 :: 		}
L_tratamento_botoes60:
;TCC.c,587 :: 		}
L_end_tratamento_botoes:
	RETURN      0
; end of _tratamento_botoes

_exibe_tensaoVcc:

;TCC.c,589 :: 		void exibe_tensaoVcc(){
;TCC.c,590 :: 		int ajuste = 15;
	MOVLW       15
	MOVWF       exibe_tensaoVcc_ajuste_L0+0 
	MOVLW       0
	MOVWF       exibe_tensaoVcc_ajuste_L0+1 
;TCC.c,593 :: 		store_Vcc = calcula_TensaoVcc();
	CALL        _calcula_tensaoVcc+0, 0
	CALL        _longint2double+0, 0
	MOVF        R0, 0 
	MOVWF       _store_Vcc+0 
	MOVF        R1, 0 
	MOVWF       _store_Vcc+1 
	MOVF        R2, 0 
	MOVWF       _store_Vcc+2 
	MOVF        R3, 0 
	MOVWF       _store_Vcc+3 
;TCC.c,594 :: 		tensaoVcc = (store_Vcc*20)/1023;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _tensaoVcc+0 
	MOVF        R1, 0 
	MOVWF       _tensaoVcc+1 
	MOVF        R2, 0 
	MOVWF       _tensaoVcc+2 
	MOVF        R3, 0 
	MOVWF       _tensaoVcc+3 
;TCC.c,595 :: 		FloatToStr_FixLen(tensaoVcc, txt_tensao_vcc, 4);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+3 
	MOVLW       _txt_tensao_vcc+0
	MOVWF       FARG_FloatToStr_FixLen_str+0 
	MOVLW       hi_addr(_txt_tensao_vcc+0)
	MOVWF       FARG_FloatToStr_FixLen_str+1 
	MOVLW       4
	MOVWF       FARG_FloatToStr_FixLen_len+0 
	CALL        _FloatToStr_FixLen+0, 0
;TCC.c,596 :: 		ltrim(txt_tensao_vcc);
	MOVLW       _txt_tensao_vcc+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt_tensao_vcc+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;TCC.c,598 :: 		if(store_Vcc >= anterior+ajuste || store_Vcc <= anterior-ajuste){
	MOVF        exibe_tensaoVcc_ajuste_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_tensaoVcc_ajuste_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        exibe_tensaoVcc_anterior_L0+0, 0 
	MOVWF       R4 
	MOVF        exibe_tensaoVcc_anterior_L0+1, 0 
	MOVWF       R5 
	MOVF        exibe_tensaoVcc_anterior_L0+2, 0 
	MOVWF       R6 
	MOVF        exibe_tensaoVcc_anterior_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _store_Vcc+0, 0 
	MOVWF       R0 
	MOVF        _store_Vcc+1, 0 
	MOVWF       R1 
	MOVF        _store_Vcc+2, 0 
	MOVWF       R2 
	MOVF        _store_Vcc+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__exibe_tensaoVcc117
	MOVF        exibe_tensaoVcc_ajuste_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_tensaoVcc_ajuste_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        exibe_tensaoVcc_anterior_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_tensaoVcc_anterior_L0+1, 0 
	MOVWF       R1 
	MOVF        exibe_tensaoVcc_anterior_L0+2, 0 
	MOVWF       R2 
	MOVF        exibe_tensaoVcc_anterior_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        _store_Vcc+0, 0 
	MOVWF       R4 
	MOVF        _store_Vcc+1, 0 
	MOVWF       R5 
	MOVF        _store_Vcc+2, 0 
	MOVWF       R6 
	MOVF        _store_Vcc+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__exibe_tensaoVcc117
	GOTO        L_exibe_tensaoVcc63
L__exibe_tensaoVcc117:
;TCC.c,599 :: 		Glcd_Box(70, 15, 89, 30, 0);
	MOVLW       70
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       15
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       89
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       30
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,600 :: 		strcpy(tensao_VccAnterior, txt_tensao_Vcc);
	MOVLW       _tensao_VccAnterior+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tensao_VccAnterior+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _txt_tensao_vcc+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_txt_tensao_vcc+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;TCC.c,601 :: 		Glcd_Write_Text_Adv("Bateria: ", 10, 15);
	MOVLW       ?lstr20_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr20_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       15
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,602 :: 		Glcd_Write_Text_Adv(txt_tensao_Vcc, 70, 15);
	MOVLW       _txt_tensao_vcc+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_txt_tensao_vcc+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       70
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       15
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,603 :: 		Glcd_Write_Text_Adv("V ", 90, 15);
	MOVLW       ?lstr21_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr21_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       90
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       15
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,604 :: 		anterior = store_Vcc;
	MOVF        _store_Vcc+0, 0 
	MOVWF       exibe_tensaoVcc_anterior_L0+0 
	MOVF        _store_Vcc+1, 0 
	MOVWF       exibe_tensaoVcc_anterior_L0+1 
	MOVF        _store_Vcc+2, 0 
	MOVWF       exibe_tensaoVcc_anterior_L0+2 
	MOVF        _store_Vcc+3, 0 
	MOVWF       exibe_tensaoVcc_anterior_L0+3 
;TCC.c,605 :: 		}
L_exibe_tensaoVcc63:
;TCC.c,606 :: 		}
L_end_exibe_tensaoVcc:
	RETURN      0
; end of _exibe_tensaoVcc

_exibe_temperatura:

;TCC.c,608 :: 		void exibe_temperatura(){
;TCC.c,609 :: 		int ajuste = 5;
	MOVLW       5
	MOVWF       exibe_temperatura_ajuste_L0+0 
	MOVLW       0
	MOVWF       exibe_temperatura_ajuste_L0+1 
;TCC.c,612 :: 		store_temp = calcula_temperatura()*5;
	CALL        _calcula_temperatura+0, 0
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	CALL        _longint2double+0, 0
	MOVF        R0, 0 
	MOVWF       _store_temp+0 
	MOVF        R1, 0 
	MOVWF       _store_temp+1 
	MOVF        R2, 0 
	MOVWF       _store_temp+2 
	MOVF        R3, 0 
	MOVWF       _store_temp+3 
;TCC.c,613 :: 		temp_motor = (store_temp/1023)*100;
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp_motor+0 
	MOVF        R1, 0 
	MOVWF       _temp_motor+1 
	MOVF        R2, 0 
	MOVWF       _temp_motor+2 
	MOVF        R3, 0 
	MOVWF       _temp_motor+3 
;TCC.c,614 :: 		FloatToStr_FixLen(temp_motor, txt_temp_motor, 4);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+3 
	MOVLW       _txt_temp_motor+0
	MOVWF       FARG_FloatToStr_FixLen_str+0 
	MOVLW       hi_addr(_txt_temp_motor+0)
	MOVWF       FARG_FloatToStr_FixLen_str+1 
	MOVLW       4
	MOVWF       FARG_FloatToStr_FixLen_len+0 
	CALL        _FloatToStr_FixLen+0, 0
;TCC.c,615 :: 		ltrim(txt_temp_motor);
	MOVLW       _txt_temp_motor+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt_temp_motor+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;TCC.c,617 :: 		if(store_temp >= anterior+ajuste || store_temp <= anterior-ajuste){
	MOVF        exibe_temperatura_ajuste_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_temperatura_ajuste_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        exibe_temperatura_anterior_L0+0, 0 
	MOVWF       R4 
	MOVF        exibe_temperatura_anterior_L0+1, 0 
	MOVWF       R5 
	MOVF        exibe_temperatura_anterior_L0+2, 0 
	MOVWF       R6 
	MOVF        exibe_temperatura_anterior_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _store_temp+0, 0 
	MOVWF       R0 
	MOVF        _store_temp+1, 0 
	MOVWF       R1 
	MOVF        _store_temp+2, 0 
	MOVWF       R2 
	MOVF        _store_temp+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__exibe_temperatura118
	MOVF        exibe_temperatura_ajuste_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_temperatura_ajuste_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        exibe_temperatura_anterior_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_temperatura_anterior_L0+1, 0 
	MOVWF       R1 
	MOVF        exibe_temperatura_anterior_L0+2, 0 
	MOVWF       R2 
	MOVF        exibe_temperatura_anterior_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        _store_temp+0, 0 
	MOVWF       R4 
	MOVF        _store_temp+1, 0 
	MOVWF       R5 
	MOVF        _store_temp+2, 0 
	MOVWF       R6 
	MOVF        _store_temp+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__exibe_temperatura118
	GOTO        L_exibe_temperatura66
L__exibe_temperatura118:
;TCC.c,618 :: 		Glcd_Box(70, 15, 89, 30, 0);
	MOVLW       70
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       15
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       89
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       30
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,619 :: 		strcpy(temp_motorAnterior, txt_temp_motor);
	MOVLW       _temp_motorAnterior+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_temp_motorAnterior+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _txt_temp_motor+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_txt_temp_motor+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;TCC.c,620 :: 		Glcd_Write_Text_Adv("Temperatura: ", 10, 15);
	MOVLW       ?lstr22_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr22_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       10
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       15
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,621 :: 		Glcd_Write_Text_Adv(txt_temp_motor, 70, 15);
	MOVLW       _txt_temp_motor+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_txt_temp_motor+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       70
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       15
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,622 :: 		Glcd_Write_Text_Adv("C ", 90, 15);
	MOVLW       ?lstr23_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr23_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       90
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       15
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,623 :: 		anterior = store_temp;
	MOVF        _store_temp+0, 0 
	MOVWF       exibe_temperatura_anterior_L0+0 
	MOVF        _store_temp+1, 0 
	MOVWF       exibe_temperatura_anterior_L0+1 
	MOVF        _store_temp+2, 0 
	MOVWF       exibe_temperatura_anterior_L0+2 
	MOVF        _store_temp+3, 0 
	MOVWF       exibe_temperatura_anterior_L0+3 
;TCC.c,624 :: 		}
L_exibe_temperatura66:
;TCC.c,625 :: 		}
L_end_exibe_temperatura:
	RETURN      0
; end of _exibe_temperatura

_exibe_tensaoVcc_terminal:

;TCC.c,629 :: 		void exibe_tensaoVcc_terminal(){
;TCC.c,630 :: 		int ajuste = 15;
	MOVLW       15
	MOVWF       exibe_tensaoVcc_terminal_ajuste_L0+0 
	MOVLW       0
	MOVWF       exibe_tensaoVcc_terminal_ajuste_L0+1 
;TCC.c,633 :: 		store_Vcc = calcula_TensaoVcc();
	CALL        _calcula_tensaoVcc+0, 0
	CALL        _longint2double+0, 0
	MOVF        R0, 0 
	MOVWF       _store_Vcc+0 
	MOVF        R1, 0 
	MOVWF       _store_Vcc+1 
	MOVF        R2, 0 
	MOVWF       _store_Vcc+2 
	MOVF        R3, 0 
	MOVWF       _store_Vcc+3 
;TCC.c,634 :: 		tensaoVcc = (store_Vcc*20)/1023;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _tensaoVcc+0 
	MOVF        R1, 0 
	MOVWF       _tensaoVcc+1 
	MOVF        R2, 0 
	MOVWF       _tensaoVcc+2 
	MOVF        R3, 0 
	MOVWF       _tensaoVcc+3 
;TCC.c,635 :: 		FloatToStr_FixLen(tensaoVcc, txt_tensao_vcc, 4);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+3 
	MOVLW       _txt_tensao_vcc+0
	MOVWF       FARG_FloatToStr_FixLen_str+0 
	MOVLW       hi_addr(_txt_tensao_vcc+0)
	MOVWF       FARG_FloatToStr_FixLen_str+1 
	MOVLW       4
	MOVWF       FARG_FloatToStr_FixLen_len+0 
	CALL        _FloatToStr_FixLen+0, 0
;TCC.c,636 :: 		ltrim(txt_tensao_vcc);
	MOVLW       _txt_tensao_vcc+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt_tensao_vcc+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;TCC.c,638 :: 		if(store_Vcc >= anterior+ajuste || store_Vcc <= anterior-ajuste){
	MOVF        exibe_tensaoVcc_terminal_ajuste_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_tensaoVcc_terminal_ajuste_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        exibe_tensaoVcc_terminal_anterior_L0+0, 0 
	MOVWF       R4 
	MOVF        exibe_tensaoVcc_terminal_anterior_L0+1, 0 
	MOVWF       R5 
	MOVF        exibe_tensaoVcc_terminal_anterior_L0+2, 0 
	MOVWF       R6 
	MOVF        exibe_tensaoVcc_terminal_anterior_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _store_Vcc+0, 0 
	MOVWF       R0 
	MOVF        _store_Vcc+1, 0 
	MOVWF       R1 
	MOVF        _store_Vcc+2, 0 
	MOVWF       R2 
	MOVF        _store_Vcc+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__exibe_tensaoVcc_terminal119
	MOVF        exibe_tensaoVcc_terminal_ajuste_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_tensaoVcc_terminal_ajuste_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        exibe_tensaoVcc_terminal_anterior_L0+0, 0 
	MOVWF       R0 
	MOVF        exibe_tensaoVcc_terminal_anterior_L0+1, 0 
	MOVWF       R1 
	MOVF        exibe_tensaoVcc_terminal_anterior_L0+2, 0 
	MOVWF       R2 
	MOVF        exibe_tensaoVcc_terminal_anterior_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        _store_Vcc+0, 0 
	MOVWF       R4 
	MOVF        _store_Vcc+1, 0 
	MOVWF       R5 
	MOVF        _store_Vcc+2, 0 
	MOVWF       R6 
	MOVF        _store_Vcc+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__exibe_tensaoVcc_terminal119
	GOTO        L_exibe_tensaoVcc_terminal69
L__exibe_tensaoVcc_terminal119:
;TCC.c,639 :: 		strcpy(tensao_VccAnterior, txt_tensao_Vcc);
	MOVLW       _tensao_VccAnterior+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_tensao_VccAnterior+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _txt_tensao_vcc+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_txt_tensao_vcc+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;TCC.c,640 :: 		anterior = store_Vcc;
	MOVF        _store_Vcc+0, 0 
	MOVWF       exibe_tensaoVcc_terminal_anterior_L0+0 
	MOVF        _store_Vcc+1, 0 
	MOVWF       exibe_tensaoVcc_terminal_anterior_L0+1 
	MOVF        _store_Vcc+2, 0 
	MOVWF       exibe_tensaoVcc_terminal_anterior_L0+2 
	MOVF        _store_Vcc+3, 0 
	MOVWF       exibe_tensaoVcc_terminal_anterior_L0+3 
;TCC.c,642 :: 		}
L_exibe_tensaoVcc_terminal69:
;TCC.c,643 :: 		UART1_write_text("Bateria: ");
	MOVLW       ?lstr24_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr24_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,644 :: 		UART1_write_text(txt_tensao_Vcc);
	MOVLW       _txt_tensao_vcc+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_txt_tensao_vcc+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,645 :: 		UART1_write_text(" V");
	MOVLW       ?lstr25_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr25_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,646 :: 		UART1_write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,647 :: 		UART1_write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,648 :: 		}
L_end_exibe_tensaoVcc_terminal:
	RETURN      0
; end of _exibe_tensaoVcc_terminal

_calcula_tensaoVcc:

;TCC.c,650 :: 		long calcula_tensaoVcc(){
;TCC.c,652 :: 		float volt_store = 0;
	CLRF        calcula_tensaoVcc_volt_store_L0+0 
	CLRF        calcula_tensaoVcc_volt_store_L0+1 
	CLRF        calcula_tensaoVcc_volt_store_L0+2 
	CLRF        calcula_tensaoVcc_volt_store_L0+3 
;TCC.c,654 :: 		for(i = 0; i < 100 ; i++){
	CLRF        calcula_tensaoVcc_i_L0+0 
L_calcula_tensaoVcc70:
	MOVLW       100
	SUBWF       calcula_tensaoVcc_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_calcula_tensaoVcc71
;TCC.c,655 :: 		volt_store += adc_read(3);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVF        calcula_tensaoVcc_volt_store_L0+0, 0 
	MOVWF       R4 
	MOVF        calcula_tensaoVcc_volt_store_L0+1, 0 
	MOVWF       R5 
	MOVF        calcula_tensaoVcc_volt_store_L0+2, 0 
	MOVWF       R6 
	MOVF        calcula_tensaoVcc_volt_store_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       calcula_tensaoVcc_volt_store_L0+0 
	MOVF        R1, 0 
	MOVWF       calcula_tensaoVcc_volt_store_L0+1 
	MOVF        R2, 0 
	MOVWF       calcula_tensaoVcc_volt_store_L0+2 
	MOVF        R3, 0 
	MOVWF       calcula_tensaoVcc_volt_store_L0+3 
;TCC.c,654 :: 		for(i = 0; i < 100 ; i++){
	INCF        calcula_tensaoVcc_i_L0+0, 1 
;TCC.c,656 :: 		}
	GOTO        L_calcula_tensaoVcc70
L_calcula_tensaoVcc71:
;TCC.c,658 :: 		return(volt_store/100);
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        calcula_tensaoVcc_volt_store_L0+0, 0 
	MOVWF       R0 
	MOVF        calcula_tensaoVcc_volt_store_L0+1, 0 
	MOVWF       R1 
	MOVF        calcula_tensaoVcc_volt_store_L0+2, 0 
	MOVWF       R2 
	MOVF        calcula_tensaoVcc_volt_store_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2longint+0, 0
;TCC.c,659 :: 		}
L_end_calcula_tensaoVcc:
	RETURN      0
; end of _calcula_tensaoVcc

_exibe_tensaoVca:

;TCC.c,661 :: 		void exibe_tensaoVca(){
;TCC.c,663 :: 		for (i = 0; i < 200; i++){
	CLRF        exibe_tensaoVca_i_L0+0 
L_exibe_tensaoVca73:
	MOVLW       200
	SUBWF       exibe_tensaoVca_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_exibe_tensaoVca74
;TCC.c,664 :: 		tensao_rede_r += adc_read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	ADDWF       _tensao_rede_r+0, 1 
	MOVF        R1, 0 
	ADDWFC      _tensao_rede_r+1, 1 
	MOVLW       0
	ADDWFC      _tensao_rede_r+2, 1 
	ADDWFC      _tensao_rede_r+3, 1 
;TCC.c,665 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_exibe_tensaoVca76:
	DECFSZ      R13, 1, 1
	BRA         L_exibe_tensaoVca76
	DECFSZ      R12, 1, 1
	BRA         L_exibe_tensaoVca76
;TCC.c,663 :: 		for (i = 0; i < 200; i++){
	INCF        exibe_tensaoVca_i_L0+0, 1 
;TCC.c,666 :: 		}
	GOTO        L_exibe_tensaoVca73
L_exibe_tensaoVca74:
;TCC.c,668 :: 		tensao_rede_r = tensao_rede_r / 200;
	MOVLW       200
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        _tensao_rede_r+0, 0 
	MOVWF       R0 
	MOVF        _tensao_rede_r+1, 0 
	MOVWF       R1 
	MOVF        _tensao_rede_r+2, 0 
	MOVWF       R2 
	MOVF        _tensao_rede_r+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       _tensao_rede_r+0 
	MOVF        R1, 0 
	MOVWF       _tensao_rede_r+1 
	MOVF        R2, 0 
	MOVWF       _tensao_rede_r+2 
	MOVF        R3, 0 
	MOVWF       _tensao_rede_r+3 
;TCC.c,670 :: 		if(tensao_rede_r != tensao_anterior_rede_r){
	CALL        _longint2double+0, 0
	MOVF        _tensao_anterior_rede_r+0, 0 
	MOVWF       R4 
	MOVF        _tensao_anterior_rede_r+1, 0 
	MOVWF       R5 
	MOVF        _tensao_anterior_rede_r+2, 0 
	MOVWF       R6 
	MOVF        _tensao_anterior_rede_r+3, 0 
	MOVWF       R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_exibe_tensaoVca77
;TCC.c,671 :: 		Glcd_Box(60, 5, 100, 30, 0);
	MOVLW       60
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       5
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       100
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       30
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,672 :: 		tensao_anterior_rede_r = tensao_rede_r;
	MOVF        _tensao_rede_r+0, 0 
	MOVWF       R0 
	MOVF        _tensao_rede_r+1, 0 
	MOVWF       R1 
	MOVF        _tensao_rede_r+2, 0 
	MOVWF       R2 
	MOVF        _tensao_rede_r+3, 0 
	MOVWF       R3 
	CALL        _longint2double+0, 0
	MOVF        R0, 0 
	MOVWF       _tensao_anterior_rede_r+0 
	MOVF        R1, 0 
	MOVWF       _tensao_anterior_rede_r+1 
	MOVF        R2, 0 
	MOVWF       _tensao_anterior_rede_r+2 
	MOVF        R3, 0 
	MOVWF       _tensao_anterior_rede_r+3 
;TCC.c,673 :: 		tensao_rede_r = tensao_rede_r * 0.244140625;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       _tensao_rede_r+0 
	MOVF        R1, 0 
	MOVWF       _tensao_rede_r+1 
	MOVF        R2, 0 
	MOVWF       _tensao_rede_r+2 
	MOVF        R3, 0 
	MOVWF       _tensao_rede_r+3 
;TCC.c,674 :: 		IntToStr(tensao_rede_r, txt_tensao_rede_r);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt_tensao_rede_r+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt_tensao_rede_r+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;TCC.c,675 :: 		ltrim(txt_tensao_rede_r);
	MOVLW       _txt_tensao_rede_r+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt_tensao_rede_r+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;TCC.c,676 :: 		Glcd_Write_Text_Adv("Tensao R: ", 5, 5);
	MOVLW       ?lstr26_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr26_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,677 :: 		Glcd_Write_Text_Adv(txt_tensao_rede_r, 60, 5);
	MOVLW       _txt_tensao_rede_r+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_txt_tensao_rede_r+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       60
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,678 :: 		Glcd_Write_Text_Adv("V", 80, 5);
	MOVLW       ?lstr27_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr27_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       80
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       5
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,679 :: 		}
L_exibe_tensaoVca77:
;TCC.c,680 :: 		}
L_end_exibe_tensaoVca:
	RETURN      0
; end of _exibe_tensaoVca

_calcula_temperatura:

;TCC.c,682 :: 		long calcula_temperatura(){
;TCC.c,684 :: 		float temp_store = 0;
	CLRF        calcula_temperatura_temp_store_L0+0 
	CLRF        calcula_temperatura_temp_store_L0+1 
	CLRF        calcula_temperatura_temp_store_L0+2 
	CLRF        calcula_temperatura_temp_store_L0+3 
;TCC.c,686 :: 		for(i = 0; i < 100 ; i++){
	CLRF        calcula_temperatura_i_L0+0 
L_calcula_temperatura78:
	MOVLW       100
	SUBWF       calcula_temperatura_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_calcula_temperatura79
;TCC.c,687 :: 		temp_store += adc_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVF        calcula_temperatura_temp_store_L0+0, 0 
	MOVWF       R4 
	MOVF        calcula_temperatura_temp_store_L0+1, 0 
	MOVWF       R5 
	MOVF        calcula_temperatura_temp_store_L0+2, 0 
	MOVWF       R6 
	MOVF        calcula_temperatura_temp_store_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       calcula_temperatura_temp_store_L0+0 
	MOVF        R1, 0 
	MOVWF       calcula_temperatura_temp_store_L0+1 
	MOVF        R2, 0 
	MOVWF       calcula_temperatura_temp_store_L0+2 
	MOVF        R3, 0 
	MOVWF       calcula_temperatura_temp_store_L0+3 
;TCC.c,686 :: 		for(i = 0; i < 100 ; i++){
	INCF        calcula_temperatura_i_L0+0, 1 
;TCC.c,688 :: 		}
	GOTO        L_calcula_temperatura78
L_calcula_temperatura79:
;TCC.c,690 :: 		return(temp_store/100);
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        calcula_temperatura_temp_store_L0+0, 0 
	MOVWF       R0 
	MOVF        calcula_temperatura_temp_store_L0+1, 0 
	MOVWF       R1 
	MOVF        calcula_temperatura_temp_store_L0+2, 0 
	MOVWF       R2 
	MOVF        calcula_temperatura_temp_store_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2longint+0, 0
;TCC.c,691 :: 		}
L_end_calcula_temperatura:
	RETURN      0
; end of _calcula_temperatura

_tela:

;TCC.c,693 :: 		void tela(char *_menu){
;TCC.c,694 :: 		if(carregar_tela == 1){                                            // Verifica se a tela ja foi carregada
	MOVLW       0
	XORWF       _carregar_tela+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tela160
	MOVLW       1
	XORWF       _carregar_tela+0, 0 
L__tela160:
	BTFSS       STATUS+0, 2 
	GOTO        L_tela81
;TCC.c,695 :: 		Glcd_Rectangle(0,0,127, 63, 1);                                // Cria a borda da tela
	CLRF        FARG_Glcd_Rectangle_x_upper_left+0 
	CLRF        FARG_Glcd_Rectangle_y_upper_left+0 
	MOVLW       127
	MOVWF       FARG_Glcd_Rectangle_x_bottom_right+0 
	MOVLW       63
	MOVWF       FARG_Glcd_Rectangle_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Rectangle_color+0 
	CALL        _Glcd_Rectangle+0, 0
;TCC.c,696 :: 		Glcd_box(0, 0, 127, 12, 1);                                    // Cria a faixa preta de título
	CLRF        FARG_Glcd_Box_x_upper_left+0 
	CLRF        FARG_Glcd_Box_y_upper_left+0 
	MOVLW       127
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       12
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,697 :: 		Glcd_Set_Font_Adv(Glcd_defaultFont, 0, 0);                     // Troca a cor padrão da fonte para "branco"
	MOVLW       _Glcd_defaultFont+0
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	CLRF        FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;TCC.c,698 :: 		Glcd_Write_Text_Adv(_menu, 30, 1);                             // Escreve o nome do menu, que será "puxado" do switch contido no main
	MOVF        FARG_tela__menu+0, 0 
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVF        FARG_tela__menu+1, 0 
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       30
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,699 :: 		Glcd_Set_Font_Adv(Glcd_defaultFont, 1, 0);                     // Volta a cor padrão de fonte para "preto"
	MOVLW       _Glcd_defaultFont+0
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	MOVLW       1
	MOVWF       FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;TCC.c,700 :: 		carregar_tela = 0;
	CLRF        _carregar_tela+0 
	CLRF        _carregar_tela+1 
;TCC.c,701 :: 		carregar_subTela = 1;                                          // Permite que a subtela seja carregada
	MOVLW       1
	MOVWF       _carregar_subTela+0 
	MOVLW       0
	MOVWF       _carregar_subTela+1 
;TCC.c,703 :: 		}
L_tela81:
;TCC.c,704 :: 		}
L_end_tela:
	RETURN      0
; end of _tela

_tela_principal:

;TCC.c,706 :: 		void tela_principal(){
;TCC.c,707 :: 		if(carregar_subTela == 1){                                         // Verifica se a subtela(local onde aparecem as informações ja foi carregada
	MOVLW       0
	XORWF       _carregar_subTela+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tela_principal162
	MOVLW       1
	XORWF       _carregar_subTela+0, 0 
L__tela_principal162:
	BTFSS       STATUS+0, 2 
	GOTO        L_tela_principal82
;TCC.c,708 :: 		Glcd_box(1, 13, 126, 62, 0);
	MOVLW       1
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       13
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       126
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       62
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,709 :: 		carregar_barraCarga = 1;
	MOVLW       1
	MOVWF       _carregar_barraCarga+0 
	MOVLW       0
	MOVWF       _carregar_barraCarga+1 
;TCC.c,710 :: 		carregar_subTela = 0;
	CLRF        _carregar_subTela+0 
	CLRF        _carregar_subTela+1 
;TCC.c,711 :: 		}
L_tela_principal82:
;TCC.c,714 :: 		if(carregar_barraCarga == 1){
	MOVLW       0
	XORWF       _carregar_barraCarga+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tela_principal163
	MOVLW       1
	XORWF       _carregar_barraCarga+0, 0 
L__tela_principal163:
	BTFSS       STATUS+0, 2 
	GOTO        L_tela_principal83
;TCC.c,715 :: 		GLCD_rectangle(0, 51, 127, 63, 1);
	CLRF        FARG_Glcd_Rectangle_x_upper_left+0 
	MOVLW       51
	MOVWF       FARG_Glcd_Rectangle_y_upper_left+0 
	MOVLW       127
	MOVWF       FARG_Glcd_Rectangle_x_bottom_right+0 
	MOVLW       63
	MOVWF       FARG_Glcd_Rectangle_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Rectangle_color+0 
	CALL        _Glcd_Rectangle+0, 0
;TCC.c,716 :: 		GLCD_box(1, 52, 126, 62, 0);
	MOVLW       1
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       52
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       126
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       62
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,717 :: 		switch(carga){
	GOTO        L_tela_principal84
;TCC.c,718 :: 		case 0:
L_tela_principal86:
;TCC.c,719 :: 		Glcd_Write_Text_Adv("REDE", 6, 52);
	MOVLW       ?lstr28_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr28_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       6
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,720 :: 		Glcd_box(43,51,85, 62, 1);
	MOVLW       43
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       51
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       85
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       62
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,721 :: 		Glcd_Set_Font_Adv(Glcd_defaultFont, 0, 0);
	MOVLW       _Glcd_defaultFont+0
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	CLRF        FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;TCC.c,722 :: 		Glcd_Write_Text_Adv("OFF", 55, 52);
	MOVLW       ?lstr29_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr29_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       55
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,723 :: 		Glcd_Set_Font_Adv(Glcd_defaultFont, 1, 0);
	MOVLW       _Glcd_defaultFont+0
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	MOVLW       1
	MOVWF       FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;TCC.c,724 :: 		Glcd_Write_Text_Adv("GMG", 96, 52);
	MOVLW       ?lstr30_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr30_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       96
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,725 :: 		carregar_barraCarga = 0;
	CLRF        _carregar_barraCarga+0 
	CLRF        _carregar_barraCarga+1 
;TCC.c,726 :: 		break;
	GOTO        L_tela_principal85
;TCC.c,727 :: 		case 1:
L_tela_principal87:
;TCC.c,728 :: 		Glcd_box(1,51,42, 62, 1);
	MOVLW       1
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       51
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       42
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       62
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,729 :: 		Glcd_Set_Font_Adv(Glcd_defaultFont, 0, 0);
	MOVLW       _Glcd_defaultFont+0
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	CLRF        FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;TCC.c,730 :: 		Glcd_Write_Text_Adv("REDE", 6, 52);
	MOVLW       ?lstr31_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr31_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       6
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,731 :: 		Glcd_Set_Font_Adv(Glcd_defaultFont, 1, 0);
	MOVLW       _Glcd_defaultFont+0
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	MOVLW       1
	MOVWF       FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;TCC.c,732 :: 		Glcd_Write_Text_Adv("OFF", 55, 52);
	MOVLW       ?lstr32_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr32_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       55
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,733 :: 		Glcd_Write_Text_Adv("GMG", 96, 52);
	MOVLW       ?lstr33_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr33_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       96
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,734 :: 		carregar_barraCarga = 0;
	CLRF        _carregar_barraCarga+0 
	CLRF        _carregar_barraCarga+1 
;TCC.c,735 :: 		break;
	GOTO        L_tela_principal85
;TCC.c,736 :: 		case 2:
L_tela_principal88:
;TCC.c,737 :: 		Glcd_Write_Text_Adv("REDE", 6, 52);
	MOVLW       ?lstr34_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr34_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       6
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,738 :: 		Glcd_Write_Text_Adv("OFF", 55, 52);
	MOVLW       ?lstr35_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr35_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       55
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,739 :: 		Glcd_box(85,51,126, 62, 1);
	MOVLW       85
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       51
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       126
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       62
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,740 :: 		Glcd_Set_Font_Adv(Glcd_defaultFont, 0, 0);
	MOVLW       _Glcd_defaultFont+0
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	CLRF        FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;TCC.c,741 :: 		Glcd_Write_Text_Adv("GMG", 96, 52);
	MOVLW       ?lstr36_TCC+0
	MOVWF       FARG_Glcd_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr36_TCC+0)
	MOVWF       FARG_Glcd_Write_Text_Adv_text+1 
	MOVLW       96
	MOVWF       FARG_Glcd_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_x+1 
	MOVLW       52
	MOVWF       FARG_Glcd_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_Glcd_Write_Text_Adv_y+1 
	CALL        _Glcd_Write_Text_Adv+0, 0
;TCC.c,742 :: 		Glcd_Set_Font_Adv(Glcd_defaultFont, 1, 0);
	MOVLW       _Glcd_defaultFont+0
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_Glcd_defaultFont+0)
	MOVWF       FARG_Glcd_Set_Font_Adv_activeFont+2 
	MOVLW       1
	MOVWF       FARG_Glcd_Set_Font_Adv_font_color+0 
	CLRF        FARG_Glcd_Set_Font_Adv_font_orientation+0 
	CALL        _Glcd_Set_Font_Adv+0, 0
;TCC.c,743 :: 		carregar_barraCarga = 0;
	CLRF        _carregar_barraCarga+0 
	CLRF        _carregar_barraCarga+1 
;TCC.c,744 :: 		break;
	GOTO        L_tela_principal85
;TCC.c,745 :: 		}
L_tela_principal84:
	MOVLW       0
	XORWF       _carga+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tela_principal164
	MOVLW       0
	XORWF       _carga+0, 0 
L__tela_principal164:
	BTFSC       STATUS+0, 2 
	GOTO        L_tela_principal86
	MOVLW       0
	XORWF       _carga+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tela_principal165
	MOVLW       1
	XORWF       _carga+0, 0 
L__tela_principal165:
	BTFSC       STATUS+0, 2 
	GOTO        L_tela_principal87
	MOVLW       0
	XORWF       _carga+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tela_principal166
	MOVLW       2
	XORWF       _carga+0, 0 
L__tela_principal166:
	BTFSC       STATUS+0, 2 
	GOTO        L_tela_principal88
L_tela_principal85:
;TCC.c,746 :: 		}
L_tela_principal83:
;TCC.c,747 :: 		}
L_end_tela_principal:
	RETURN      0
; end of _tela_principal

_tela_tensaoVCC:

;TCC.c,749 :: 		void tela_tensaoVCC(){
;TCC.c,750 :: 		if(carregar_subTela == 1){                                          // Verifica se a subtela(local onde aparecem as informações ja foi carregada
	MOVLW       0
	XORWF       _carregar_subTela+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tela_tensaoVCC168
	MOVLW       1
	XORWF       _carregar_subTela+0, 0 
L__tela_tensaoVCC168:
	BTFSS       STATUS+0, 2 
	GOTO        L_tela_tensaoVCC89
;TCC.c,751 :: 		Glcd_box(1, 13, 126, 62, 0);
	MOVLW       1
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       13
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       126
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       62
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,752 :: 		carregar_subTela = 0;
	CLRF        _carregar_subTela+0 
	CLRF        _carregar_subTela+1 
;TCC.c,753 :: 		}
L_tela_tensaoVCC89:
;TCC.c,754 :: 		exibe_tensaoVcc();
	CALL        _exibe_tensaoVcc+0, 0
;TCC.c,755 :: 		}
L_end_tela_tensaoVCC:
	RETURN      0
; end of _tela_tensaoVCC

_tela_temperatura:

;TCC.c,757 :: 		void tela_temperatura(){
;TCC.c,758 :: 		if(carregar_subTela == 1){                                          // Verifica se a subtela(local onde aparecem as informações ja foi carregada
	MOVLW       0
	XORWF       _carregar_subTela+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__tela_temperatura170
	MOVLW       1
	XORWF       _carregar_subTela+0, 0 
L__tela_temperatura170:
	BTFSS       STATUS+0, 2 
	GOTO        L_tela_temperatura90
;TCC.c,759 :: 		Glcd_box(1, 13, 126, 62, 0);
	MOVLW       1
	MOVWF       FARG_Glcd_Box_x_upper_left+0 
	MOVLW       13
	MOVWF       FARG_Glcd_Box_y_upper_left+0 
	MOVLW       126
	MOVWF       FARG_Glcd_Box_x_bottom_right+0 
	MOVLW       62
	MOVWF       FARG_Glcd_Box_y_bottom_right+0 
	CLRF        FARG_Glcd_Box_color+0 
	CALL        _Glcd_Box+0, 0
;TCC.c,760 :: 		carregar_subTela = 0;
	CLRF        _carregar_subTela+0 
	CLRF        _carregar_subTela+1 
;TCC.c,761 :: 		}
L_tela_temperatura90:
;TCC.c,762 :: 		exibe_temperatura();
	CALL        _exibe_temperatura+0, 0
;TCC.c,763 :: 		}
L_end_tela_temperatura:
	RETURN      0
; end of _tela_temperatura

_serial_menu:

;TCC.c,766 :: 		void serial_menu(){
;TCC.c,767 :: 		if(UART1_Data_Ready()){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_serial_menu91
;TCC.c,768 :: 		uart_rd = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;TCC.c,771 :: 		if(uart_rd == 'L'){
	MOVF        R0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu92
;TCC.c,772 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,773 :: 		}
L_serial_menu92:
;TCC.c,775 :: 		if(uart_rd == 'x'){
	MOVF        _uart_rd+0, 0 
	XORLW       120
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu93
;TCC.c,776 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,777 :: 		UART1_write_text("Carga Desligada");
	MOVLW       ?lstr37_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr37_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,778 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,779 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,780 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,782 :: 		desliga_carga();
	CALL        _desliga_carga+0, 0
;TCC.c,783 :: 		serial_transferencia();
	CALL        _serial_transferencia+0, 0
;TCC.c,784 :: 		}
L_serial_menu93:
;TCC.c,785 :: 		if(uart_rd == 'z'){
	MOVF        _uart_rd+0, 0 
	XORLW       122
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu94
;TCC.c,786 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,787 :: 		UART1_write_text("Rede Ligada");
	MOVLW       ?lstr38_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr38_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,788 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,789 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,790 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,792 :: 		liga_rede();
	CALL        _liga_rede+0, 0
;TCC.c,793 :: 		serial_transferencia();
	CALL        _serial_transferencia+0, 0
;TCC.c,794 :: 		}
L_serial_menu94:
;TCC.c,795 :: 		if(uart_rd == 'c'){
	MOVF        _uart_rd+0, 0 
	XORLW       99
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu95
;TCC.c,796 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,797 :: 		UART1_write_text("Gerador Ligado");
	MOVLW       ?lstr39_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr39_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,798 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,799 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,800 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,802 :: 		liga_gerador();
	CALL        _liga_gerador+0, 0
;TCC.c,803 :: 		serial_transferencia();
	CALL        _serial_transferencia+0, 0
;TCC.c,804 :: 		}
L_serial_menu95:
;TCC.c,805 :: 		if(uart_rd == 'a'){
	MOVF        _uart_rd+0, 0 
	XORLW       97
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu96
;TCC.c,806 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,807 :: 		UART1_write_text("EQUIPAMENTO EM MODO EMERGENCIA");
	MOVLW       ?lstr40_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr40_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,808 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,809 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,810 :: 		UART1_write_text("Para resetar, pressione o botao de emergencia local");
	MOVLW       ?lstr41_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr41_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,811 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,812 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,813 :: 		UART1_write_text("e siga as intrucoes do terminal");
	MOVLW       ?lstr42_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr42_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,814 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,815 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,816 :: 		emerg = 1;
	MOVLW       1
	MOVWF       _emerg+0 
	MOVLW       0
	MOVWF       _emerg+1 
;TCC.c,817 :: 		UART1_Write(emerg);
	MOVLW       1
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,818 :: 		}
L_serial_menu96:
;TCC.c,819 :: 		if(uart_rd == 's'){
	MOVF        _uart_rd+0, 0 
	XORLW       115
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu97
;TCC.c,820 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,821 :: 		UART1_write_text("MODO EMERGENCIA SÓ PODE SER DESATIVADO LOCALMENTE");
	MOVLW       ?lstr43_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr43_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,822 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,823 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,828 :: 		}
L_serial_menu97:
;TCC.c,829 :: 		if(uart_rd == 'H'){
	MOVF        _uart_rd+0, 0 
	XORLW       72
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu98
;TCC.c,830 :: 		serial_principal();
	CALL        _serial_principal+0, 0
;TCC.c,831 :: 		}
L_serial_menu98:
;TCC.c,832 :: 		if(uart_rd == 'w'){
	MOVF        _uart_rd+0, 0 
	XORLW       119
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu99
;TCC.c,833 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,834 :: 		serial_transferencia();
	CALL        _serial_transferencia+0, 0
;TCC.c,835 :: 		}
L_serial_menu99:
;TCC.c,836 :: 		if(uart_rd == 'e'){
	MOVF        _uart_rd+0, 0 
	XORLW       101
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu100
;TCC.c,837 :: 		serial_emergencia();
	CALL        _serial_emergencia+0, 0
;TCC.c,838 :: 		}
L_serial_menu100:
;TCC.c,839 :: 		if(uart_rd == 'r'){
	MOVF        _uart_rd+0, 0 
	XORLW       114
	BTFSS       STATUS+0, 2 
	GOTO        L_serial_menu101
;TCC.c,840 :: 		exibe_tensaoVcc_terminal();
	CALL        _exibe_tensaoVcc_terminal+0, 0
;TCC.c,841 :: 		}
L_serial_menu101:
;TCC.c,842 :: 		}
L_serial_menu91:
;TCC.c,843 :: 		}
L_end_serial_menu:
	RETURN      0
; end of _serial_menu

_serial_principal:

;TCC.c,845 :: 		void serial_principal(){
;TCC.c,846 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,847 :: 		UART1_Write_Text("w - Menu Transferencia");
	MOVLW       ?lstr44_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr44_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,848 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,849 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,850 :: 		UART1_Write_Text("e - Menu Emergencia");
	MOVLW       ?lstr45_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr45_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,851 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,852 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,853 :: 		UART1_Write_Text("r - Tensao Bateria");
	MOVLW       ?lstr46_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr46_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,854 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,855 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,856 :: 		UART1_Write_Text("L - Limpa tela");
	MOVLW       ?lstr47_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr47_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,857 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,858 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,860 :: 		}
L_end_serial_principal:
	RETURN      0
; end of _serial_principal

_serial_emergencia:

;TCC.c,862 :: 		void serial_emergencia(){
;TCC.c,863 :: 		UART1_Write(12);
	MOVLW       12
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,864 :: 		UART1_Write_Text("a - Ativa Emergencia");
	MOVLW       ?lstr48_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr48_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,865 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,866 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,867 :: 		UART1_Write_Text("s - Desativar Emergencia (Somente Info)");
	MOVLW       ?lstr49_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr49_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,868 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,869 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,870 :: 		UART1_Write_Text("H - Voltar");
	MOVLW       ?lstr50_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr50_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,871 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,872 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,873 :: 		}
L_end_serial_emergencia:
	RETURN      0
; end of _serial_emergencia

_serial_transferencia:

;TCC.c,875 :: 		void serial_transferencia(){
;TCC.c,876 :: 		switch(carga){
	GOTO        L_serial_transferencia102
;TCC.c,877 :: 		case 0:
L_serial_transferencia104:
;TCC.c,878 :: 		UART1_Write_Text("Carga Desligada");
	MOVLW       ?lstr51_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr51_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,879 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,880 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,881 :: 		break;
	GOTO        L_serial_transferencia103
;TCC.c,882 :: 		case 1:
L_serial_transferencia105:
;TCC.c,883 :: 		UART1_Write_Text("Rede em carga");
	MOVLW       ?lstr52_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr52_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,884 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,885 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,886 :: 		break;
	GOTO        L_serial_transferencia103
;TCC.c,887 :: 		case 2:
L_serial_transferencia106:
;TCC.c,888 :: 		UART1_Write_Text("GMG em carga");
	MOVLW       ?lstr53_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr53_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,889 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,890 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,891 :: 		break;
	GOTO        L_serial_transferencia103
;TCC.c,892 :: 		}
L_serial_transferencia102:
	MOVLW       0
	XORWF       _carga+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__serial_transferencia175
	MOVLW       0
	XORWF       _carga+0, 0 
L__serial_transferencia175:
	BTFSC       STATUS+0, 2 
	GOTO        L_serial_transferencia104
	MOVLW       0
	XORWF       _carga+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__serial_transferencia176
	MOVLW       1
	XORWF       _carga+0, 0 
L__serial_transferencia176:
	BTFSC       STATUS+0, 2 
	GOTO        L_serial_transferencia105
	MOVLW       0
	XORWF       _carga+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__serial_transferencia177
	MOVLW       2
	XORWF       _carga+0, 0 
L__serial_transferencia177:
	BTFSC       STATUS+0, 2 
	GOTO        L_serial_transferencia106
L_serial_transferencia103:
;TCC.c,893 :: 		UART1_Write_Text("z - Liga Rede");
	MOVLW       ?lstr54_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr54_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,894 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,895 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,896 :: 		UART1_Write_Text("x - Desliga carga");
	MOVLW       ?lstr55_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr55_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,897 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,898 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,899 :: 		UART1_Write_Text("c - Liga Gerador");
	MOVLW       ?lstr56_TCC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr56_TCC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;TCC.c,900 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,901 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;TCC.c,903 :: 		}
L_end_serial_transferencia:
	RETURN      0
; end of _serial_transferencia
