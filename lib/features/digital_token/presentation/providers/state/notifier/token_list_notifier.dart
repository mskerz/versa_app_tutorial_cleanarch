import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/domain/repositories/token_repository.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/token_list_state.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/paginated_response.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';
import 'package:versa_app_tutorial_cleanarch/shared/globals.dart';

import '../../../../../../shared/domain/models/either.dart';
// import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
// import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
// import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';
// import 'package:versa_app_tutorial_cleanarch/features/digital_token/data/data_source/token_data_source.dart';

// TokenNotifier ที่ทำงานกับ State
class TokenNotifier extends StateNotifier<TokenState> {
  final TokenRepository tokenRepository;

  TokenNotifier(this.tokenRepository) : super(const TokenState.initial()) {
    fetchToken();
  }

  bool get isFetching =>
      state.state != TokenConcreteState.loading &&
      state.state != TokenConcreteState.fetchingMore;

  Future<void> fetchToken() async {
    if (isFetching && state.state != TokenConcreteState.fetchedAllTokens) {
      state = state.copyWith(
        state: state.page > 0
            ? TokenConcreteState.fetchedAllTokens
            : TokenConcreteState.loading,
        isLoading: true,
      );

      final response =
          await tokenRepository.fetchToken(skip: state.page * ITEM_PER_PAGE);
      updateStateFromResponse(response);
      print("Page :${state.page}");
    } else {
      state = state.copyWith(
        state: TokenConcreteState.fetchedAllTokens,
        message: 'No more products available',
        isLoading: false,
      );
    }
  }

  void updateStateFromResponse(
      Either<VersaException, PaginatedResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: TokenConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final tokenList = data.data.map((e) => Token.fromJson(e)).toList();

      final totalToken = [...state.tokenList, ...tokenList];

      state = state.copyWith(
        tokenList: totalToken,
        state: totalToken.length == data.total
            ? TokenConcreteState.fetchedAllTokens
            : TokenConcreteState.loaded,
        hasData: true,
        message: totalToken.isEmpty ? 'No products found' : '',
        page: totalToken.length ~/ ITEM_PER_PAGE,
        total: data.total,
        isLoading: false,
      );
    });
  }

  void RouteToken(String symbol, Function callback) {
    final tokenItem =
        state.tokenList.where((item) => item.symbol == symbol).toList();

    if (tokenItem.isNotEmpty) {
      final firstItem = tokenItem.first;
      // เรียก callback พร้อมข้อมูล firstItem เมื่อพบ

      state = state.copyWith(state: TokenConcreteState.loaded);
      callback(true, firstItem); 
    } else {
      // ถ้าไม่พบ token ที่ตรงกับเงื่อนไข
      state = state.copyWith(state: TokenConcreteState.failure);
      callback(false, null);
    }
  }
}
