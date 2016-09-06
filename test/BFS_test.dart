import '../Grafo.dart';
import '../Vertice.dart';
import '../Aresta.dart';
import '../GrafoUtils.dart';
import 'package:test/test.dart';

main() {
	Grafo grafo;
	var v;
    var r;
    var s;
    var w;
    var t;
    var x;
    var u;
    var y;
  setUp(() {
	v = new VerticeBL('v');
	r = new VerticeBL('r');
	s = new VerticeBL('s');
	w = new VerticeBL('w');
	t = new VerticeBL('t');
	x = new VerticeBL('x');
	u = new VerticeBL('u');
	y = new VerticeBL('y');

    var V = new Set<Vertice>.from([v,r,s,w,t,x,u,y]);
	grafo = new Grafo(vertices:V);
	grafo.inserirArestaBidimensional(v,r);
	grafo.inserirArestaBidimensional(s,r);
	grafo.inserirArestaBidimensional(s,w);
	grafo.inserirArestaBidimensional(w,t);
	grafo.inserirArestaBidimensional(w,x);
	grafo.inserirArestaBidimensional(t,x);
	grafo.inserirArestaBidimensional(t,u);
	grafo.inserirArestaBidimensional(x,u);
	grafo.inserirArestaBidimensional(x,y);
	grafo.inserirArestaBidimensional(u,y);
	BFS_Init(grafo, s);
	BFS(grafo);
  });

  test("Todos vertices ficaram pretos", (){
	  var result = grafo.V.every((e)=>e.cor=="preto");
	  expect(result ,equals(true));
  });

  test("Pi esta correto", () {
	  var v1 =  grafo.buscarVertice('s');
	  var v2 =  grafo.buscarVertice('u');
	  var v3 =  grafo.buscarVertice('x');
	  expect( [v1.pi, v2.pi, v3.pi], equals([null,x,w]));
  });
  test("Distancia esta correta", () {
	  var v1 =  grafo.buscarVertice('s');
	  var v2 =  grafo.buscarVertice('u');
	  var v3 =  grafo.buscarVertice('x');
	  expect( [v1.d, v2.d, v3.d], equals([0,3,2]));
  });
}
