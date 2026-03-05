import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'session_model.dart';

part 'token_storage.g.dart';

/// Keys used in secure storage.
abstract final class _StorageKeys {
  static const String session = 'planbition_session';
}

/// Provides secure, encrypted storage for the user session.
///
/// Uses [FlutterSecureStorage] to persist tokens safely on the device keychain
/// (iOS) / keystore (Android).
class TokenStorage {
  const TokenStorage(this._storage);

  final FlutterSecureStorage _storage;

  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  /// Persists the [session] to secure storage.
  Future<void> saveSession(SessionModel session) async {
    final json = jsonEncode(session.toJson());
    await _storage.write(
      key: _StorageKeys.session,
      value: json,
      aOptions: _androidOptions,
    );
  }

  /// Retrieves the persisted session, or null if none exists.
  Future<SessionModel?> getSession() async {
    final json = await _storage.read(
      key: _StorageKeys.session,
      aOptions: _androidOptions,
    );
    if (json == null) return null;
    try {
      return SessionModel.fromJson(
        jsonDecode(json) as Map<String, dynamic>,
      );
    } catch (_) {
      // Corrupted storage — clear and return null.
      await clearSession();
      return null;
    }
  }

  /// Removes the persisted session from secure storage.
  Future<void> clearSession() async {
    await _storage.delete(
      key: _StorageKeys.session,
      aOptions: _androidOptions,
    );
  }
}

@riverpod
FlutterSecureStorage flutterSecureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@riverpod
TokenStorage tokenStorage(Ref ref) {
  return TokenStorage(ref.watch(flutterSecureStorageProvider));
}
