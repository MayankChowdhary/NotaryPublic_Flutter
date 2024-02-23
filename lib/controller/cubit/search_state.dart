part of 'search_cubit.dart';


@immutable
abstract class SearchState extends Equatable {}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchFinished extends SearchState {
  final List<Leads> searchData;

  SearchFinished(this.searchData);

  @override
  List<Object?> get props => [searchData];
}