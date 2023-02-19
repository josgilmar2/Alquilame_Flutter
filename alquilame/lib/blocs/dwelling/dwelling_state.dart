import 'package:alquilame/models/models.dart';
import 'package:equatable/equatable.dart';

enum DwellingStatus { initial, success, failure }

class DwellingState extends Equatable {
  const DwellingState({
    this.status = DwellingStatus.initial,
    this.dwellings = const <Dwelling>[],
    this.hasReachedMax = false,
  });

  final DwellingStatus status;
  final List<Dwelling> dwellings;
  final bool hasReachedMax;

  DwellingState copyWith({
    DwellingStatus? status,
    List<Dwelling>? dwellings,
    bool? hasReachedMax,
  }) {
    return DwellingState(
      status: status ?? this.status,
      dwellings: dwellings ?? this.dwellings,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''DwellingState { status: $status, hasReachedMax: $hasReachedMax, posts: ${dwellings.length} }''';
  }

  @override
  List<Object> get props => [status, dwellings, hasReachedMax];
}
