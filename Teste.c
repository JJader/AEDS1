// Programa sobre Lista
// Autor: Jamisson Jader Moraes Pereira Júnior;

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

typedef struct Celula
{
    struct Celula *prox;
    Tusuario item;

} Tcelula;

typedef struct Lista
{
    Tcelula *primeira;
    Tcelula *ultima;
    int tam;
} TLista;

void FVLazia(TLista *list)
{

    list->primeira = (Tcelula *)malloc(sizeof(Tcelula));
    list->ultima = list->primeira;
    list->ultima->prox = NULL;
    list->tam = 0;
}

void Imprimir(Tusuario user)
{
}
int VerificaVazia(TLista list)
{
    return (list.primeira == list.ultima);
}

void Inserir(TLista *list, Tusuario item)
{

    int a = list->tam;
    list->ultima->prox = (Tcelula *)malloc(sizeof(Tcelula));
    list->ultima = list->ultima->prox;
    list->ultima->prox = NULL;
    list->ultima->item = item;
    list->tam++;

    if (a < list->tam)
    {
    //    printf("\nItem inserido com Sucesso\n");
    }
    else
    {
    //    printf("\nOcorreu um Erro no processo\n");
    }
}

Tcelula *Pesquisar(TLista list, Tusuario item)
{
    Tcelula *i;
    for (i = list.primeira; i->prox != NULL; i = i->prox)
    {
        if (strcmp(i->prox->item.CPF, item.CPF) == 0)
        {
            return i;
        }
    }
    return NULL;
}

void Excluir(TLista *list, Tusuario item)
{
    Tcelula *cell, *aux;
    cell = Pesquisar(*list, item);

    if (cell != NULL)
    {
        aux = cell->prox;
        cell->prox = cell->prox->prox;
        free(aux);
        list->tam--;
        if(cell == NULL){
            list->ultima = cell;
        }
        return;
    }
    printf("\nNao ha o item\n");
}

void Liberar(TLista *list)
{
    Tusuario user;

        while (list->primeira->prox != NULL)
        {
            user = list->primeira->prox->item;
            Excluir(list, user);
        }
        free(list->primeira);
}

int Comparar(TLista list1, TLista list2){
    Tcelula *aux1, *aux2;

    aux1 = list1.primeira;
    aux2 = list2.primeira;

    if(list1.tam != list2.tam){
        return 0;
    }
    while (aux1->prox != NULL)
    {
        if (strcmp(aux1->prox->item.CPF, aux2->prox->item.CPF) != 0){
            return 0;
        } else
        {
            aux1 = aux1->prox;
            aux2 = aux2->prox;
        }
        
    }
    return 1;
}

void Concatenacao(TLista *list1, TLista list2){

    Tcelula *aux1;
    aux1 = list2.primeira;

    while (aux1->prox != NULL)
    {
       Inserir(list1, aux1->prox->item); 
       aux1 = aux1->prox;
    }
}

TLista Intercalar(TLista list1, TLista list2){

    Tcelula *aux1, *aux2;
    TLista list;
    FVLazia(&list);
    aux1 = list1.primeira;
    aux2 = list2.primeira;
    while ( (aux1->prox != NULL) || (aux2->prox != NULL) )
    {
        if((aux1->prox != NULL) && (aux2->prox != NULL)){
            Inserir(&list, aux1->prox->item);
            Inserir(&list, aux2->prox->item);
            aux1 = aux1->prox;
            aux2 = aux2->prox;
        }else if ((aux1->prox != NULL)){
            Inserir(&list, aux1->prox->item);
            aux1 = aux1->prox;
        }else
        {
            Inserir(&list, aux2->prox->item);
            aux2 = aux2->prox;
        }
    }
    return list;
}



void main()
{
    TLista lista1, lista2, lista3;
    Tusuario item;

    FVLazia(&lista1);
    FVLazia(&lista2);

    item.CPF[0] = '1';
    Inserir(&lista1, item);
    item.CPF[0] = '2';
    Inserir(&lista1, item);
    item.CPF[0] = '3';
    Inserir(&lista1, item);

    item.CPF[0] = '4';
    Inserir(&lista2, item);
    item.CPF[0] = '5';
    Inserir(&lista2, item);
    item.CPF[0] = '6';
    Inserir(&lista2, item);


    Tcelula *i;
    printf("\nLista1");
    i = lista1.primeira->prox;
    for (i; i != NULL; i = i->prox)
    {
        printf("\n%s \n", i->item.CPF);
    }
    
    printf("\nLista2");
    i = lista2.primeira->prox;
    for (i; i != NULL; i = i->prox)
    {
        printf("\n%s \n", i->item.CPF);
    }

    printf("\nLista3");
    lista3 = Intercalar(lista1, lista2);
    i = lista3.primeira->prox;
    for (i; i != NULL; i = i->prox)
    {
        printf("\n%s \n", i->item.CPF);
    }

    printf("\nComparar");
    int a = Comparar(lista1, lista1);
    printf("\n\n %d", a);

    printf("\nConcatenar");
    Concatenacao(&lista1, lista2);
    i = lista1.primeira->prox;
    for (i; i != NULL; i = i->prox)
    {
        printf("\n%s \n", i->item.CPF);
    }
   
    Liberar(&lista3);
    Liberar(&lista1);
    Liberar(&lista2);

     
}