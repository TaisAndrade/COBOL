       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULOS.
      *Por pradrão o COBOL não aceita virgula como ponto decimal,
      *sendo necessário a sessão de configuração para aceitar
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
            77 WS-NUM-1    PIC 9(3)V99.
            77 WS-NUM-2    PIC 9(3)V99.
            77 WS-RESULT   PIC 9(4)V99.
            77 WS-OPERADOR PIC X(1).
            77 WS-OPCAO    PIC A.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       P100-INICIO.
           DISPLAY "SELECIONE O OPERADOR + - * /:".
           ACCEPT WS-OPERADOR.

           DISPLAY "DIGITE O PRIMEIRO NUMERO: ".
            ACCEPT WS-NUM-1.

           DISPLAY "DIGITE O SEGUNDO NUMERO: ".
           ACCEPT WS-NUM-2.

           PERFORM P200-INICIO-CALC    THRU P200-FIM-CALC.
           PERFORM P300-INCIO-OPCAO    THRU P300-FIM-OPCAO.
       P100-FIM.

       P200-INICIO-CALC.
           EVALUATE WS-OPERADOR
                WHEN '+'
                    COMPUTE WS-RESULT = WS-NUM-1 + WS-NUM-2
                WHEN '-'
                    COMPUTE WS-RESULT = WS-NUM-1 - WS-NUM-2
                WHEN '*'
                    COMPUTE WS-RESULT = WS-NUM-1 * WS-NUM-2
                WHEN  '/'
                    COMPUTE WS-RESULT = WS-NUM-1 / WS-NUM-2
           END-EVALUATE.
       P200-FIM-CALC.

       P300-INCIO-OPCAO.
           DISPLAY "O RESULTADO E: " WS-RESULT.

           DISPLAY "DESEJA CONTINUAR CALCULANDO <S> SIM <N> NAO?".
           ACCEPT WS-OPCAO.

           IF WS-OPCAO = "S" THEN
                PERFORM P100-INICIO     THRU P100-FIM
           END-IF.
       P300-FIM-OPCAO.

           STOP RUN.
       END PROGRAM CALCULOS.
