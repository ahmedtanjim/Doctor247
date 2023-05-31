import 'package:doctor_247/features/diagnostic/domain/models/diagnostic.dart';

abstract class DiagnosticRepository {
  Future<List<Diagnostic>?> getDiagnostics();
}