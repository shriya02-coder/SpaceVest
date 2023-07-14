import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'companies_record.g.dart';

abstract class CompaniesRecord
    implements Built<CompaniesRecord, CompaniesRecordBuilder> {
  static Serializer<CompaniesRecord> get serializer =>
      _$companiesRecordSerializer;

  String? get description;

  String? get esg;

  @BuiltValueField(wireName: 'esg_rating')
  String? get esgRating;

  String? get name;

  String? get sector;

  @BuiltValueField(wireName: 'sustainability_goals')
  String? get sustainabilityGoals;

  String? get industry;

  String? get symbol;

  @BuiltValueField(wireName: 'stock_price')
  String? get stockPrice;

  String? get eps;

  String? get gps;

  String? get sps;

  String? get rank;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CompaniesRecordBuilder builder) => builder
    ..description = ''
    ..esg = ''
    ..esgRating = ''
    ..name = ''
    ..sector = ''
    ..sustainabilityGoals = ''
    ..industry = ''
    ..symbol = ''
    ..stockPrice = ''
    ..eps = ''
    ..gps = ''
    ..sps = ''
    ..rank = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CompaniesRecord._();
  factory CompaniesRecord([void Function(CompaniesRecordBuilder) updates]) =
      _$CompaniesRecord;

  static CompaniesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCompaniesRecordData({
  String? description,
  String? esg,
  String? esgRating,
  String? name,
  String? sector,
  String? sustainabilityGoals,
  String? industry,
  String? symbol,
  String? stockPrice,
  String? eps,
  String? gps,
  String? sps,
  String? rank,
}) {
  final firestoreData = serializers.toFirestore(
    CompaniesRecord.serializer,
    CompaniesRecord(
      (c) => c
        ..description = description
        ..esg = esg
        ..esgRating = esgRating
        ..name = name
        ..sector = sector
        ..sustainabilityGoals = sustainabilityGoals
        ..industry = industry
        ..symbol = symbol
        ..stockPrice = stockPrice
        ..eps = eps
        ..gps = gps
        ..sps = sps
        ..rank = rank,
    ),
  );

  return firestoreData;
}
