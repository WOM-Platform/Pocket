// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $ImportNotifierHash() => r'be2d3fbe8306ea43364c905865bd8253a96d5762';

/// See also [ImportNotifier].
final importNotifierProvider =
    AutoDisposeNotifierProvider<ImportNotifier, ImportState>(
  ImportNotifier.new,
  name: r'importNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $ImportNotifierHash,
);
typedef ImportNotifierRef = AutoDisposeNotifierProviderRef<ImportState>;

abstract class _$ImportNotifier extends AutoDisposeNotifier<ImportState> {
  @override
  ImportState build();
}
