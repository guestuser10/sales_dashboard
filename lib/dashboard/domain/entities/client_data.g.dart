// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClienteCollection on Isar {
  IsarCollection<Cliente> get clientes => this.collection();
}

const ClienteSchema = CollectionSchema(
  name: r'Cliente',
  id: 8668185751114761648,
  properties: {
    r'nombre': PropertySchema(
      id: 0,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'telefono': PropertySchema(
      id: 1,
      name: r'telefono',
      type: IsarType.string,
    )
  },
  estimateSize: _clienteEstimateSize,
  serialize: _clienteSerialize,
  deserialize: _clienteDeserialize,
  deserializeProp: _clienteDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'deudas': LinkSchema(
      id: -5548463361717132473,
      name: r'deudas',
      target: r'Deuda',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _clienteGetId,
  getLinks: _clienteGetLinks,
  attach: _clienteAttach,
  version: '3.1.0+1',
);

int _clienteEstimateSize(
  Cliente object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.telefono.length * 3;
  return bytesCount;
}

void _clienteSerialize(
  Cliente object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nombre);
  writer.writeString(offsets[1], object.telefono);
}

Cliente _clienteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Cliente(
    nombre: reader.readString(offsets[0]),
    telefono: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _clienteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clienteGetId(Cliente object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clienteGetLinks(Cliente object) {
  return [object.deudas];
}

void _clienteAttach(IsarCollection<dynamic> col, Id id, Cliente object) {
  object.id = id;
  object.deudas.attach(col, col.isar.collection<Deuda>(), r'deudas', id);
}

extension ClienteQueryWhereSort on QueryBuilder<Cliente, Cliente, QWhere> {
  QueryBuilder<Cliente, Cliente, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClienteQueryWhere on QueryBuilder<Cliente, Cliente, QWhereClause> {
  QueryBuilder<Cliente, Cliente, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClienteQueryFilter
    on QueryBuilder<Cliente, Cliente, QFilterCondition> {
  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefono',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefono',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefono',
        value: '',
      ));
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> telefonoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefono',
        value: '',
      ));
    });
  }
}

extension ClienteQueryObject
    on QueryBuilder<Cliente, Cliente, QFilterCondition> {}

extension ClienteQueryLinks
    on QueryBuilder<Cliente, Cliente, QFilterCondition> {
  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> deudas(
      FilterQuery<Deuda> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'deudas');
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> deudasLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'deudas', length, true, length, true);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> deudasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'deudas', 0, true, 0, true);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> deudasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'deudas', 0, false, 999999, true);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> deudasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'deudas', 0, true, length, include);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> deudasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'deudas', length, include, 999999, true);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterFilterCondition> deudasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'deudas', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ClienteQuerySortBy on QueryBuilder<Cliente, Cliente, QSortBy> {
  QueryBuilder<Cliente, Cliente, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterSortBy> sortByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterSortBy> sortByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension ClienteQuerySortThenBy
    on QueryBuilder<Cliente, Cliente, QSortThenBy> {
  QueryBuilder<Cliente, Cliente, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterSortBy> thenByTelefono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.asc);
    });
  }

  QueryBuilder<Cliente, Cliente, QAfterSortBy> thenByTelefonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telefono', Sort.desc);
    });
  }
}

extension ClienteQueryWhereDistinct
    on QueryBuilder<Cliente, Cliente, QDistinct> {
  QueryBuilder<Cliente, Cliente, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cliente, Cliente, QDistinct> distinctByTelefono(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefono', caseSensitive: caseSensitive);
    });
  }
}

extension ClienteQueryProperty
    on QueryBuilder<Cliente, Cliente, QQueryProperty> {
  QueryBuilder<Cliente, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Cliente, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Cliente, String, QQueryOperations> telefonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefono');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDeudaCollection on Isar {
  IsarCollection<Deuda> get deudas => this.collection();
}

const DeudaSchema = CollectionSchema(
  name: r'Deuda',
  id: 3405603411988045056,
  properties: {
    r'activo': PropertySchema(
      id: 0,
      name: r'activo',
      type: IsarType.bool,
    ),
    r'fechaUltimoAbono': PropertySchema(
      id: 1,
      name: r'fechaUltimoAbono',
      type: IsarType.dateTime,
    ),
    r'monto': PropertySchema(
      id: 2,
      name: r'monto',
      type: IsarType.double,
    ),
    r'motivoDeDeuda': PropertySchema(
      id: 3,
      name: r'motivoDeDeuda',
      type: IsarType.string,
    ),
    r'totalDeAbono': PropertySchema(
      id: 4,
      name: r'totalDeAbono',
      type: IsarType.double,
    )
  },
  estimateSize: _deudaEstimateSize,
  serialize: _deudaSerialize,
  deserialize: _deudaDeserialize,
  deserializeProp: _deudaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'cliente': LinkSchema(
      id: -8613730439457986933,
      name: r'cliente',
      target: r'Cliente',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _deudaGetId,
  getLinks: _deudaGetLinks,
  attach: _deudaAttach,
  version: '3.1.0+1',
);

int _deudaEstimateSize(
  Deuda object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.motivoDeDeuda.length * 3;
  return bytesCount;
}

void _deudaSerialize(
  Deuda object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activo);
  writer.writeDateTime(offsets[1], object.fechaUltimoAbono);
  writer.writeDouble(offsets[2], object.monto);
  writer.writeString(offsets[3], object.motivoDeDeuda);
  writer.writeDouble(offsets[4], object.totalDeAbono);
}

