library Vertice;

class Vertice {
	var label;
	List<Vertice> vizinhos = new List();
	Vertice(this.label);
	toString() => "(${label})";

	operator ==( Vertice v ) => this.label == v.label;
}

class VerticeColorido extends Vertice {
	var cor;
	VerticeColorido( var label, this.cor ) : super(label);
}

