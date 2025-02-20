import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/domain/repositories/token_repository.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/state/token_state.dart';
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

  Future<void> fetchToken() async {
    state = const TokenState.loading();

    final page = state.maybeWhen(
      success: (token, total, page) => page,
      orElse: () => 0, // กรณีอื่นๆ คืนค่าเป็น 0
    );
    final response =
        await tokenRepository.fetchToken(skip: page*ITEM_PER_PAGE);
    updateStateFromResponse(response);
    print("Page :$page");
   
  }

  void updateStateFromResponse(
      Either<VersaException, PaginatedResponse<dynamic>> response) {
    response.fold(
      (failure) {
        state = TokenState.failure(failure);
      },
      (data) {
        final tokenList = data.data.map((e) => Token.fromJson(e)).toList();

        if (tokenList.isEmpty) {
          state = const TokenState.empty();
        } else {
          state = TokenState.success(
              tokenList, tokenList.length ~/ ITEM_PER_PAGE, data.total);
        }
      },
    );
  }

  // void RouteToken(String symbol, Function routeCallback) {
  //   final tokenItem =
  //       state.tokenList.where((item) => item.symbol == symbol).toList();

  //   if (tokenItem.isNotEmpty) {
  //     final firstItem = tokenItem.first;
  //     // เรียก callback พร้อมข้อมูล firstItem เมื่อพบ

  //     state = state.copyWith(state: TokenConcreteState.loaded);
  //     routeCallback(true, firstItem);
  //   } else {
  //     // ถ้าไม่พบ token ที่ตรงกับเงื่อนไข
  //     state = state.copyWith(state: TokenConcreteState.failure);
  //     routeCallback(false, null);
  //   }
  // }

// ฟังก์ชันค้นหาตามคำที่กรอกใน search

  void autoSearch(String search)async {
    state.maybeWhen(
      success: (tokens, page, total)async {
        if (search.isEmpty) {
         await fetchToken();
        } else {
          final filteredTokens = tokens
              .where((token) =>
                  token.name.toLowerCase().contains(search.toLowerCase()) ||
                  token.symbol.toLowerCase().contains(search.toLowerCase()))
              .toList();

          if (filteredTokens.isEmpty) {
            state = const TokenState.empty();
          } else {
            state = TokenState.success(filteredTokens, page, total);
          }
        }
      },
      orElse: () {},
    );
  }
}
