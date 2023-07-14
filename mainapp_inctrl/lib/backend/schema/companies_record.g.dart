// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompaniesRecord> _$companiesRecordSerializer =
    new _$CompaniesRecordSerializer();

class _$CompaniesRecordSerializer
    implements StructuredSerializer<CompaniesRecord> {
  @override
  final Iterable<Type> types = const [CompaniesRecord, _$CompaniesRecord];
  @override
  final String wireName = 'CompaniesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CompaniesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.esg;
    if (value != null) {
      result
        ..add('esg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.esgRating;
    if (value != null) {
      result
        ..add('esg_rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sector;
    if (value != null) {
      result
        ..add('sector')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sustainabilityGoals;
    if (value != null) {
      result
        ..add('sustainability_goals')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.industry;
    if (value != null) {
      result
        ..add('industry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.symbol;
    if (value != null) {
      result
        ..add('symbol')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stockPrice;
    if (value != null) {
      result
        ..add('stock_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eps;
    if (value != null) {
      result
        ..add('eps')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gps;
    if (value != null) {
      result
        ..add('gps')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sps;
    if (value != null) {
      result
        ..add('sps')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rank;
    if (value != null) {
      result
        ..add('rank')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  CompaniesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompaniesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'esg':
          result.esg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'esg_rating':
          result.esgRating = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sector':
          result.sector = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sustainability_goals':
          result.sustainabilityGoals = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'industry':
          result.industry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'symbol':
          result.symbol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'stock_price':
          result.stockPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eps':
          result.eps = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gps':
          result.gps = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sps':
          result.sps = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rank':
          result.rank = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$CompaniesRecord extends CompaniesRecord {
  @override
  final String? description;
  @override
  final String? esg;
  @override
  final String? esgRating;
  @override
  final String? name;
  @override
  final String? sector;
  @override
  final String? sustainabilityGoals;
  @override
  final String? industry;
  @override
  final String? symbol;
  @override
  final String? stockPrice;
  @override
  final String? eps;
  @override
  final String? gps;
  @override
  final String? sps;
  @override
  final String? rank;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CompaniesRecord([void Function(CompaniesRecordBuilder)? updates]) =>
      (new CompaniesRecordBuilder()..update(updates))._build();

  _$CompaniesRecord._(
      {this.description,
      this.esg,
      this.esgRating,
      this.name,
      this.sector,
      this.sustainabilityGoals,
      this.industry,
      this.symbol,
      this.stockPrice,
      this.eps,
      this.gps,
      this.sps,
      this.rank,
      this.ffRef})
      : super._();

  @override
  CompaniesRecord rebuild(void Function(CompaniesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompaniesRecordBuilder toBuilder() =>
      new CompaniesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompaniesRecord &&
        description == other.description &&
        esg == other.esg &&
        esgRating == other.esgRating &&
        name == other.name &&
        sector == other.sector &&
        sustainabilityGoals == other.sustainabilityGoals &&
        industry == other.industry &&
        symbol == other.symbol &&
        stockPrice == other.stockPrice &&
        eps == other.eps &&
        gps == other.gps &&
        sps == other.sps &&
        rank == other.rank &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, esg.hashCode);
    _$hash = $jc(_$hash, esgRating.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, sector.hashCode);
    _$hash = $jc(_$hash, sustainabilityGoals.hashCode);
    _$hash = $jc(_$hash, industry.hashCode);
    _$hash = $jc(_$hash, symbol.hashCode);
    _$hash = $jc(_$hash, stockPrice.hashCode);
    _$hash = $jc(_$hash, eps.hashCode);
    _$hash = $jc(_$hash, gps.hashCode);
    _$hash = $jc(_$hash, sps.hashCode);
    _$hash = $jc(_$hash, rank.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompaniesRecord')
          ..add('description', description)
          ..add('esg', esg)
          ..add('esgRating', esgRating)
          ..add('name', name)
          ..add('sector', sector)
          ..add('sustainabilityGoals', sustainabilityGoals)
          ..add('industry', industry)
          ..add('symbol', symbol)
          ..add('stockPrice', stockPrice)
          ..add('eps', eps)
          ..add('gps', gps)
          ..add('sps', sps)
          ..add('rank', rank)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CompaniesRecordBuilder
    implements Builder<CompaniesRecord, CompaniesRecordBuilder> {
  _$CompaniesRecord? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _esg;
  String? get esg => _$this._esg;
  set esg(String? esg) => _$this._esg = esg;

  String? _esgRating;
  String? get esgRating => _$this._esgRating;
  set esgRating(String? esgRating) => _$this._esgRating = esgRating;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _sector;
  String? get sector => _$this._sector;
  set sector(String? sector) => _$this._sector = sector;

  String? _sustainabilityGoals;
  String? get sustainabilityGoals => _$this._sustainabilityGoals;
  set sustainabilityGoals(String? sustainabilityGoals) =>
      _$this._sustainabilityGoals = sustainabilityGoals;

  String? _industry;
  String? get industry => _$this._industry;
  set industry(String? industry) => _$this._industry = industry;

  String? _symbol;
  String? get symbol => _$this._symbol;
  set symbol(String? symbol) => _$this._symbol = symbol;

  String? _stockPrice;
  String? get stockPrice => _$this._stockPrice;
  set stockPrice(String? stockPrice) => _$this._stockPrice = stockPrice;

  String? _eps;
  String? get eps => _$this._eps;
  set eps(String? eps) => _$this._eps = eps;

  String? _gps;
  String? get gps => _$this._gps;
  set gps(String? gps) => _$this._gps = gps;

  String? _sps;
  String? get sps => _$this._sps;
  set sps(String? sps) => _$this._sps = sps;

  String? _rank;
  String? get rank => _$this._rank;
  set rank(String? rank) => _$this._rank = rank;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CompaniesRecordBuilder() {
    CompaniesRecord._initializeBuilder(this);
  }

  CompaniesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _esg = $v.esg;
      _esgRating = $v.esgRating;
      _name = $v.name;
      _sector = $v.sector;
      _sustainabilityGoals = $v.sustainabilityGoals;
      _industry = $v.industry;
      _symbol = $v.symbol;
      _stockPrice = $v.stockPrice;
      _eps = $v.eps;
      _gps = $v.gps;
      _sps = $v.sps;
      _rank = $v.rank;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompaniesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompaniesRecord;
  }

  @override
  void update(void Function(CompaniesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompaniesRecord build() => _build();

  _$CompaniesRecord _build() {
    final _$result = _$v ??
        new _$CompaniesRecord._(
            description: description,
            esg: esg,
            esgRating: esgRating,
            name: name,
            sector: sector,
            sustainabilityGoals: sustainabilityGoals,
            industry: industry,
            symbol: symbol,
            stockPrice: stockPrice,
            eps: eps,
            gps: gps,
            sps: sps,
            rank: rank,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
