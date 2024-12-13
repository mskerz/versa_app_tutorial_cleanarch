// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get totalSupply => throw _privateConstructorUsedError;
  int get tokenPrice => throw _privateConstructorUsedError;
  int get minInvestment => throw _privateConstructorUsedError;
  int get maxInvestment => throw _privateConstructorUsedError;
  int get fundingGoal => throw _privateConstructorUsedError;
  int get currentRaised => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Whitepaper get whitepaper => throw _privateConstructorUsedError;

  /// Serializes this Token to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call(
      {String symbol,
      String name,
      String status,
      String tokenType,
      String category,
      int totalSupply,
      int tokenPrice,
      int minInvestment,
      int maxInvestment,
      int fundingGoal,
      int currentRaised,
      String startDate,
      String endDate,
      String description,
      Whitepaper whitepaper});

  $WhitepaperCopyWith<$Res> get whitepaper;
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? status = null,
    Object? tokenType = null,
    Object? category = null,
    Object? totalSupply = null,
    Object? tokenPrice = null,
    Object? minInvestment = null,
    Object? maxInvestment = null,
    Object? fundingGoal = null,
    Object? currentRaised = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
    Object? whitepaper = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      totalSupply: null == totalSupply
          ? _value.totalSupply
          : totalSupply // ignore: cast_nullable_to_non_nullable
              as int,
      tokenPrice: null == tokenPrice
          ? _value.tokenPrice
          : tokenPrice // ignore: cast_nullable_to_non_nullable
              as int,
      minInvestment: null == minInvestment
          ? _value.minInvestment
          : minInvestment // ignore: cast_nullable_to_non_nullable
              as int,
      maxInvestment: null == maxInvestment
          ? _value.maxInvestment
          : maxInvestment // ignore: cast_nullable_to_non_nullable
              as int,
      fundingGoal: null == fundingGoal
          ? _value.fundingGoal
          : fundingGoal // ignore: cast_nullable_to_non_nullable
              as int,
      currentRaised: null == currentRaised
          ? _value.currentRaised
          : currentRaised // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      whitepaper: null == whitepaper
          ? _value.whitepaper
          : whitepaper // ignore: cast_nullable_to_non_nullable
              as Whitepaper,
    ) as $Val);
  }

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WhitepaperCopyWith<$Res> get whitepaper {
    return $WhitepaperCopyWith<$Res>(_value.whitepaper, (value) {
      return _then(_value.copyWith(whitepaper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TokenImplCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$TokenImplCopyWith(
          _$TokenImpl value, $Res Function(_$TokenImpl) then) =
      __$$TokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      String name,
      String status,
      String tokenType,
      String category,
      int totalSupply,
      int tokenPrice,
      int minInvestment,
      int maxInvestment,
      int fundingGoal,
      int currentRaised,
      String startDate,
      String endDate,
      String description,
      Whitepaper whitepaper});

  @override
  $WhitepaperCopyWith<$Res> get whitepaper;
}

/// @nodoc
class __$$TokenImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$TokenImpl>
    implements _$$TokenImplCopyWith<$Res> {
  __$$TokenImplCopyWithImpl(
      _$TokenImpl _value, $Res Function(_$TokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? status = null,
    Object? tokenType = null,
    Object? category = null,
    Object? totalSupply = null,
    Object? tokenPrice = null,
    Object? minInvestment = null,
    Object? maxInvestment = null,
    Object? fundingGoal = null,
    Object? currentRaised = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
    Object? whitepaper = null,
  }) {
    return _then(_$TokenImpl(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      totalSupply: null == totalSupply
          ? _value.totalSupply
          : totalSupply // ignore: cast_nullable_to_non_nullable
              as int,
      tokenPrice: null == tokenPrice
          ? _value.tokenPrice
          : tokenPrice // ignore: cast_nullable_to_non_nullable
              as int,
      minInvestment: null == minInvestment
          ? _value.minInvestment
          : minInvestment // ignore: cast_nullable_to_non_nullable
              as int,
      maxInvestment: null == maxInvestment
          ? _value.maxInvestment
          : maxInvestment // ignore: cast_nullable_to_non_nullable
              as int,
      fundingGoal: null == fundingGoal
          ? _value.fundingGoal
          : fundingGoal // ignore: cast_nullable_to_non_nullable
              as int,
      currentRaised: null == currentRaised
          ? _value.currentRaised
          : currentRaised // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      whitepaper: null == whitepaper
          ? _value.whitepaper
          : whitepaper // ignore: cast_nullable_to_non_nullable
              as Whitepaper,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenImpl implements _Token {
  _$TokenImpl(
      {this.symbol = '',
      this.name = '',
      this.status = '',
      this.tokenType = '',
      this.category = '',
      this.totalSupply = 0,
      this.tokenPrice = 0,
      this.minInvestment = 0,
      this.maxInvestment = 0,
      this.fundingGoal = 0,
      this.currentRaised = 0,
      this.startDate = '',
      this.endDate = '',
      this.description = '',
      required this.whitepaper});

  factory _$TokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenImplFromJson(json);

  @override
  @JsonKey()
  final String symbol;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String tokenType;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final int totalSupply;
  @override
  @JsonKey()
  final int tokenPrice;
  @override
  @JsonKey()
  final int minInvestment;
  @override
  @JsonKey()
  final int maxInvestment;
  @override
  @JsonKey()
  final int fundingGoal;
  @override
  @JsonKey()
  final int currentRaised;
  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;
  @override
  @JsonKey()
  final String description;
  @override
  final Whitepaper whitepaper;

  @override
  String toString() {
    return 'Token(symbol: $symbol, name: $name, status: $status, tokenType: $tokenType, category: $category, totalSupply: $totalSupply, tokenPrice: $tokenPrice, minInvestment: $minInvestment, maxInvestment: $maxInvestment, fundingGoal: $fundingGoal, currentRaised: $currentRaised, startDate: $startDate, endDate: $endDate, description: $description, whitepaper: $whitepaper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.totalSupply, totalSupply) ||
                other.totalSupply == totalSupply) &&
            (identical(other.tokenPrice, tokenPrice) ||
                other.tokenPrice == tokenPrice) &&
            (identical(other.minInvestment, minInvestment) ||
                other.minInvestment == minInvestment) &&
            (identical(other.maxInvestment, maxInvestment) ||
                other.maxInvestment == maxInvestment) &&
            (identical(other.fundingGoal, fundingGoal) ||
                other.fundingGoal == fundingGoal) &&
            (identical(other.currentRaised, currentRaised) ||
                other.currentRaised == currentRaised) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.whitepaper, whitepaper) ||
                other.whitepaper == whitepaper));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      symbol,
      name,
      status,
      tokenType,
      category,
      totalSupply,
      tokenPrice,
      minInvestment,
      maxInvestment,
      fundingGoal,
      currentRaised,
      startDate,
      endDate,
      description,
      whitepaper);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      __$$TokenImplCopyWithImpl<_$TokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenImplToJson(
      this,
    );
  }
}

abstract class _Token implements Token {
  factory _Token(
      {final String symbol,
      final String name,
      final String status,
      final String tokenType,
      final String category,
      final int totalSupply,
      final int tokenPrice,
      final int minInvestment,
      final int maxInvestment,
      final int fundingGoal,
      final int currentRaised,
      final String startDate,
      final String endDate,
      final String description,
      required final Whitepaper whitepaper}) = _$TokenImpl;

  factory _Token.fromJson(Map<String, dynamic> json) = _$TokenImpl.fromJson;

  @override
  String get symbol;
  @override
  String get name;
  @override
  String get status;
  @override
  String get tokenType;
  @override
  String get category;
  @override
  int get totalSupply;
  @override
  int get tokenPrice;
  @override
  int get minInvestment;
  @override
  int get maxInvestment;
  @override
  int get fundingGoal;
  @override
  int get currentRaised;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String get description;
  @override
  Whitepaper get whitepaper;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Whitepaper _$WhitepaperFromJson(Map<String, dynamic> json) {
  return _Whitepaper.fromJson(json);
}

/// @nodoc
mixin _$Whitepaper {
  String get overview => throw _privateConstructorUsedError;
  List<String> get problemStatement => throw _privateConstructorUsedError;
  List<String> get solution => throw _privateConstructorUsedError;
  TechnicalArchitecture get technicalArchitecture =>
      throw _privateConstructorUsedError;

  /// Serializes this Whitepaper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Whitepaper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WhitepaperCopyWith<Whitepaper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhitepaperCopyWith<$Res> {
  factory $WhitepaperCopyWith(
          Whitepaper value, $Res Function(Whitepaper) then) =
      _$WhitepaperCopyWithImpl<$Res, Whitepaper>;
  @useResult
  $Res call(
      {String overview,
      List<String> problemStatement,
      List<String> solution,
      TechnicalArchitecture technicalArchitecture});

  $TechnicalArchitectureCopyWith<$Res> get technicalArchitecture;
}

/// @nodoc
class _$WhitepaperCopyWithImpl<$Res, $Val extends Whitepaper>
    implements $WhitepaperCopyWith<$Res> {
  _$WhitepaperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Whitepaper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = null,
    Object? problemStatement = null,
    Object? solution = null,
    Object? technicalArchitecture = null,
  }) {
    return _then(_value.copyWith(
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      problemStatement: null == problemStatement
          ? _value.problemStatement
          : problemStatement // ignore: cast_nullable_to_non_nullable
              as List<String>,
      solution: null == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as List<String>,
      technicalArchitecture: null == technicalArchitecture
          ? _value.technicalArchitecture
          : technicalArchitecture // ignore: cast_nullable_to_non_nullable
              as TechnicalArchitecture,
    ) as $Val);
  }

  /// Create a copy of Whitepaper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TechnicalArchitectureCopyWith<$Res> get technicalArchitecture {
    return $TechnicalArchitectureCopyWith<$Res>(_value.technicalArchitecture,
        (value) {
      return _then(_value.copyWith(technicalArchitecture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WhitepaperImplCopyWith<$Res>
    implements $WhitepaperCopyWith<$Res> {
  factory _$$WhitepaperImplCopyWith(
          _$WhitepaperImpl value, $Res Function(_$WhitepaperImpl) then) =
      __$$WhitepaperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String overview,
      List<String> problemStatement,
      List<String> solution,
      TechnicalArchitecture technicalArchitecture});

  @override
  $TechnicalArchitectureCopyWith<$Res> get technicalArchitecture;
}

/// @nodoc
class __$$WhitepaperImplCopyWithImpl<$Res>
    extends _$WhitepaperCopyWithImpl<$Res, _$WhitepaperImpl>
    implements _$$WhitepaperImplCopyWith<$Res> {
  __$$WhitepaperImplCopyWithImpl(
      _$WhitepaperImpl _value, $Res Function(_$WhitepaperImpl) _then)
      : super(_value, _then);

  /// Create a copy of Whitepaper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overview = null,
    Object? problemStatement = null,
    Object? solution = null,
    Object? technicalArchitecture = null,
  }) {
    return _then(_$WhitepaperImpl(
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      problemStatement: null == problemStatement
          ? _value._problemStatement
          : problemStatement // ignore: cast_nullable_to_non_nullable
              as List<String>,
      solution: null == solution
          ? _value._solution
          : solution // ignore: cast_nullable_to_non_nullable
              as List<String>,
      technicalArchitecture: null == technicalArchitecture
          ? _value.technicalArchitecture
          : technicalArchitecture // ignore: cast_nullable_to_non_nullable
              as TechnicalArchitecture,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WhitepaperImpl implements _Whitepaper {
  _$WhitepaperImpl(
      {required this.overview,
      required final List<String> problemStatement,
      required final List<String> solution,
      required this.technicalArchitecture})
      : _problemStatement = problemStatement,
        _solution = solution;

  factory _$WhitepaperImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhitepaperImplFromJson(json);

  @override
  final String overview;
  final List<String> _problemStatement;
  @override
  List<String> get problemStatement {
    if (_problemStatement is EqualUnmodifiableListView)
      return _problemStatement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problemStatement);
  }

  final List<String> _solution;
  @override
  List<String> get solution {
    if (_solution is EqualUnmodifiableListView) return _solution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_solution);
  }

  @override
  final TechnicalArchitecture technicalArchitecture;

  @override
  String toString() {
    return 'Whitepaper(overview: $overview, problemStatement: $problemStatement, solution: $solution, technicalArchitecture: $technicalArchitecture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhitepaperImpl &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            const DeepCollectionEquality()
                .equals(other._problemStatement, _problemStatement) &&
            const DeepCollectionEquality().equals(other._solution, _solution) &&
            (identical(other.technicalArchitecture, technicalArchitecture) ||
                other.technicalArchitecture == technicalArchitecture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      overview,
      const DeepCollectionEquality().hash(_problemStatement),
      const DeepCollectionEquality().hash(_solution),
      technicalArchitecture);

  /// Create a copy of Whitepaper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WhitepaperImplCopyWith<_$WhitepaperImpl> get copyWith =>
      __$$WhitepaperImplCopyWithImpl<_$WhitepaperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WhitepaperImplToJson(
      this,
    );
  }
}

abstract class _Whitepaper implements Whitepaper {
  factory _Whitepaper(
          {required final String overview,
          required final List<String> problemStatement,
          required final List<String> solution,
          required final TechnicalArchitecture technicalArchitecture}) =
      _$WhitepaperImpl;

  factory _Whitepaper.fromJson(Map<String, dynamic> json) =
      _$WhitepaperImpl.fromJson;

  @override
  String get overview;
  @override
  List<String> get problemStatement;
  @override
  List<String> get solution;
  @override
  TechnicalArchitecture get technicalArchitecture;

  /// Create a copy of Whitepaper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WhitepaperImplCopyWith<_$WhitepaperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TechnicalArchitecture _$TechnicalArchitectureFromJson(
    Map<String, dynamic> json) {
  return _TechnicalArchitecture.fromJson(json);
}

/// @nodoc
mixin _$TechnicalArchitecture {
  String get blockchain => throw _privateConstructorUsedError;
  String get tokenStandard => throw _privateConstructorUsedError;
  bool get smartContractAudited => throw _privateConstructorUsedError;

  /// Serializes this TechnicalArchitecture to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TechnicalArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TechnicalArchitectureCopyWith<TechnicalArchitecture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnicalArchitectureCopyWith<$Res> {
  factory $TechnicalArchitectureCopyWith(TechnicalArchitecture value,
          $Res Function(TechnicalArchitecture) then) =
      _$TechnicalArchitectureCopyWithImpl<$Res, TechnicalArchitecture>;
  @useResult
  $Res call(
      {String blockchain, String tokenStandard, bool smartContractAudited});
}

/// @nodoc
class _$TechnicalArchitectureCopyWithImpl<$Res,
        $Val extends TechnicalArchitecture>
    implements $TechnicalArchitectureCopyWith<$Res> {
  _$TechnicalArchitectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TechnicalArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchain = null,
    Object? tokenStandard = null,
    Object? smartContractAudited = null,
  }) {
    return _then(_value.copyWith(
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      tokenStandard: null == tokenStandard
          ? _value.tokenStandard
          : tokenStandard // ignore: cast_nullable_to_non_nullable
              as String,
      smartContractAudited: null == smartContractAudited
          ? _value.smartContractAudited
          : smartContractAudited // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TechnicalArchitectureImplCopyWith<$Res>
    implements $TechnicalArchitectureCopyWith<$Res> {
  factory _$$TechnicalArchitectureImplCopyWith(
          _$TechnicalArchitectureImpl value,
          $Res Function(_$TechnicalArchitectureImpl) then) =
      __$$TechnicalArchitectureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String blockchain, String tokenStandard, bool smartContractAudited});
}

/// @nodoc
class __$$TechnicalArchitectureImplCopyWithImpl<$Res>
    extends _$TechnicalArchitectureCopyWithImpl<$Res,
        _$TechnicalArchitectureImpl>
    implements _$$TechnicalArchitectureImplCopyWith<$Res> {
  __$$TechnicalArchitectureImplCopyWithImpl(_$TechnicalArchitectureImpl _value,
      $Res Function(_$TechnicalArchitectureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TechnicalArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchain = null,
    Object? tokenStandard = null,
    Object? smartContractAudited = null,
  }) {
    return _then(_$TechnicalArchitectureImpl(
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      tokenStandard: null == tokenStandard
          ? _value.tokenStandard
          : tokenStandard // ignore: cast_nullable_to_non_nullable
              as String,
      smartContractAudited: null == smartContractAudited
          ? _value.smartContractAudited
          : smartContractAudited // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TechnicalArchitectureImpl implements _TechnicalArchitecture {
  _$TechnicalArchitectureImpl(
      {required this.blockchain,
      required this.tokenStandard,
      required this.smartContractAudited});

  factory _$TechnicalArchitectureImpl.fromJson(Map<String, dynamic> json) =>
      _$$TechnicalArchitectureImplFromJson(json);

  @override
  final String blockchain;
  @override
  final String tokenStandard;
  @override
  final bool smartContractAudited;

  @override
  String toString() {
    return 'TechnicalArchitecture(blockchain: $blockchain, tokenStandard: $tokenStandard, smartContractAudited: $smartContractAudited)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechnicalArchitectureImpl &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain) &&
            (identical(other.tokenStandard, tokenStandard) ||
                other.tokenStandard == tokenStandard) &&
            (identical(other.smartContractAudited, smartContractAudited) ||
                other.smartContractAudited == smartContractAudited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, blockchain, tokenStandard, smartContractAudited);

  /// Create a copy of TechnicalArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TechnicalArchitectureImplCopyWith<_$TechnicalArchitectureImpl>
      get copyWith => __$$TechnicalArchitectureImplCopyWithImpl<
          _$TechnicalArchitectureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TechnicalArchitectureImplToJson(
      this,
    );
  }
}

abstract class _TechnicalArchitecture implements TechnicalArchitecture {
  factory _TechnicalArchitecture(
      {required final String blockchain,
      required final String tokenStandard,
      required final bool smartContractAudited}) = _$TechnicalArchitectureImpl;

  factory _TechnicalArchitecture.fromJson(Map<String, dynamic> json) =
      _$TechnicalArchitectureImpl.fromJson;

  @override
  String get blockchain;
  @override
  String get tokenStandard;
  @override
  bool get smartContractAudited;

  /// Create a copy of TechnicalArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TechnicalArchitectureImplCopyWith<_$TechnicalArchitectureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
