#include <stdio.h>
#include <stdlib.h>

typedef struct item
{
    int chave;
} TItem;

typedef struct celula
{
    TItem item;
    struct celula *pai;
    struct celula *esq;
    struct celula *dir;
} TCelula;

typedef struct arvore
{
    TCelula *raiz;
} TArvore;

void Iniciar(TCelula **no)
{
    *no = NULL;
}

TCelula *criaNo(TItem Item)
{
    TCelula *no = (TCelula *)malloc(sizeof(TCelula));
    no->pai = NULL;
    no->esq = NULL;
    no->dir = NULL;
    no->item = Item;
    return no;
}

void Inserir(TCelula **x, TCelula *pai, TItem Item)
{
    if ((*x) == NULL)
    {
        (*x) = criaNo(Item);
        if (pai != NULL)
            (*x)->pai = pai;
        return;
    }
    if ((*x)->item.chave > Item.chave)
    {
        Inserir(&(*x)->esq, (*x), Item);
        return;
    }
    if ((*x)->item.chave < Item.chave)
        Inserir(&(*x)->dir, (*x), Item);
    else
        printf("\n>>>>> AVISO: ELEMENTO %d JA EXISTE! <<<<<\n", Item.chave);
}

TCelula *Pesquisar(TCelula *x, TItem Item)
{
    if ((x == NULL) || (x->item.chave == Item.chave))
        return x;
    if (Item.chave < x->item.chave)
        return Pesquisar(x->esq, Item);
    else if (Item.chave > x->item.chave)
        return Pesquisar(x->dir, Item);
}

void Central(TCelula *x)
{
    if (x != NULL)
    {
        Central(x->esq);
        printf("%d ", x->item.chave);
        Central(x->dir);
    }
}

TCelula *Minimo(TCelula *x)
{
    if (x == NULL)
        return NULL;
    while (x->esq != NULL)
    {
        x = x->esq;
    }
    return x;
}

TCelula *Maximo(TCelula *x)
{
    if (x == NULL)
        return NULL;
    while (x->dir != NULL)
    {
        x = x->dir;
    }
    return x;
}

TCelula *Sucessor(TCelula *x)
{
    if (x == NULL)
        return NULL;
    if (x->dir != NULL)
        return Minimo(x->dir);
    TCelula *y = x->pai;
    while (y != NULL && x == y->dir)
    {
        x = y;
        y = y->pai;
    }
    return y;
}

TCelula *Predecessor(TCelula *x)
{
    if (x == NULL)
        return x;
    if (x->esq != NULL)
        return Maximo(x->esq);
    TCelula *y = x->pai;
    while (y != NULL && x == y->esq)
    {
        x = y;
        y = y->pai;
    }
    return y;
}

// Substitui subárvore enraizada no nó 'u' pela subárvore enraizada no nó 'v'.
void Transplante(TArvore *Arvore, TCelula **u, TCelula **v)
{
    if ((*u)->pai == NULL)
        Arvore->raiz = (*v);
    else if ((*u) == (*u)->pai->esq)
        (*u)->pai->esq = (*v);
    else
        (*u)->pai->dir = (*v);
    if (*v != NULL)
        (*v)->pai = (*u)->pai;
}

// Retira um nó 'z' na árvore 'Arvore'.
void Retirar(TArvore *Arvore, TCelula **z)
{
    if (*z == NULL)
    {
        printf("\n>>>>> AVISO: NO' \"z\" E' NULO! <<<<<\n");
        return;
    }
    if ((*z)->esq == NULL)
        Transplante(Arvore, z, &(*z)->dir);
    else if ((*z)->dir == NULL)
        Transplante(Arvore, z, &(*z)->esq);
    else
    {
        TCelula *y = Minimo((*z)->dir);
        if (y->pai != (*z))
        {
            Transplante(Arvore, &y, &y->dir);
            y->dir = (*z)->dir;
            y->dir->pai = y;
        }
        Transplante(Arvore, z, &y);
        y->esq = (*z)->esq;
        y->esq->pai = y;
    }
    free(*z);
    *z = NULL;
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

void SubMenuModulo2(TArvore *A)
{
    TItem x;
    TCelula *y;
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
            LerUsuario(&x);
            Inserir(A->raiz, NULL, x);
            printf("\nUsuario inserido com sucesso\n");
            system("pause");
            break;
        case 2:
            // funcao pesquisar
            printf("\nDigite a chave");
            fflush(stdin);
            scanf("%i", &x);
            y = Pesquisar(A->raiz, x);
            if (y != NULL)
                printf("\nElemento %d encontrado!\n", y->item.chave);
            else
                printf("\nELEMENTO NAO ENCONTRADO...\n");
            y = Sucessor(y);
            if (y != NULL)
                printf("\nSucessor: %d\n", y->item.chave);

            y = Predecessor(y);
            if (y != NULL)
                printf("\nPredecessor: %d\n", y->item.chave);
            system("pause");
            break;
        case 3:
            // chamada da funcao excluir
            printf("\nDigite a chave");
            fflush(stdin);
            scanf("%i", &x);
            y = Pesquisar(A->raiz, x);
            if (y != NULL)
            {
                Retirar(&A, &y);
                printf("\nElemento %d removido da arvore! Agora seu ponteiro e' %p...\n", x.chave, y);
            }
            else
                printf("\nELEMENTO NAO ENCONTRADO...\n");
            system("pause");
            break;
        case 4:
            //imprimir geral
            Central(A->raiz);
            system("pause");
            break;
        case 5:
            //Maximo
            y = Maximo(A->raiz);
            if (y != NULL)
                printf("\nMaximo: %d\n", y->item.chave);
            system("pause");
            break;
        case 6:
            //Minimo
            y = Minimo(A->raiz);
            if (y != NULL)
                printf("\nMinimo: %d\n", y->item.chave);
            system("pause");
            break;
        case 7:
            //Raiz
            printf("\nRaiz: %d\n", A->raiz->item.chave);
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

int main()
{
    TArvore Arvore;
    Iniciar(&Arvore.raiz);
    //printf("\np = %p\n", Arvore.raiz);
    SubMenuModulo2(&Arvore);
    return 0;
}