Deuda _deudaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Deuda(
    fechaUltimoAbono: reader.readDateTime(offsets[1]),
    monto: reader.readDouble(offsets[2]),
    motivoDeDeuda: reader.readString(offsets[3]),
  );
  object.activo = reader.readBool(offsets[0]);
  object.id = id;
  object.totalDeAbono = reader.readDouble(offsets[4]);
  return object;
}

P _deudaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _deudaGetId(Deuda object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _deudaGetLinks(Deuda object) {
  return [object.cliente];
}

void _deudaAttach(IsarCollection<dynamic> col, Id id, Deuda object) {
  object.id = id;
  object.cliente.attach(col, col.isar.collection<Cliente>(), r'cliente', id);
}

extension DeudaQueryWhereSort on QueryBuilder<Deuda, Deuda, QWhere> {
  QueryBuilder<Deuda, Deuda, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeudaQueryWhere on QueryBuilder<Deuda, Deuda, QWhereClause> {
  QueryBuilder<Deuda, Deuda, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeudaQueryFilter on QueryBuilder<Deuda, Deuda, QFilterCondition> {
  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> activoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> fechaUltimoAbonoEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaUltimoAbono',
        value: value,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> fechaUltimoAbonoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaUltimoAbono',
        value: value,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> fechaUltimoAbonoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaUltimoAbono',
        value: value,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> fechaUltimoAbonoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaUltimoAbono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> montoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> montoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> montoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monto',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> montoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoDeDeuda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'motivoDeDeuda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'motivoDeDeuda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'motivoDeDeuda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'motivoDeDeuda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'motivoDeDeuda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'motivoDeDeuda',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'motivoDeDeuda',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivoDeDeuda',
        value: '',
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> motivoDeDeudaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'motivoDeDeuda',
        value: '',
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> totalDeAbonoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDeAbono',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> totalDeAbonoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDeAbono',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> totalDeAbonoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDeAbono',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> totalDeAbonoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDeAbono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DeudaQueryObject on QueryBuilder<Deuda, Deuda, QFilterCondition> {}

extension DeudaQueryLinks on QueryBuilder<Deuda, Deuda, QFilterCondition> {
  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> cliente(
      FilterQuery<Cliente> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'cliente');
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterFilterCondition> clienteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cliente', 0, true, 0, true);
    });
  }
}

extension DeudaQuerySortBy on QueryBuilder<Deuda, Deuda, QSortBy> {
  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByFechaUltimoAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoAbono', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByFechaUltimoAbonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoAbono', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByMotivoDeDeuda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDeDeuda', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByMotivoDeDeudaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDeDeuda', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByTotalDeAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDeAbono', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> sortByTotalDeAbonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDeAbono', Sort.desc);
    });
  }
}

extension DeudaQuerySortThenBy on QueryBuilder<Deuda, Deuda, QSortThenBy> {
  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByFechaUltimoAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoAbono', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByFechaUltimoAbonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoAbono', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByMontoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monto', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByMotivoDeDeuda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDeDeuda', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByMotivoDeDeudaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'motivoDeDeuda', Sort.desc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByTotalDeAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDeAbono', Sort.asc);
    });
  }

  QueryBuilder<Deuda, Deuda, QAfterSortBy> thenByTotalDeAbonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDeAbono', Sort.desc);
    });
  }
}

extension DeudaQueryWhereDistinct on QueryBuilder<Deuda, Deuda, QDistinct> {
  QueryBuilder<Deuda, Deuda, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<Deuda, Deuda, QDistinct> distinctByFechaUltimoAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaUltimoAbono');
    });
  }

  QueryBuilder<Deuda, Deuda, QDistinct> distinctByMonto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monto');
    });
  }

  QueryBuilder<Deuda, Deuda, QDistinct> distinctByMotivoDeDeuda(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivoDeDeuda',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Deuda, Deuda, QDistinct> distinctByTotalDeAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDeAbono');
    });
  }
}

extension DeudaQueryProperty on QueryBuilder<Deuda, Deuda, QQueryProperty> {
  QueryBuilder<Deuda, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Deuda, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<Deuda, DateTime, QQueryOperations> fechaUltimoAbonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaUltimoAbono');
    });
  }

  QueryBuilder<Deuda, double, QQueryOperations> montoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monto');
    });
  }

  QueryBuilder<Deuda, String, QQueryOperations> motivoDeDeudaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivoDeDeuda');
    });
  }

  QueryBuilder<Deuda, double, QQueryOperations> totalDeAbonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDeAbono');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPagoCollection on Isar {
  IsarCollection<Pago> get pagos => this.collection();
}

