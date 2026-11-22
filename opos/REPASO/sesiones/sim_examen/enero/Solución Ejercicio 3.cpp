/*declaracion de librerias*/
#include<stdio.h>
#include<string.h>
#include <stdlib.h>

/*declaracion de tipos de datos*/

typedef struct{
	int cod;
	char titulo[50];
	char profe[50];
	int unidadGasto;
	float fondos;
	int vigente;
}tipoValor;

typedef struct nodo{
	tipoValor valor;
	struct nodo *sig;
}tipoNodo;

typedef tipoNodo *Lista;

void darAlta(Lista *lista, tipoValor nuevo, int *numProyecto);
void incrementarFondos(Lista lista, int cod, float cantidad);
void listar(Lista lista, float limite);
void listarDptos(Lista lista);
void insertarDpto(Lista *lista2,tipoValor nuevo);
int buscarDpto(Lista lista2, int unidadGasto);
tipoValor leerProyecto();
int leerCodigo();
float leerCantidad();
int leerVigencia();

int main(){
  	Lista lista = NULL;
	int opcion, numProyecto=1, cod;
	tipoValor nuevo;
	float cantidad;

	do{
		printf("\n-----------MENU DE OPCIONES------------\n");
		printf("ELIJA UNA OPCION\n");
		printf("1.- DAR DE ALTA NUEVO PROYECTO\n");
		printf("2.- INCREMENTAR FONDOS DE UN PROYECTO\n");
		printf("3.- LISTAR PROYECTOS A PARTIR DE UN MONTO ECONÓMICO\n");
		printf("4.- LISTAR DEPARTAMENTOS DIFERENTES\n");
		printf("0.- SALIR\n");

		scanf("%d",&opcion);
		while (opcion<0||opcion>4){
			printf("opcion incorrecta. Vuelva a introducirla: ");
			scanf("%d",&opcion);
		}
		switch(opcion){
			case 1:
				nuevo = leerProyecto();
        		darAlta(&lista, nuevo, &numProyecto);
				break;
			case 2:
				printf("Dime el proyecto que quieres incrementar: ");
				cod = leerCodigo();
				printf("Dime la cantidad que quieres incrementar: ");
				cantidad = leerCantidad();
        		incrementarFondos(lista, cod, cantidad);
				break;
			case 3:
				printf("Dime la cantidad que quieres poner de limite: ");
				cantidad = leerCantidad();
        		listar(lista,cantidad);
				break;
			case 4:
        		listarDptos(lista);
				break;
			default: 
				printf("BYE");
		}

	}while (opcion!=0);

  return 0;
}



tipoValor leerProyecto(){
	tipoValor n;
	printf("Dime el titulo del proyecto: ");
	scanf("%s",n.titulo);
	printf("Dime el profe responsable del proyecto: ");
	scanf("%s",n.profe);
	printf("Dime la unidad de gasto del proyecto: ");
	scanf("%d",&n.unidadGasto);
	printf("Dime los fondos: ");
	n.fondos = leerCantidad();
	printf("Pulsa 1 si está vigente y 0 si no lo esta: ");
	n.vigente = leerVigencia();
	return n;
}

int leerCodigo(){
	int cod;
	scanf("%d",&cod);
	while(cod<=0){
		printf("Mal, repite: ");
		scanf("%d",&cod);
	}
	return cod;
} 

float leerCantidad(){
	float cant;
	scanf("%f",&cant);
	while(cant<=0){
		printf("Mal, repite: ");
		scanf("%f",&cant);
	}
	return cant;
}

int leerVigencia(){
	int v;
	scanf("%d",&v);
	while(v!=0 && v!=1){
		printf("Mal, repite: ");
		scanf("%d",&v);
	}
	return v;
}

void darAlta(Lista *lista, tipoValor nuevo, int *numProyecto){
	Lista nodo;
	nodo = (Lista)malloc(sizeof(tipoNodo));
	nodo->valor = nuevo;
	(nodo->valor).cod=*numProyecto;
	(*numProyecto)++;
	nodo->sig = NULL;
  	Lista aux = *lista;
  	Lista detras = NULL;
  	if(aux == NULL){
    	*lista = nodo;
    	return;
  	}
  	while(aux != NULL){
    	detras = aux;
    	aux = aux->sig;
  	}
  	if(detras == NULL){
    	nodo->sig = *lista;
    	*lista = nodo;
  	}else{
    	nodo->sig=detras->sig;
    	detras->sig = nodo;
  	}
}

void incrementarFondos(Lista lista, int cod, float cantidad){
	Lista aux = lista;
  	while(aux!=NULL){
  		if((aux->valor).cod = cod){
  			(aux->valor).fondos += cantidad;
			return;	
		}
	}
}

void listar(Lista lista, float limite){
	Lista aux = lista;
	int cont=0;
  	while(aux!=NULL){
		if((aux->valor).fondos>=limite){
			printf("%d.- %s (%d)\n",(aux->valor).cod,(aux->valor).profe,(aux->valor).unidadGasto);
			cont++;
		}
    	aux = aux->sig;
  	}
	if(cont==0)
		printf("No hay ningun proyecto con esos fondos. ");	
}

void listarDptos(Lista lista){
	Lista lista2=NULL;
	Lista aux = lista;
	int pos;
	while(aux!=NULL){
		pos = buscarDpto(lista2,(aux->valor).unidadGasto);
		if(pos == -1)
			insertarDpto(&lista2,aux->valor);
		aux = aux->sig;
	}
	Lista aux2 = lista2;
	while(aux2!=NULL){
		printf("%d\n",(aux2->valor).unidadGasto);
		aux2 = aux2->sig;
	}
}

void insertarDpto(Lista *lista2,tipoValor nuevo){
	Lista nodo;
	nodo = (Lista)malloc(sizeof(tipoNodo));
	nodo->valor = nuevo;
  	nodo->sig = *lista2;
    *lista2 = nodo;
}

int buscarDpto(Lista lista2, int unidadGasto){
	Lista aux = lista2;
	while(aux != NULL){
    	if((aux->valor).unidadGasto == unidadGasto){
    		return 1;
		}
    	aux = aux->sig;
  	}
  	return -1;
}