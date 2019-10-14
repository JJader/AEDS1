// Jamisson Jader Moraes Pereira Junior
// Programa utilizando a estrutura de Pilha

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Fila.h"

typedef struct celula
{
  Tusuario item;
  struct celula *prox;
} TCelula;

typedef struct
{
  TCelula *fundo;
  TCelula *topo;
  int tamanho;
} TPilha;

void FPVazia(TPilha *Pilha)
{
  Pilha->topo = (TCelula *)malloc(sizeof(TCelula));
  Pilha->fundo = Pilha->topo;
  Pilha->topo->prox = NULL;
  Pilha->tamanho = 0;
}

int PVazia(TPilha Pilha)
{
  return (Pilha.topo == Pilha.fundo);
}

void Empilha(TPilha *Pilha, Tusuario x)
{
  TCelula *Aux;
  Aux = (TCelula *)malloc(sizeof(TCelula));
  Pilha->topo->item = x;
  Aux->prox = Pilha->topo;
  Pilha->topo = Aux;
  Pilha->tamanho++;
}

void Desempilha(TPilha *Pilha, Tusuario *Item)
{
  TCelula *q;
  if (PVazia(*Pilha))
  {
    printf("Erro: lista vazia\n");
    return;
  }
  q = Pilha->topo;
  Pilha->topo = q->prox;
  *Item = q->prox->item;
  free(q);
  Pilha->tamanho--;
  if (Pilha->topo->prox == NULL)
  {
    Pilha->fundo = Pilha->topo;
  }
}

void LiberarP(TPilha *p1){
  Tusuario aux;
  while (!PVazia(*p1))
  {
    Desempilha(p1, &aux);
  }
  free(p1->topo);
}

int Tamanho(TPilha Pilha)
{
  return (Pilha.tamanho);
}

void PImprimir(TPilha Pilha)
{
  TPilha paux;
  Tusuario user;
  FPVazia(&paux);
  while (!PVazia(Pilha))
  {
    Desempilha(&Pilha, &user);
    Empilha(&paux, user);
  }
  while (!PVazia(paux))
  {
    Desempilha(&paux, &user);
    printf("\n%s\n", user.CPF);
    Empilha(&Pilha, user);
  }

  LiberarP(&paux);
}

int PPesquisar(TPilha p1, Tusuario user)
{
  TPilha paux;
  FPVazia(&paux);
  Tusuario aux;
  int estado = 0;
  while (!PVazia(p1))
  {
    Desempilha(&p1, &aux);
    if (strcmp(aux.CPF, user.CPF) == 0)
    {
      estado = 1;
    }
    Empilha(&paux, aux);
  }
  while (!PVazia(paux))
  {
    Desempilha(&paux, &aux);
    Empilha(&p1, aux);
  }
  LiberarP(&paux);
  return estado;
}

void InverterFila(TPilha *p1)
{
  TFila f1;
  FVLazia(&f1);
  Tusuario aux;

  while (!PVazia(*p1))
  {
    Desempilha(p1, &aux);
    Push(&f1, aux);
  }
  while (!Vazia(f1))
  {
    Pop(&f1, &aux);
    Empilha(p1, aux);
  }
  Liberar(&f1);
}

void InverterPilha2(TPilha *p1)
{
  TPilha paux1, paux2;
  FPVazia(&paux1);
  FPVazia(&paux2);
  Tusuario aux;

  while (!PVazia(*p1))
  {
    Desempilha(p1, &aux);
    Empilha(&paux1, aux);
  }

  while (!PVazia(paux1))
  {
    Desempilha(&paux1, &aux);
    Empilha(&paux2, aux);
  }

  while (!PVazia(paux2))
  {
    Desempilha(&paux2, &aux);
    Empilha(p1, aux);
  }

  LiberarP(&paux1);
  LiberarP(&paux2);
}

