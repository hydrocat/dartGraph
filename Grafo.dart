library Grafo;

import './Aresta.dart';
import './Vertice.dart';

class Grafo {
  Set<Aresta> E = new Set();
  Set<Vertice> V = new Set();
  Map<String, List<Aresta>> lista = new Map();

  Grafo({Set<Aresta> arestas: null, Set<Vertice> vertices: null}) {
    if (vertices != null) {
      vertices.forEach((k) => this.inserirVertice(k));
      this.V.forEach((k) => this.lista[k.label] = new List<Aresta>());
    }

    if (arestas != null) {
      arestas.forEach((k) => inserirAresta(k));
    }
  }

  matrizIncidencia() {
    var mapa = new Map<Vertice, Map<Vertice, num>>();
    this.E.forEach((e) {
      mapa[e.de] = new Map<Vertice, num>();
      mapa[e.de][e.para] = 1;
    });
    print(mapa);
	return mapa;
  }

  inserirArestaBidimensional(Vertice v1, Vertice v2) {
    Aresta a = new Aresta(v1, v2);
    Aresta b = new Aresta(v2, v1);
    inserirAresta(a);
    inserirAresta(b);
  }

  removerArestaBidimensional(Vertice v1, Vertice v2) {
    Aresta a = new Aresta(v1, v2);
    Aresta b = new Aresta(v2, v1);
    removerAresta(a);
    removerAresta(b);
  }

  List<Aresta> buscarArestaBidimensional(Vertice v1, Vertice v2) {
    var b = new Aresta(v1, v2);
    var c = new Aresta(v2, v1);
    return this.E.where((e) => (e == b) || (e == c));
  }

  inserirAresta(Aresta a) {
    var label = a.de.label;
    if (this.lista[label] == null) {
      this.lista[label] = new List<Aresta>();
    }
    this.lista[label].add(a);
    this.E.add(a);

    if (!this.V.any((e) => e == a.para)) {
      inserirVertice(a.para);
    }
  }

  //Remove arestas do grafo
  removerAresta(Aresta aresta) {
    this.lista[aresta.de.label].removeWhere((e) => e == aresta);
    this.E.removeWhere((e) => e == aresta);
  }

  Aresta buscarAresta(Vertice v1, Verice v2) {
    Aresta a = new Aresta(v1, v2);
    return this.E.firstWhere((e) => e == a);
  }

  //Adiciona o Vertice v ao grafo
  inserirVertice(Vertice v) {
    if (!this.V.any((e) => e == v)) {
      this.V.add(v);
      this.lista[v.label] = new List<Aresta>();
    }
  }

  removerVertice(String a) {
    List aRemover = new List<Aresta>();
    this.lista.remove(a);
    this.lista.forEach((k, v) {
      v.any((e) {
        if (e.para.label == a) {
          aRemover.add(e);
        }
      });
    });
    aRemover.forEach((e) => removerAresta(e));
    this.V.removeWhere((e) => e.label == a);
    this.E.removeWhere((e) => (e.de.label == a) || (e.para.label == a));
  }

  Vertice buscarVertice(String label) {
    return this.V.firstWhere((e) => e.label == label);
  }

  toString() {
    String str = 'Grafo:\n';
    str += "\tLista Incidencia\n\t${this.lista}\n";
    str += "\tVertices\n\t${this.V}\n\tArestas\n\t${this.E} ";
    return str;
  }
}
