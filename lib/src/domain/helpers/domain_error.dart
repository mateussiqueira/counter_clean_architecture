enum DomainError { unexpected }

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.unexpected:
        return 'Erro, não é possivel decrementar valores menores que 1';
    }
  }
}
