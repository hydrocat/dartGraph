library GrafoUtils;
import "Grafo.dart";
import "Vertice.dart";
import "Aresta.dart";
import "dart:collection";

List<VerticeBL> Q = new Queue<VerticeBL>();

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
