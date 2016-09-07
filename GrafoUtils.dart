library GrafoUtils;
import "Grafo.dart";
import "Vertice.dart";
import "Aresta.dart";
import "dart:collection";

List<VerticeBL> Q = new Queue<VerticeBL>();
num tempo;

void BFS_Init( Grafo g, VerticeBL inicio ) {
		if ( g.V.first is! VerticeBL ) {
			print(	"""
					Vertices precisam ser do tipo VerticeBL.
					Nada foi feito.
					"""
				 );
		}
	g.V.forEach((e) {
		if ( e != inicio ) {
			e.cor = "branco";
			e.d = -1;
			e.pi = null;
		}
	});

	inicio.cor = "cinza";
	inicio.d = 0;
	inicio.pi = null;
	Q.addFirst(inicio);
}

void BFS( Grafo g ) {
	while ( Q.length != 0 )
	{
		var u = Q.removeFirst();
		g.lista[u.label].forEach((v) {
			v = v.para;
			if ( v.cor == "branco" ) {
				v.cor = "cinza";
				v.d = u.d+1;
				v.pi = u;
				Q.addFirst(v);
			}	
		});
		u.cor = "preto";
	}
}

void DFS_Init( Grafo g ) {
	if ( g.V.first is! VerticeBP ) {
		print(	"""
				Vertices precisam ser do tipo VerticeBP.
				Nada foi feito.
				"""
			 );
	}

	g.V.forEach((u) {
		u.cor = "branco";
		u.pi = null;	
	});
	tempo = 0;
	g.V.forEach((u) {
		if ( u.cor == "branco" ) {
			DFS_Visit( g, u );
		}
	});
}

void DFS_Visit( Grafo g, VerticeBP u ) {
	tempo ++;
	u.d = tempo;
	u.cor = "cinza";
	g.lista[u.label].forEach((v){
		v = v.para;
		if ( v.cor == "branco" ) {
			v.pi = u;
			DFS_Visit(g, v);
		}
	});

	u.cor = "preto";
	tempo++;
	u.f = tempo;
}
