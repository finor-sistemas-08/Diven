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
}
