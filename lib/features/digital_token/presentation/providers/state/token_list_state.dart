// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

enum TokenConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllTokens
}

class TokenState extends Equatable {
  final List<Token> tokenList;  // เปลี่ยนจาก productList เป็น tokenList
  final int total;
  final int page;
  final bool hasData;
  final TokenConcreteState state;
  final String message;
  final bool isLoading;

  const TokenState({
    this.tokenList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = TokenConcreteState.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const TokenState.initial({
    this.tokenList = const [],
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = TokenConcreteState.initial,
    this.message = '',
  });

  TokenState copyWith({
    List<Token>? tokenList,
    int? total,
    int? page,
    bool? hasData,
    TokenConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return TokenState(
      isLoading: isLoading ?? this.isLoading,
      tokenList: tokenList ?? this.tokenList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'TokenState(isLoading:$isLoading, tokenLength: ${tokenList.length}, total:$total page: $page, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [tokenList, page, hasData, state, message];
}
