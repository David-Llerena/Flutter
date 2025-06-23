class Vehiculo {
  String placa;
  String diagnostico;
  String estado;
  dynamic extraInfo; // Puede ser cualquier tipo

  Vehiculo(this.placa) : 
    diagnostico = "",
    estado = "Pendiente",
    extraInfo = "";

  void registrarDiagnostico(String diagnosticoTexto) {
    diagnostico = diagnosticoTexto;
    estado = "Reparado";
  }

  String resumen() {
    return "Placa: $placa, Diagnóstico: $diagnostico, Estado: $estado, Info Extra: $extraInfo";
  }
}