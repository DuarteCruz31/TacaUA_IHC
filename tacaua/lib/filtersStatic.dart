class FilterValues {
  static String? _modalidade;
  static String? _sexo;
  static String? _curso;
  static String? _dia;

  static String? get modalidade => _modalidade;
  static String? get sexo => _sexo;
  static String? get curso => _curso;
  static String? get dia => _dia;

  static void setModalidade(String? value) {
    _modalidade = value;
  }

  static String getValue(String label) {
    switch (label) {
      case 'Modalidade':
        return _modalidade!;
      case 'Sexo':
        return _sexo!;
      case 'Curso':
        return _curso!;
      case 'Dia':
        return _dia!;
      default:
        return '';
    }
  }

  static void setSexo(String? value) {
    _sexo = value;
  }

  static void setCurso(String? value) {
    _curso = value;
  }

  static void setDia(String? value) {
    _dia = value;
  }

  static void setValue(String label, String? value) {
    switch (label) {
      case 'Modalidade':
        _modalidade = value;
        break;
      case 'Sexo':
        _sexo = value;
        break;
      case 'Curso':
        _curso = value;
        break;
      case 'Dia':
        _dia = value;
        break;
    }
  }
}
