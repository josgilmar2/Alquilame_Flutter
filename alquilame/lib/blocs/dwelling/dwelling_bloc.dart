import 'package:alquilame/blocs/dwelling/dwelling_event.dart';
import 'package:alquilame/blocs/dwelling/dwelling_state.dart';
import 'package:alquilame/services/dwelling_service.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);
int page = -1;

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class DwellingBloc extends Bloc<DwellingEvent, DwellingState> {
  final DwellingService _dwellingService;

  DwellingBloc(DwellingService dwellingService)
      : assert(dwellingService != null),
        _dwellingService = dwellingService,
        super(const DwellingState()) {
    on<DwellingFetched>(_onDwellingFetched);
    on<DwellingRefresh>(_onDwellingRefresh);
  }

  Future<void> _onDwellingFetched(
      DwellingFetched event, Emitter<DwellingState> emitter) async {
    if (state.hasReachedMax) return;
    page += 1;
    try {
      if (state.status == DwellingStatus.initial) {
        final dwellings = await _dwellingService.getAllDwellings(0);
        return emitter(state.copyWith(
          status: DwellingStatus.success,
          dwellings: dwellings,
          hasReachedMax: false,
        ));
      }
      final dwellings = await _dwellingService.getAllDwellings(page);
      emitter(dwellings!.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: DwellingStatus.success,
              dwellings: List.of(state.dwellings)..addAll(dwellings),
              hasReachedMax: false));
    } catch (_) {
      page = -1;
      emitter(state.copyWith(status: DwellingStatus.failure));
    }
  }

  Future<void> _onDwellingRefresh(
      DwellingRefresh event, Emitter<DwellingState> emitter) async {
    final dwellings = await _dwellingService.getAllDwellings(0);
    return emitter(dwellings!.isEmpty
        ? state.copyWith(hasReachedMax: true)
        : state.copyWith(
            status: DwellingStatus.success,
            dwellings: List.of(state.dwellings)..addAll(dwellings),
            hasReachedMax: false));
  }
}