const PagoSchema = CollectionSchema(
  name: r'Pago',
  id: 6195413862887410600,
  properties: {
    r'fechaPago': PropertySchema(
      id: 0,
      name: r'fechaPago',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 1,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 2,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'montoDeAbono': PropertySchema(
      id: 3,
      name: r'montoDeAbono',
      type: IsarType.double,
    )
  },
  estimateSize: _pagoEstimateSize,
  serialize: _pagoSerialize,
  deserialize: _pagoDeserialize,
  deserializeProp: _pagoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'deuda': LinkSchema(
      id: 8272584257092508709,
      name: r'deuda',
      target: r'Deuda',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _pagoGetId,
  getLinks: _pagoGetLinks,
  attach: _pagoAttach,
  version: '3.1.0+1',
);

int _pagoEstimateSize(
  Pago object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _pagoSerialize(
  Pago object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.fechaPago);
  writer.writeDouble(offsets[1], object.latitude);
  writer.writeDouble(offsets[2], object.longitude);
  writer.writeDouble(offsets[3], object.montoDeAbono);
}

Pago _pagoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pago(
    fechaPago: reader.readDateTime(offsets[0]),
    latitude: reader.readDouble(offsets[1]),
    longitude: reader.readDouble(offsets[2]),
    montoDeAbono: reader.readDouble(offsets[3]),
  );
  object.id = id;
  return object;
}

P _pagoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pagoGetId(Pago object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pagoGetLinks(Pago object) {
  return [object.deuda];
}

void _pagoAttach(IsarCollection<dynamic> col, Id id, Pago object) {
  object.id = id;
  object.deuda.attach(col, col.isar.collection<Deuda>(), r'deuda', id);
}

extension PagoQueryWhereSort on QueryBuilder<Pago, Pago, QWhere> {
  QueryBuilder<Pago, Pago, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PagoQueryWhere on QueryBuilder<Pago, Pago, QWhereClause> {
  QueryBuilder<Pago, Pago, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Pago, Pago, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Pago, Pago, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pago, Pago, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PagoQueryFilter on QueryBuilder<Pago, Pago, QFilterCondition> {
  QueryBuilder<Pago, Pago, QAfterFilterCondition> fechaPagoEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaPago',
        value: value,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> fechaPagoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaPago',
        value: value,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> fechaPagoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaPago',
        value: value,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> fechaPagoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaPago',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> montoDeAbonoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'montoDeAbono',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> montoDeAbonoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'montoDeAbono',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> montoDeAbonoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'montoDeAbono',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> montoDeAbonoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'montoDeAbono',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PagoQueryObject on QueryBuilder<Pago, Pago, QFilterCondition> {}

extension PagoQueryLinks on QueryBuilder<Pago, Pago, QFilterCondition> {
  QueryBuilder<Pago, Pago, QAfterFilterCondition> deuda(FilterQuery<Deuda> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'deuda');
    });
  }

  QueryBuilder<Pago, Pago, QAfterFilterCondition> deudaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'deuda', 0, true, 0, true);
    });
  }
}

extension PagoQuerySortBy on QueryBuilder<Pago, Pago, QSortBy> {
  QueryBuilder<Pago, Pago, QAfterSortBy> sortByFechaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaPago', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> sortByFechaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaPago', Sort.desc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> sortByMontoDeAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoDeAbono', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> sortByMontoDeAbonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoDeAbono', Sort.desc);
    });
  }
}

extension PagoQuerySortThenBy on QueryBuilder<Pago, Pago, QSortThenBy> {
  QueryBuilder<Pago, Pago, QAfterSortBy> thenByFechaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaPago', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenByFechaPagoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaPago', Sort.desc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenByMontoDeAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoDeAbono', Sort.asc);
    });
  }

  QueryBuilder<Pago, Pago, QAfterSortBy> thenByMontoDeAbonoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'montoDeAbono', Sort.desc);
    });
  }
}

extension PagoQueryWhereDistinct on QueryBuilder<Pago, Pago, QDistinct> {
  QueryBuilder<Pago, Pago, QDistinct> distinctByFechaPago() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaPago');
    });
  }

  QueryBuilder<Pago, Pago, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<Pago, Pago, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<Pago, Pago, QDistinct> distinctByMontoDeAbono() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'montoDeAbono');
    });
  }
}

extension PagoQueryProperty on QueryBuilder<Pago, Pago, QQueryProperty> {
  QueryBuilder<Pago, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pago, DateTime, QQueryOperations> fechaPagoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaPago');
    });
  }

  QueryBuilder<Pago, double, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Pago, double, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<Pago, double, QQueryOperations> montoDeAbonoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'montoDeAbono');
    });
  }
}
