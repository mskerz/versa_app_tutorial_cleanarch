// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      symbol: json['symbol'] as String? ?? '',
      name: json['name'] as String? ?? '',
      status: json['status'] as String? ?? '',
      companyName: json['company'] as String? ?? '',
      tokenType: json['tokenType'] as String? ?? '',
      category: json['category'] as String? ?? '',
      totalSupply: (json['totalSupply'] as num?)?.toInt() ?? 0,
      tokenPrice: (json['tokenPrice'] as num?)?.toInt() ?? 0,
      minInvestment: (json['minInvestment'] as num?)?.toInt() ?? 0,
      maxInvestment: (json['maxInvestment'] as num?)?.toInt() ?? 0,
      fundingGoal: (json['fundingGoal'] as num?)?.toInt() ?? 0,
      projectPeriod: (json['projectPeriod'] as num?)?.toInt() ?? 0,
      currentRaised: (json['currentRaised'] as num?)?.toInt() ?? 0,
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      description: json['description'] as String? ?? '',
      whitepaper:
          Whitepaper.fromJson(json['whitepaper'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'status': instance.status,
      'company': instance.companyName,
      'tokenType': instance.tokenType,
      'category': instance.category,
      'totalSupply': instance.totalSupply,
      'tokenPrice': instance.tokenPrice,
      'minInvestment': instance.minInvestment,
      'maxInvestment': instance.maxInvestment,
      'fundingGoal': instance.fundingGoal,
      'projectPeriod': instance.projectPeriod,
      'currentRaised': instance.currentRaised,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'whitepaper': instance.whitepaper,
    };

_$WhitepaperImpl _$$WhitepaperImplFromJson(Map<String, dynamic> json) =>
    _$WhitepaperImpl(
      overview: json['overview'] as String,
      problemStatement: (json['problemStatement'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      solution:
          (json['solution'] as List<dynamic>).map((e) => e as String).toList(),
      technicalArchitecture: TechnicalArchitecture.fromJson(
          json['technicalArchitecture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WhitepaperImplToJson(_$WhitepaperImpl instance) =>
    <String, dynamic>{
      'overview': instance.overview,
      'problemStatement': instance.problemStatement,
      'solution': instance.solution,
      'technicalArchitecture': instance.technicalArchitecture,
    };

_$TechnicalArchitectureImpl _$$TechnicalArchitectureImplFromJson(
        Map<String, dynamic> json) =>
    _$TechnicalArchitectureImpl(
      blockchain: json['blockchain'] as String,
      tokenStandard: json['tokenStandard'] as String,
      smartContractAudited: json['smartContractAudited'] as bool,
    );

Map<String, dynamic> _$$TechnicalArchitectureImplToJson(
        _$TechnicalArchitectureImpl instance) =>
    <String, dynamic>{
      'blockchain': instance.blockchain,
      'tokenStandard': instance.tokenStandard,
      'smartContractAudited': instance.smartContractAudited,
    };
