import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

typedef TokenList = List<Token>;

@freezed
class Token with _$Token {
  factory Token({
    @Default('') String symbol,
    @Default('') String name,
    @Default('') String status,
    @Default('') String tokenType,
    @Default('') String category,
    @Default(0) int totalSupply,
    @Default(0) int tokenPrice,
    @Default(0) int minInvestment,
    @Default(0) int maxInvestment,
    @Default(0) int fundingGoal,
    @Default(0) int currentRaised,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String description,
    required Whitepaper whitepaper,  // This will require a custom Whitepaper class
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

}

// You will need to define the Whitepaper class as well

@freezed
class Whitepaper with _$Whitepaper {
  factory Whitepaper({
    required String overview,
    required List<String> problemStatement,
    required List<String> solution,
    required TechnicalArchitecture technicalArchitecture,
  }) = _Whitepaper;

  factory Whitepaper.fromJson(Map<String, dynamic> json) => _$WhitepaperFromJson(json);
}

@freezed
class TechnicalArchitecture with _$TechnicalArchitecture {
  factory TechnicalArchitecture({
    required String blockchain,
    required String tokenStandard,
    required bool smartContractAudited,
  }) = _TechnicalArchitecture;

  factory TechnicalArchitecture.fromJson(Map<String, dynamic> json) => _$TechnicalArchitectureFromJson(json);
}