void InverterPilha1(TPilha *p1)
{
  TPilha paux;
  FPVazia(&paux);
  Tusuario aux;

  while(!PVazia(*p1)){
    Desempilha(p1, &aux);
    Empilha(&paux, aux);
  }
  LiberarP(p1);
  p1->topo = paux.topo;
  p1->fundo = paux.fundo;
  p1->tamanho = paux.tamanho;

}

void MSG_SUBMENU(int numero_modulo)
{
    system("cls");
    printf("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Modulo %d<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<", numero_modulo);
    printf("\n\n\t 1.INSERIR");
    printf("\n\n\t 2.PESQUISAR");
    printf("\n\n\t 3.EXCLUIR");
    printf("\n\n\t 4.IMPRIMIR GERAL");
    printf("\n\n\t 5.INVERTER - 1 Pilha");
    printf("\n\n\t 6.INVERTER - 2 Pilha");
    printf("\n\n\t 7.INVERTER - 1 Fila");
    printf("\n\n\t 8.SAIR");
    
}

void SubMenuModulo2(TPilha *p1)
{
    Tusuario user;
    int opcao = 0;
    int indice;
    do
    {
        system("cls");
        MSG_SUBMENU(2);
        printf("\n\nDigite uma opcao: ");
        fflush(stdin);
        scanf("%d", &opcao);

        switch (opcao)
        {
        case 1:
            // funcao inserir
            LerUsuario(&user);
            Empilha(p1 , user);
            printf("\nUsuario inserido com sucesso\n");
            system("pause");
            break;
        case 2:
            // funcao pesquisar
            system("cls");
            printf("Digite o CPF: ");
            fflush(stdin);
            fgets(user.CPF, 2, stdin);
            int i = PPesquisar(*p1, user);
            if(i == 0){
              printf("\nUsuario nao identificado\n");
            }else
            {
              printf("\nUsuario identificado\n");
            }
            system("pause");
            break;
        case 3:
            // chamada da funcao excluir
            system("cls");
            Desempilha(p1, &user);
            printf("Usuario %s Liberado\n", user.CPF);
            system("pause");
            break;
        case 4:
            //imprimir geral
            PImprimir(*p1);
            system("pause");
            break;
        case 5 :
            //funcao inverter com uma pilha
            InverterPilha1(p1);
            printf("\nPilha invertida com sucesso\n");
            system("pause");
            break;
        case 6 :
            //funcao inverter com duas pilha
            InverterPilha2(p1);
            printf("\nPilha invertida com sucesso\n");
            system("pause");
            break;
        case 7 :
            //funcao inverter com uma fila
            InverterFila(p1);
            printf("\nPilha invertida com sucesso\n");
            system("pause");
            break;
        case 8:
            system("cls");
            printf(">>>> Saindo do Modulo <<<<\n");
            system("pause");
            break;
        default:
            system("cls");
            printf(">>>> Digite uma opcao valida!!! <<<<\n");
            system("pause");
            break;
        }
    } while (opcao != 8);
}

void Pteste(){
  TPilha p1;
  FPVazia(&p1);
  Tusuario user;

  user.CPF[0] = '1';
  Empilha(&p1, user);
  user.CPF[0] = '2';
  Empilha(&p1, user);
  user.CPF[0] = '3';
  Empilha(&p1, user);
  user.CPF[0] = '4';
  Empilha(&p1, user);
  user.CPF[0] = '5';
  Empilha(&p1, user);
  //InverteFila(&p1);
  PImprimir(p1);
  printf("\n\n");
  InverterPilha1(&p1);
  PImprimir(p1);
  LiberarP(&p1);
}

void main()
{
  TPilha p1;
  FPVazia(&p1);
  Tusuario user;

  user.CPF[0] = '1';
  Empilha(&p1, user);
  user.CPF[0] = '2';
  Empilha(&p1, user);
  user.CPF[0] = '3';
  Empilha(&p1, user);
  user.CPF[0] = '4';
  Empilha(&p1, user);
  user.CPF[0] = '5';
  Empilha(&p1, user);

  SubMenuModulo2(&p1);
  LiberarP(&p1);
  
}