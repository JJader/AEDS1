// Projeto Fila
//Jamisson Jader M P junior
// --> Regra FIFO : first in fist out

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct TData
{
    int dia;
    int mes;
    int ano;
} TData;

typedef struct TEndereco
{
    char rua[50];
    int numero;
    char complemento[10];
    char bairro[50];
    char cidade[50];
    char CEP[11];
} TEndereco;

typedef struct Usuario
{
    char nome[50];
    char sobrenome[50];
    char CPF[2];
    char RG[9];
    TEndereco Endereco;
    TData Data;
    int tipo; // 1 prof, 2 aluno, 3 funcio
    char matricula[20];
    char depart_Curso[50];
    char SIAPE[20];
    short quatidadeLivros;
    float multa;
} Tusuario;

typedef struct LCelula
{
    struct LCelula *prox;
    Tusuario item;

} TLcelula;

typedef struct Fila
{
    TLcelula *frente;
    TLcelula *tras;
    int tam;
} TFila;

void FVLazia(TFila *f1)
{
    f1->frente = (TLcelula *)malloc(sizeof(TLcelula));
    f1->tras = f1->frente;
    f1->tras->prox = NULL;
    f1->tam = 0;
}

int Vazia(TFila f1)
{
    return f1.frente == f1.tras;
}

void Push(TFila *f1, Tusuario user)
{
    f1->tras->prox = (TLcelula *)malloc(sizeof(TLcelula));
    f1->tras = f1->tras->prox;
    f1->tras->prox = NULL;
    f1->tras->item = user;
    f1->tam = f1->tam + 1;
}

void Pop(TFila *f1, Tusuario *user)
{
    TLcelula *aux;
    aux = f1->frente->prox;

    if (!Vazia(*f1))
    {
        *user = aux->item;
        f1->frente->prox = aux->prox;
        free(aux);
        f1->tam = f1->tam - 1;
        if (f1->frente->prox == NULL)
        {
            f1->tras = f1->frente;
        }
    }
}

void Liberar(TFila *f1)
{
    Tusuario user;
    while (f1->frente != f1->tras)
    {
        Pop(f1, &user);
    }
    free(f1->frente);
    
}

void Imprimir(TFila f1)
{
    Tusuario user1;
    int i = f1.tam;
    TFila faux;
    FVLazia(&faux);
    while (!Vazia(f1)){
        Pop(&f1, &user1);
        printf("\n %s\n", user1.CPF);
        Push(&faux, user1);
    }

    while (!Vazia(faux))
    {
        Pop(&faux, &user1);
        Push(&f1, user1);
    }
    Liberar(&faux);
    
}

int Pesquisar(TFila f1, Tusuario user)
{
    Tusuario user1;
    int retorno;
    retorno = 0;
    TFila faux;
    FVLazia(&faux);
    
    while (!Vazia(f1)){
        if (strcmp(f1.frente->prox->item.CPF, user.CPF) == 0)
        {
            retorno = 1;
        }
        Pop(&f1, &user1);
        Push(&faux, user1);
    }

    while (!Vazia(faux))
    {
        Pop(&faux, &user1);
        Push(&f1, user1);
    }
    Liberar(&faux);


    if (retorno == 1)
    {
        printf("\nEncontramos o elemento\n");
    }
    else
    {
        printf("\nNao Encontramos o elemento\n");
    }
    return retorno;
}

void LerUsuario(Tusuario *user)
{
    system("cls");
    printf("\nnome: ");
    fflush(stdin);
    fgets(user->nome, 50, stdin);

    printf("\nsobrenome: ");
    fflush(stdin);
    fgets(user->sobrenome, 50, stdin);

    printf("\nCPF 000.000.000-00: ");
    fflush(stdin);
    fgets(user->CPF, 15, stdin);

    printf("\nRG: ");
    fflush(stdin);
    fgets(user->RG, 50, stdin);

    printf("\nData de Nascimento dd/mm/aaaa");
    printf("\n Dia: ");
    fflush(stdin);
    scanf("%i", &user->Data.dia);
    printf(" Mes: ");
    fflush(stdin);
    scanf("%i", &user->Data.mes);
    printf(" Ano: ");
    fflush(stdin);
    scanf("%i", &user->Data.ano);

    printf("\ntipo de usuario: \n1- Professor \n2- Aluno \n3-Funcionario:\n");
    fflush(stdin);
    scanf("%i", &user->tipo);

    if (user->tipo == 1 || user->tipo == 3)
    {
        printf("\nSIAPE: ");
        fflush(stdin);
        fgets(user->SIAPE, 20, stdin);
        printf("\nDepartamento: ");
        fflush(stdin);
        fgets(user->depart_Curso, 50, stdin);
    }
    else if (user->tipo == 2)
    {
        printf("\nmatricula: ");
        fflush(stdin);
        fgets(user->matricula, 20, stdin);
        printf("\nCurso: ");
        fflush(stdin);
        fgets(user->depart_Curso, 50, stdin);
    }

    printf("\nEndereco: ");
    printf("\n-Rua: ");
    fflush(stdin);
    fgets(user->Endereco.rua, 50, stdin);

    printf("\n-Numero: ");
    fflush(stdin);
    scanf("%i", &user->Endereco.numero);

    printf("\n-Complemento: ");
    fflush(stdin);
    fgets(user->Endereco.complemento, 10, stdin);

    printf("\n-Bairro: ");
    fflush(stdin);
    fgets(user->Endereco.bairro, 50, stdin);

    printf("\n-Cidade: ");
    fflush(stdin);
    fgets(user->Endereco.cidade, 50, stdin);

    printf("\n-CEP: ");
    fflush(stdin);
    fgets(user->Endereco.CEP, 11, stdin);

    printf("\nQuantidades de livros emprestado ao usuario: ");
    fflush(stdin);
    scanf("%d", &user->quatidadeLivros);

    printf("\nMulta no nome do usuario: ");
    fflush(stdin);
    scanf("%f", &user->multa);
}

void Inverter(TFila *f1)
{
    Tusuario user1;
    TFila faux;
    FVLazia(&faux);
    int j = f1->tam;

    for (j; j > 0; j--)
    {
        int i = f1->tam;
        for (i; i > 0; i--)
        {
            Pop(f1, &user1);
            if (i == 1)
            {
                Push(&faux, user1);
            }
            else
            {
                Push(f1, user1);
            }
        }
    }
    Liberar(f1);
    FVLazia(f1);
    while (!Vazia(faux))
    {
        Pop(&faux, &user1);
        Push(f1, user1);
    }
    Imprimir(*f1);
    Liberar(&faux);
}

TFila Intercalar(TFila f1, TFila f2)
{
    Tusuario user;
    TFila f3;
    int i = f1.tam;
    int j = f2.tam;
    FVLazia(&f3);
    while ((i > 0) || (j > 0))
    {
        if (i > 0)
        {
            Pop(&f1, &user);
            Push(&f3, user);
            Push(&f1, user);
            i--;
        }
        if (j > 0)
        {
            Pop(&f2, &user);
            Push(&f3, user);
            Push(&f2, user);
            j--;
        }
    }
    return f3;
}

int Comparar(TFila f1, TFila f2)
{
    int res = 1;
    Tusuario user1, user2;
    if (f1.tam != f2.tam)
    {
        return 0;
    }
    int i;
    i = f2.tam;

    while (i > 0)
    {
        Pop(&f1, &user1);
        Pop(&f2, &user2);
        if (strcmp(user1.CPF, user2.CPF) != 0)
        {
            res = 0;
        }
        Push(&f1, user1);
        Push(&f2, user2);
        i = i - 1;
    }
    return res;
}
