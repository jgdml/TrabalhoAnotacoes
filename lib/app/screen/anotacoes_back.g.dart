// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anotacoes_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnotacoesBack on _AnotacoesBack, Store {
  final _$anotacoesAtom = Atom(name: '_AnotacoesBack.anotacoes');

  @override
  Future<List<Anotacao>>? get anotacoes {
    _$anotacoesAtom.reportRead();
    return super.anotacoes;
  }

  @override
  set anotacoes(Future<List<Anotacao>>? value) {
    _$anotacoesAtom.reportWrite(value, super.anotacoes, () {
      super.anotacoes = value;
    });
  }

  @override
  String toString() {
    return '''
anotacoes: ${anotacoes}
    ''';
  }
}
