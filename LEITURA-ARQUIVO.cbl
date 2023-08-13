       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEITURA-ARQUIVO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DADOS ASSIGN
           'CAMINHO DO ARQUIVO\NOME-ARQUIVO.EXTENSÃO'
           ORGANIZATION IS SEQUENTIAL
           FILE STATUS IS WS-STATUS-ARQUIVO.

       DATA DIVISION.
       FILE SECTION.
       FD DADOS.
       01 INFO-CLIENTE.
           03 COD-CLIENTE              PIC 9(3).
           03 NOME-CLIENTE             PIC X(20).
           03 TEL-CLIENTE              PIC X(10).

       WORKING-STORAGE SECTION.
       77 WS-STATUS-ARQUIVO            PIC 99.
       77 WS-FIM-ARQUIVO               PIC 99.
       01 WS-INFO-CLIENTE.
           03 WS-COD-CLIENTE           PIC 9(3).
           03 WS-NOME-CLIENTE          PIC X(20).
           03 WS-TEL-CLIENTE           PIC X(10).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "******* LISTA DE CLIENTES ********* ".
           SET WS-STATUS-ARQUIVO  TO 0.
           SET WS-FIM-ARQUIVO  TO 0.

           OPEN INPUT DADOS

           PERFORM UNTIL WS-FIM-ARQUIVO EQUAL 1
               READ DADOS INTO WS-INFO-CLIENTE
                   AT END
                       MOVE 1 TO WS-FIM-ARQUIVO
                  NOT AT END
                       DISPLAY "COD. CLIENTE: " WS-COD-CLIENTE
                               " NOME: " WS-NOME-CLIENTE
                               " TELEFONE: " WS-TEL-CLIENTE
                END-READ
           END-PERFORM

           CLOSE DADOS

           STOP RUN.
       END PROGRAM LEITURA-ARQUIVO.
