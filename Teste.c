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
}Tusuario;

typedef struct Celula
{
    struct Celula *prox;
    Tusuario item;
    
}Tcelula;

typedef struct Lista
{
    Tcelula *primeira;
    Tcelula *ultima;
    int tam;
}TLista;

void FVLazia(TLista *list){

    list->primeira = (Tcelula*) malloc(sizeof(Tcelula));
    list->ultima = list->primeira;
    list->ultima->prox = NULL;
    list->tam = 0;

}

int VerificaVazia(TLista list){
    if(list.tam == 0){return 0;}
    return 1;
}

void Inserir(TLista *list, Tusuario item){

    int a = list->tam;
    list->ultima->prox = (Tcelula*) malloc(sizeof(Tcelula));
    list->ultima = list->ultima->prox;
    list->ultima->prox = NULL;
    list->ultima->item = item;
    list->tam++;

    if(a < list->tam){
        printf("\nItem inserido com Sucesso\n");
    }else{
        printf("\nOcorreu um Erro no processo\n");
    }

}

Tcelula* Pesquisar(TLista *list, Tusuario item){
    Tcelula* i;
    if(list->tam == 0){return NULL;}
    for(i=list->primeira; i != NULL; i = i->prox){
        if(strcmp(i->item.CPF, item.CPF) == 0){
            return i;
            }
    }
    return NULL;
}

void Excluir(TLista *list, Tusuario item){
    Tcelula *cell, *aux;
    cell = list->primeira;
    
    if(list->tam == 0){return;}
        
    while (cell->prox != NULL)
    {
        if ((strcmp(cell->prox->item.CPF, item.CPF) == 0))
        {
            aux = cell->prox;
            cell->prox = cell->prox->prox;
            free(aux); 
            list->tam--; 
            return;        
        }
            cell = cell->prox;
    }

    printf("\nNao ha o item\n");
}

void Liberar(TLista *list){
    Tcelula *i;
    
    if(list->tam != 0 ){
    while (list->primeira != NULL)
    {
        i = list->primeira->prox;
        free(list->primeira);
        list->primeira = i;
    }
    } 
    else{
        free(list->primeira);
    }
}

void main(){
    TLista lista;
    Tusuario item;

    FVLazia(&lista);


    item.CPF[0] = '1';
    Inserir(&lista, item);
    item.CPF[0] = '2';
    Inserir(&lista, item);
    item.CPF[0] = '3';
    Inserir(&lista, item);

    Tcelula *i;
    i = lista.primeira->prox;

    for(i; i != NULL; i = i->prox){
        printf("\n%s \n", i->item.CPF);
    }
    item.CPF[0] = '4';
    Excluir(&lista, item);

    Liberar(&lista);
}