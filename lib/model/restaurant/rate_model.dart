class Rate {
  String id; // Id de la calificación
  String name; // Nombre de quien califica
  String rate; // calificaión
  String commentary; // Comentario que hace el usuario
  int created; // Cuando se creó el comentario

  Rate({
    this.id,
    this.name,
    this.rate,
    this.created,
    this.commentary,
  });
}
