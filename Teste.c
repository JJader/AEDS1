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
    char CPF[15];
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

void Inserir(TLista *list, Tusuario item){

    int a = list->tam;
    list->ultima->prox = (Tcelula*) malloc(sizeof(Tcelula));
    list->ultima = list->ultima->prox;
    list->ultima->prox = NULL;
    list->ultima->item = item;
    list->tam++;

    if(a < list->tam){
        printf("Item inserido com Sucesso");
    }else{
        printf("Ocorreu um Erro no processo");
    }

}

Tcelula* Pesquisar(TLista *list, Tusuario item){
    Tcelula* i;
    
    for(i=list->primeira; i != NULL; i = i->prox){
        if(strcmp(i->item.CPF, item.CPF) == 0){return i;}
    }
    return NULL;
}

void main(){




}