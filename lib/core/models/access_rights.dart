import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_rights.freezed.dart';
part 'access_rights.g.dart';

/// Feature flags returned by GET /Auth/access-rights.
///
/// These determine which features are visible and enabled in the app.
/// All flags default to false (most restrictive) when absent.
@freezed
abstract class AccessRights with _$AccessRights {
  const factory AccessRights({
    /// Whether the user can request absence / leave.
    @Default(false) bool featureRequestAbsenceEnabled,

    /// Whether the user can confirm a shift.
    @Default(false) bool featureConfirmationEnabled,

    /// Whether the user can decline a shift.
    @Default(false) bool featureConfirmationDeclineEnabled,

    /// Whether a remark is required when declining a shift.
    @Default(false) bool featureConfirmationDeclineRemarkRequired,

    /// Whether the user can manage their availability.
    @Default(false) bool featureRequestAvailabilityEnabled,

    /// Whether predefined availability blocks are used.
    @Default(false) bool featureRequestAvailablityBlockEnabled,

    /// Whether the marketplace / self-scheduling is enabled.
    @Default(false) bool featureMarketplaceEnabled,

    /// Whether the timesheet module is enabled.
    @Default(false) bool featureTimesheetsEnabled,

    /// Whether punch via QR code is enabled.
    @Default(false) bool featureQrCodeEnabled,

    /// Whether punch via geofencing is enabled.
    @Default(false) bool featureGeofencingEnabled,
  }) = _AccessRights;

  factory AccessRights.fromJson(Map<String, dynamic> json) =>
      _$AccessRightsFromJson(json);
}

extension AccessRightsX on AccessRights {
  /// Returns true if any confirmation-related feature is active.
  bool get hasConfirmationFeature =>
      featureConfirmationEnabled || featureConfirmationDeclineEnabled;

  /// Returns true if any availability feature is active.
  bool get hasAvailabilityFeature =>
      featureRequestAvailabilityEnabled ||
      featureRequestAvailablityBlockEnabled;
}
