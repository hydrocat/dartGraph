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

class VerticeBL extends VerticeColorido {
	VerticeBL pi;
	num d;
	VerticeBL( var label,[var cor, this.pi, this.d] ) : super(label, cor);

	toString() {
		String ret = "($label";
		if ( pi != null  ){ ret += "\'${pi.label}";	}
		if ( cor != null ){ ret += "\^${cor}"; }
		if ( d != null ){ ret += "\`${d}"; }
		return ret += ")";
	}
}

class VerticeBP extends VerticeColorido {
	num f;
	num d;
	VerticeBP pi;

	VerticeBP( var label,[var cor, this.pi, this.d, this.f] ) : super(label, cor);

	toString() {
		String ret = "($label";
		if ( pi != null  ){ ret += "\'${pi.label}";	}
		if ( cor != null ){ ret += "\^${cor}"; }
		if ( d != null ){ ret += "\`${d}"; }
		if ( f != null ){ ret += "\"${f}"; }
		return ret += ")";
	}

}
