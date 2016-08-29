library Grafo;

import './Aresta.dart';
import './Vertice.dart';

class Grafo {
	Set<Aresta> E = new Set();
	Set<Vertice> V = new Set();
	Map<String,List<Aresta>> lista = new Map();

	Grafo( {Set<Aresta> arestas:null, Set<Vertice> vertices:null})
	{
		if( vertices != null )
		{
			vertices.forEach( (k)=>this.inserirVertice(k));
			this.V.forEach( (k)=>this.lista[k.label] = new List<Aresta>());
		}

		if( arestas != null ) 
		{
			arestas.forEach( (k)=>inserirAresta(k) );
		}
	}
	
	inserirArestaBidimensional( Aresta a ) =>  "Nao implementado";
	removerArestaBidimensional( Aresta a ) =>  "Nao implementado";
	buscarArestaBidimensional ( Aresta a ) =>  "Nao implementado";

	inserirAresta( Aresta a )
	{
		var label = a.de.label;
		if( this.lista[label] == null )
		{
			this.lista[label] = new List<Aresta>();
		}
		this.lista[label].add(a);
		print("asd");
		print( this.E.lookup(a) );
		this.E.add(a);
		inserirVertice(a.para);
	}

	//Remove arestas do grafo
	Aresta removerAresta( Aresta aresta ) 
	{
		this.lista[aresta.de.label].remove(aresta);
	}

	buscarAresta ( Vertice v1, Verice v2 )
	{
		print("==");
		print(v1==v2);
		print(this.E);
		print("sad");
		print(new Aresta(v1,v2));
		return this.E.contains( new Aresta(v1,v2) );
	}	

	//Adiciona o Vertice v ao grafo
	inserirVertice( Vertice v )
	{
		if( !this.V.lookup(v) ){
			this.V.add(v);
			this.lista[v.label] = new List<Aresta>();
		}
	}

	List<Vertice> removerVertice( Vertice a ) => 
		this.lista.remove(a.label); 

	Vertice buscarVertice ( String label )
	{
		return this.V.firstWhere( (e)=> e.label == label);
	}

	toString()
	{
		String str = 'Grafo:\n';
		str += "\tLista Incidencia\n\t${this.lista}\n";
		str += "\tVertices\n\t${this.V}\n\tArestas\n\t${this.E} ";
		return str;
	}
}

