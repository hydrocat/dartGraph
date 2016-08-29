library grafo_test;

import '../Grafo.dart';
import '../Vertice.dart';
import '../Aresta.dart';
import 'package:test/test.dart';

main(){
	var V;
	var E;
	setUp( (){	
			Vertice a = new Vertice("1");
			Vertice b = new Vertice("2");
			Vertice c = new Vertice("3");
			Vertice d = new Vertice("4");

			Aresta ab = new Aresta(a,b);
			Aresta ba = new Aresta(b,a);
			Aresta ac = new Aresta(a,c);
			Aresta cd = new Aresta(c,d);
			Aresta da = new Aresta(d,a);

			V = new Set<Vertice>.from([a,b,c,d]);
			E = new Set<Aresta>.from([ab,ba,ac,cd,da]);

			}
		);
	group("Grafo",
		(){
			test("Vertices Inseridas no mapa",
					(){
						var grafo = new Grafo(vertices:V);
						expect(grafo.V,equals(V));	
					}
			);

			test("Aresta Inseridas no mapa",
					(){
						var grafo = new Grafo(arestas:E);
						expect(grafo.E,equals(E));
					}
			);
		}
	);

	group("Aresta",
		(){
			test("inserir",
					() {
						var grafo = new Grafo();
						var vertice1 = new Vertice('1');
						var vertice2 = new Vertice('2');
						var aresta = new Aresta(vertice1,vertice2);
						grafo.inserirAresta(aresta);
						var doGrafo = grafo.lista['1'].elementAt(0);
						expect(doGrafo,equals(aresta));
					}
			);

			test("remover",
					() {
						var grafo = new Grafo();
						var vertice1 = new Vertice('1');
						var vertice2 = new Vertice('2');
						var aresta = new Aresta(vertice1,vertice2);
						var aresta2 = new Aresta(vertice1,vertice2);
						grafo.inserirAresta(aresta);
						grafo.removerAresta(aresta2);
						expect(grafo.lista['1'].length,equals(0) );
					}
				);

			test("buscar",
					() {
						var grafo = new Grafo();
						var vertice1 = new Vertice('1');
						var vertice2 = new Vertice('2');
						var aresta = new Aresta(vertice1,vertice2);
						var aRes = grafo.buscarAresta(vertice1,vertice2);
						expect(aRes,equals(aresta));
					}
				);
		}
		 );
	group("Vertice",
		(){
			test("inserir",
					() {
						var grafo = new Grafo();
						var vertice = new Vertice('2');
						grafo.inserirVertice(vertice);
						var lista = grafo.lista;
						bool hasKey = lista.containsKey(vertice.label);
						expect(hasKey,equals(true));
					}
				);
					

			test("remover vertice inserido",
					() {
						var grafo = new Grafo();
						var vertice = new Vertice('2');
						grafo.inserirVertice(vertice);
						grafo.removerVertice(vertice);
						var lista = grafo.lista;
						bool hasKey = lista.containsKey(vertice.label);
						expect(hasKey,equals(false));
					}
				);

			test("remover vertice nao existente",
					() {
						var grafo = new Grafo();
						var vertice = new Vertice('2');
						var res = grafo.removerVertice(vertice);
						expect(res,equals(null));
					}
				);

			test("buscar",
					() {
						var grafo = new Grafo();
						var vertice = new Vertice('2');
						grafo.inserirVertice(vertice);
						expect(grafo.buscarVertice('2'),equals(vertice));
					}
				);
			}
		 );
}
