import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/domain/repositories/token_repository.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/either.dart';
import 'package:versa_app_tutorial_cleanarch/shared/exceptions/http_exception.dart';

// State ของ Token
class TokenState {
  final bool isLoading;
  final Either<AppException, List<Token>> tokens;

  TokenState({
    required this.isLoading,
    required this.tokens,
  });

  // ฟังก์ชันเพื่อให้ค่าของ state ที่ต้องการ
  factory TokenState.initial() => TokenState(
        isLoading: false,
        tokens: const Right([]), // TokenList ว่าง
      );

  TokenState copyWith({
    bool? isLoading,
    Either<AppException, List<Token>>? tokens,
  }) {
    return TokenState(
      isLoading: isLoading ?? this.isLoading,
      tokens: tokens ?? this.tokens,
    );
  }
}

// TokenNotifier ที่ทำงานกับ State
class TokenNotifier extends StateNotifier<TokenState> {
  final TokenRepository tokenRepository;

TokenNotifier(this.tokenRepository) : super(TokenState.initial()) {
    // เรียกใช้ fetchToken เมื่อเริ่มต้น
    fetchToken();
  }
  Future<void> fetchToken() async{
    state = state.copyWith(isLoading: true); // เปลี่ยนเป็นกำลัง��หลด
    final result = await tokenRepository.fetchToken();

    state = result.fold(
      (exception) => state.copyWith(
        isLoading: false,
        tokens: Left(exception),
      ),
      (tokens) => state.copyWith(
        isLoading: false,
        tokens: Right(tokens),
      ),
    );
  }

  Future<void> filterToken(String tokenStatus) async {
    state = state.copyWith(isLoading: true); // เปลี่ยนเป็นกำลังโหลด
    final result = await tokenRepository.fetchTokenbyStatus(tokenStatus);

    state = result.fold(
      (exception) => state.copyWith(
        isLoading: false,
        tokens: Left(exception),
      ),
      (tokens) => state.copyWith(
        isLoading: false,
        tokens: Right(tokens),
      ),
    );
  }
}
