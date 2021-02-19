class Usuario{
  String name;
  String mail;
  String password;

  Usuario({
    this.name,
    this.mail,
    this.password
  });

  Usuario.empty();

  Map<String, dynamic> toMap(){
    return{
    "name": name,
    "password": password,
    "mail": mail
    };
  }
}