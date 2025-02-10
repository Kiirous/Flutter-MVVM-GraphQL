import 'package:gql/ast.dart';

class Query$GetCountries {
  Query$GetCountries({
    required this.countries,
    this.$__typename = 'Query',
  });

  factory Query$GetCountries.fromJson(Map<String, dynamic> json) {
    final l$countries = json['countries'];
    final l$$__typename = json['__typename'];
    return Query$GetCountries(
      countries: (l$countries as List<dynamic>)
          .map((e) => Query$GetCountries$countries.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetCountries$countries> countries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$countries = countries;
    _resultData['countries'] = l$countries.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$countries = countries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$countries.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCountries || runtimeType != other.runtimeType) {
      return false;
    }
    final l$countries = countries;
    final lOther$countries = other.countries;
    if (l$countries.length != lOther$countries.length) {
      return false;
    }
    for (int i = 0; i < l$countries.length; i++) {
      final l$countries$entry = l$countries[i];
      final lOther$countries$entry = lOther$countries[i];
      if (l$countries$entry != lOther$countries$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetCountries on Query$GetCountries {
  CopyWith$Query$GetCountries<Query$GetCountries> get copyWith =>
      CopyWith$Query$GetCountries(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetCountries<TRes> {
  factory CopyWith$Query$GetCountries(
    Query$GetCountries instance,
    TRes Function(Query$GetCountries) then,
  ) = _CopyWithImpl$Query$GetCountries;

  factory CopyWith$Query$GetCountries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCountries;

  TRes call({
    List<Query$GetCountries$countries>? countries,
    String? $__typename,
  });
  TRes countries(
      Iterable<Query$GetCountries$countries> Function(
              Iterable<
                  CopyWith$Query$GetCountries$countries<
                      Query$GetCountries$countries>>)
          _fn);
}

class _CopyWithImpl$Query$GetCountries<TRes>
    implements CopyWith$Query$GetCountries<TRes> {
  _CopyWithImpl$Query$GetCountries(
    this._instance,
    this._then,
  );

  final Query$GetCountries _instance;

  final TRes Function(Query$GetCountries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? countries = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCountries(
        countries: countries == _undefined || countries == null
            ? _instance.countries
            : (countries as List<Query$GetCountries$countries>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes countries(
          Iterable<Query$GetCountries$countries> Function(
                  Iterable<
                      CopyWith$Query$GetCountries$countries<
                          Query$GetCountries$countries>>)
              _fn) =>
      call(
          countries: _fn(_instance.countries
              .map((e) => CopyWith$Query$GetCountries$countries(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetCountries<TRes>
    implements CopyWith$Query$GetCountries<TRes> {
  _CopyWithStubImpl$Query$GetCountries(this._res);

  TRes _res;

  call({
    List<Query$GetCountries$countries>? countries,
    String? $__typename,
  }) =>
      _res;

  countries(_fn) => _res;
}

const documentNodeQueryGetCountries = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetCountries'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'countries'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'code'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'continent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'code'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Query$GetCountries$countries {
  Query$GetCountries$countries({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    this.$__typename = 'Country',
  });

  factory Query$GetCountries$countries.fromJson(Map<String, dynamic> json) {
    final l$code = json['code'];
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$continent = json['continent'];
    final l$$__typename = json['__typename'];
    return Query$GetCountries$countries(
      code: (l$code as String),
      name: (l$name as String),
      phone: (l$phone as String),
      continent: Query$GetCountries$countries$continent.fromJson(
          (l$continent as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String code;

  final String name;

  final String phone;

  final Query$GetCountries$countries$continent continent;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$continent = continent;
    _resultData['continent'] = l$continent.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$name = name;
    final l$phone = phone;
    final l$continent = continent;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$name,
      l$phone,
      l$continent,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCountries$countries ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$continent = continent;
    final lOther$continent = other.continent;
    if (l$continent != lOther$continent) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetCountries$countries
    on Query$GetCountries$countries {
  CopyWith$Query$GetCountries$countries<Query$GetCountries$countries>
      get copyWith => CopyWith$Query$GetCountries$countries(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCountries$countries<TRes> {
  factory CopyWith$Query$GetCountries$countries(
    Query$GetCountries$countries instance,
    TRes Function(Query$GetCountries$countries) then,
  ) = _CopyWithImpl$Query$GetCountries$countries;

  factory CopyWith$Query$GetCountries$countries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCountries$countries;

  TRes call({
    String? code,
    String? name,
    String? phone,
    Query$GetCountries$countries$continent? continent,
    String? $__typename,
  });
  CopyWith$Query$GetCountries$countries$continent<TRes> get continent;
}

class _CopyWithImpl$Query$GetCountries$countries<TRes>
    implements CopyWith$Query$GetCountries$countries<TRes> {
  _CopyWithImpl$Query$GetCountries$countries(
    this._instance,
    this._then,
  );

  final Query$GetCountries$countries _instance;

  final TRes Function(Query$GetCountries$countries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? continent = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCountries$countries(
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phone: phone == _undefined || phone == null
            ? _instance.phone
            : (phone as String),
        continent: continent == _undefined || continent == null
            ? _instance.continent
            : (continent as Query$GetCountries$countries$continent),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetCountries$countries$continent<TRes> get continent {
    final local$continent = _instance.continent;
    return CopyWith$Query$GetCountries$countries$continent(
        local$continent, (e) => call(continent: e));
  }
}

class _CopyWithStubImpl$Query$GetCountries$countries<TRes>
    implements CopyWith$Query$GetCountries$countries<TRes> {
  _CopyWithStubImpl$Query$GetCountries$countries(this._res);

  TRes _res;

  call({
    String? code,
    String? name,
    String? phone,
    Query$GetCountries$countries$continent? continent,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetCountries$countries$continent<TRes> get continent =>
      CopyWith$Query$GetCountries$countries$continent.stub(_res);
}

class Query$GetCountries$countries$continent {
  Query$GetCountries$countries$continent({
    required this.name,
    required this.code,
    this.$__typename = 'Continent',
  });

  factory Query$GetCountries$countries$continent.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$code = json['code'];
    final l$$__typename = json['__typename'];
    return Query$GetCountries$countries$continent(
      name: (l$name as String),
      code: (l$code as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String code;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$code = code;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$code,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCountries$countries$continent ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetCountries$countries$continent
    on Query$GetCountries$countries$continent {
  CopyWith$Query$GetCountries$countries$continent<
          Query$GetCountries$countries$continent>
      get copyWith => CopyWith$Query$GetCountries$countries$continent(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCountries$countries$continent<TRes> {
  factory CopyWith$Query$GetCountries$countries$continent(
    Query$GetCountries$countries$continent instance,
    TRes Function(Query$GetCountries$countries$continent) then,
  ) = _CopyWithImpl$Query$GetCountries$countries$continent;

  factory CopyWith$Query$GetCountries$countries$continent.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCountries$countries$continent;

  TRes call({
    String? name,
    String? code,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCountries$countries$continent<TRes>
    implements CopyWith$Query$GetCountries$countries$continent<TRes> {
  _CopyWithImpl$Query$GetCountries$countries$continent(
    this._instance,
    this._then,
  );

  final Query$GetCountries$countries$continent _instance;

  final TRes Function(Query$GetCountries$countries$continent) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? code = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCountries$countries$continent(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        code: code == _undefined || code == null
            ? _instance.code
            : (code as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetCountries$countries$continent<TRes>
    implements CopyWith$Query$GetCountries$countries$continent<TRes> {
  _CopyWithStubImpl$Query$GetCountries$countries$continent(this._res);

  TRes _res;

  call({
    String? name,
    String? code,
    String? $__typename,
  }) =>
      _res;
}
