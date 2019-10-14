#include <stdio.h>
#include <stdlib.h>

void main()
{
    system("cls");
    FILE *arq;
    char str[10] = {"JamissonJ"};
    char a;
    arq = fopen("arquivo.txt", "w");

    if (arq == NULL)
    {
        printf("Nao foi possivel abrir o arquivo!");
    }
    else
    {
        printf("Seu arquivo foi acessada com sucesso!\n\n");
        fprintf(arq, "%s\n", str);
    }
    fclose(arq);

    arq = fopen("arquivo.txt", "r");
    if(arq == NULL){
        printf("Nao foi possivel abrir o arquivo!");
    }else
    {
        while (fscanf(arq, "%c", &a) != EOF )
        {
            printf("%c", a);
        }
    }
        fclose(arq);

    
}

/*
        Arquivo Texto
        fscanf(arq, "%s\n", str); // Ler o arquivo (fgets(str, tam, stdin))
        fprintf(arq, "%s\n", str);

        fgets(str, tam, arq); // Ler o arquivo
        fputs(str, arq);
        ___________________________________________________________________________________________________
        
        Arquivo Binario
        fwrite(str, sizeof(char), tam, arq);
        fread()
*/

/*
    r: Arquivo aberto só para leitura (não é alterado);
    r+: Arquivo aberto tanto para leitura como escrita;
    rb: Abre o arquivo para leitura em modo binário;
    w: Abre o arquivo para escrita, cria o arquivo ou o substitui;
    w+: Cria um arquivo para leitura e para escrita. Se já existir é apagado;
    wb: Abre arquivo para escrita em modo binário;
    a: Abre o arquivo para acrescentar informação no final;
    a+: Abre arquivo para leitura ou para escrita no final do arquivo;
    ab: Escreve binário no final do arquivo.
*/