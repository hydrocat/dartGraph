library Aresta;
import './Vertice.dart';

class Aresta {
	Vertice de;
	Vertice para;

	Aresta( this.de, this.para );
	toString() => "$de->$para";

	bool operator ==(Aresta a) => (de == a.de)&&(para == a.para);

}

class ArestaPonderada extends Aresta{
	num peso;
	ArestaPonderada( Vertice de, Vertice para, this.peso ) : super( de,para );
}
