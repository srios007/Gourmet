// Este es el modelo base de todos los usuarios.


class User {
  String id; // Id del usuario
  String name; // Nombre del usuario
  String email; // Email del usuario
  String phoneNumber; // Celular del usuario
  String profilePictureURL; // Foto de screens.perfil del usuario
  bool isAdmin; // Determina si el usuario es administrador

  User(
      {this.id,
      this.name,
      this.email,
      this.profilePictureURL,
      this.phoneNumber,
      this.isAdmin});
}


