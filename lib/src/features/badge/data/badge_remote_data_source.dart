import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/services/transaction_repository.dart';
import 'package:wom_pocket/src/features/badge/data/badge.dart';

import 'package:dio/dio.dart';
import 'package:wom_pocket/src/features/badge/data/challenge.dart';

part 'badge_remote_data_source.g.dart';

@riverpod
BadgeRemoteDataSource getBadgeRemoteDataSource(Ref ref) {
  return BadgeRemoteDataSource(ref.read(getDioProvider));
}

class BadgeRemoteDataSource {
  final Dio _dio;

  // It's good practice to inject Dio for better testability and configuration.
  BadgeRemoteDataSource(this._dio);

  Future<List<BadgeData>> getBadges() async {
    try {
      // Replace 'YOUR_API_ENDPOINT/badges' with your actual API endpoint
      final response = await _dio.get('https://$domain/api/v1/badge');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data
            .map((json) => BadgeData.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        // Handle non-200 status codes appropriately
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to load badges: ${response.statusCode}',
        );
      }
    } on DioException catch (e, st) {
      // Handle Dio-specific errors (e.g., network issues, timeouts)
      // You might want to log the error or rethrow a custom domain-specific error
      logger.e('Error fetching badges: $e', error: e, stackTrace: st);
      rethrow;
    } catch (e,st) {
      // Handle any other unexpected errors
      logger.e('Unexpected error: $e', error: e, stackTrace: st);
      throw Exception('Failed to load badges due to an unexpected error.');
    }
  }

  /// Recupera un singolo badge dal suo ID.
  ///
  /// Lancia una [DioException] se la richiesta fallisce o restituisce un codice di stato non-200.
  /// Lancia una [Exception] per altri errori imprevisti.
  Future<BadgeData> getBadgeById(String badgeId) async {
    try {
      final response = await _dio.get('https://$domain/api/v1/badge/$badgeId');

      if (response.statusCode == 200) {
        return BadgeData.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error:
              'Failed to load badge with ID $badgeId: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print('Error fetching badge with ID $badgeId: $e');
      rethrow;
    } catch (e) {
      print('Unexpected error fetching badge with ID $badgeId: $e');
      throw Exception(
          'Failed to load badge with ID $badgeId due to an unexpected error.');
    }
  }

  Future<ChallengeData> getChallengeById(String challengeId) async{
    try {
      final response = await _dio.get('https://$domain/api/v1/badge/challenge/$challengeId');

      if (response.statusCode == 200) {
        return ChallengeData.fromJson(response.data as Map<String, dynamic>);
      } else {
        // Gestisci appropriatamente i codici di stato non-200
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error:
          'Failed to load challenge with ID $challengeId: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      logger.e('Error fetching badge with ID $challengeId: $e');
      rethrow;
    } catch (e) {
      logger.e('Unexpected error fetching badge with ID $challengeId: $e');
      throw Exception(
          'Failed to load badge with ID $challengeId due to an unexpected error.');
    }
  }
}
