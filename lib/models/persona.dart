class Persona {
  final int id;
  final String nombre;
  final String paterno;
  final String materno;
  final String fechaNac;
  final String genero;
  final String correo;  

  Persona(
    {this.id,
    this.nombre,
    this.paterno,
    this.materno,
    this.fechaNac,
    this.genero,
    this.correo
      });

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
