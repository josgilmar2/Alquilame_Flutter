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
    on<DwellingUserFetched>(_onDwellingUserFetched);
    on<DwellingDelete>(_onDwellingDelete);
  }

  Future<void> _onDwellingFetched(
      DwellingFetched event, Emitter<DwellingState> emitter) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == DwellingStatus.initial) {
        page = 0;
        final dwellings = await _dwellingService.getAllDwellings(page);
        return emitter(state.copyWith(
          status: DwellingStatus.success,
          dwellings: dwellings.content,
          hasReachedMax: dwellings.totalPages - 1 <= page,
        ));
      }
      page += 1;
      final dwellings = await _dwellingService.getAllDwellings(page);
      emitter(state.copyWith(
          status: DwellingStatus.success,
          dwellings: List.of(state.dwellings)..addAll(dwellings.content),
          hasReachedMax: dwellings.totalPages - 1 <= page));
    } catch (_) {
      emitter(state.copyWith(status: DwellingStatus.failure));
    }
  }

  Future<void> _onDwellingRefresh(
      DwellingRefresh event, Emitter<DwellingState> emitter) async {
    final dwellings = await _dwellingService.getAllDwellings(0);
    return emitter(state.copyWith(
        status: DwellingStatus.success,
        dwellings: List.of(state.dwellings)..addAll(dwellings.content),
        hasReachedMax: dwellings.totalPages - 1 <= page));
  }

  Future<void> _onDwellingUserFetched(
      DwellingUserFetched event, Emitter<DwellingState> emitter) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == DwellingStatus.initial) {
        page = 0;
        final dwellings = await _dwellingService.getUserDwellings(page);
        return emitter(state.copyWith(
          status: DwellingStatus.success,
          dwellings: dwellings.content,
          hasReachedMax: dwellings.number - 1 <= page,
        ));
      }
      page += 1;
      final dwellings = await _dwellingService.getUserDwellings(page);
      emitter(state.copyWith(
          status: DwellingStatus.success,
          dwellings: List.of(state.dwellings)..addAll(dwellings.content),
          hasReachedMax: dwellings.number - 1 <= page));
    } catch (_) {
      emitter(state.copyWith(status: DwellingStatus.failure));
    }
  }

  Future<void> _onDwellingDelete(
      DwellingDelete event, Emitter<DwellingState> emitter) async {
    try {
      await _dwellingService.deleteDwelling(event.id);
      return emitter(state.copyWith(status: DwellingStatus.delete));
    } catch (e) {
      emitter(state.copyWith(status: DwellingStatus.failure));
    }
  }
}
