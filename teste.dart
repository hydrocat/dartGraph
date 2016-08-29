import 'Vertice.dart';
import 'Grafo.dart';
import 'Aresta.dart';

main()
{
	Map<String,List<Aresta>> mapa = {};

	var a = new Vertice("a");
	var b = new Vertice("b");
	var c = new Vertice("c");

	var aa = new Aresta(a,a);
	var ab = new Aresta(a,b);
	var ba = new Aresta(b,a);
	var ac = new Aresta(a,c);
	var cb = new Aresta(c,b);
	var ca = new Aresta(c,a);

	mapa['a'] = [ab,ac];
	mapa['b'] = [ba];
	mapa['c'] = [ca,cb];

	print(mapa);
	print(mapa['a'].elementAt(0).de.label );

	[ab,ac].forEach( (k) => print(k ));
	var k = new List<Aresta>();

	var s = new Set();
	s.add(2);
	s.add(2);
	print(s);

	print("G1:");
	var g = new Grafo(vertices:[a,b,c]);
	print(g.V);

	print("G2:");
	var g2 = new Grafo(arestas:[aa,ab,ba,ac]);
	print(g2.E);
	print(g2.lista);

	print("Arestas");
	var aa2 = new Aresta(a,a);
	print( aa == aa2 );

	var grafo = new Grafo();
        var vertice1 = new Vertice('1');
        var vertice2 = new Vertice('2');
        var aresta = new Aresta(vertice1,vertice2);
        grafo.inserirAresta(aresta);
        grafo.removerAresta(aresta);
	print(grafo.lista['1']);
	//expect(grafo.lista['1'].length,equals(0) );

	print("vertice");
	grafo = new Grafo();
	var vertice = new Vertice('2');
	grafo.inserirVertice(vertice);
	var l = grafo.lista[vertice.label];
	print(grafo.lista);

	print("remove vertice");
	a = new Aresta( vertice, new Vertice('3') );
	grafo.inserirAresta(a);
	var res = grafo.lista.remove(vertice.label);
	print(res);

	print("buscar Vertice");
	grafo.inserirAresta(a);
	print(grafo.buscarVertice('2'));
	print(grafo);

	print("buscar Aresta");
	var aas = new Aresta( new Vertice('3'), new Vertice('2') );
	var aad = new Aresta( new Vertice('3'), new Vertice('2') );
	grafo.inserirAresta(aas);
	grafo.inserirAresta(aad);

	print(grafo);
	print(grafo.V.first);
	print(grafo.V.first == new Vertice('2') );
	var lks = new Vertice('8');
	print( grafo.V.any((e)=>e==lks) == null );
	//expect(l.first,equals(vertice));

}
