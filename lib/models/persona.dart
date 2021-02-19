class Persona {
   int id;
   String nombre;
   String paterno;
   String materno;
   String fechaNac;
   String genero;
   String correo;  

  Persona(
    {this.id,
    this.nombre,
    this.paterno,
    this.materno,
    this.fechaNac,
    this.genero,
    this.correo
      });

  Persona.empty();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'paterno': paterno,
      'materno': materno,
      'fechaNac': fechaNac,
      'genero': genero,
      'correo': correo
    };
  }

  //Setters
  set iD(int id){
    this.id = id;
  }
  set nombrE(String nombre){
    this.nombre = nombre;
  }

  set paternO(String paterno){
    this.paterno = paterno;
  }

  set maternO(String materno){
    this.materno = materno;
  }

  set fechaNaC(String fechaNac){
    this.fechaNac = fechaNac;
  }

  set generO(String genero){
    this.genero = genero;
  }

  set correO(String correo){
    this.correo = correo;
  }

  //Getter
  int get iD => this.id;
  String get nombrE => this.nombre;
  String get paternO => this.paterno;
  String get maternO => this.materno;
  String get fechaNaC => this.fechaNac;
  String get generO => this.genero;
  String get correO => this.correo;
}
