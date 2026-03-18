/// Central registry of every asset icon path used in the app.
///
/// Always reference icons through this class — never hard-code asset strings
/// directly in widgets.
abstract final class AppIcons {
  // splash screen
  /// 3-D delivery character shown on the splash screen.
  /// The SVG variant embeds a base64-encoded raster image that flutter_svg
  /// cannot paint; always use this PNG path instead.
  static const String deliveryCharacterSplash =
      'assets/icons/delivery-character-with-scooter-with-face-mask-3d-illustration 1.png';
  // ── Bottom navigation ───────────────────────────────────────────────────
  static const String homeSmile = 'assets/icons/Home Smile.svg';
  static const String usersGroupTwoRounded =
      'assets/icons/Users Group Two Rounded.svg';
  static const String bagSmile = 'assets/icons/Bag Smile.svg';
  static const String bagSmileActive = 'assets/icons/Bag Smile Active.svg';
  static const String compass = 'assets/icons/Compass.svg';
  static const String userCircle = 'assets/icons/User Circle.svg';

  // ── Home top bar ────────────────────────────────────────────────────────
  static const String mapPointBroken = 'assets/icons/Map_Point_broken_icon.svg';
  static const String ixSupport = 'assets/icons/ix_support.svg';
  static const String bell = 'assets/icons/Bell.svg';

  // ── Earning card ────────────────────────────────────────────────────────
  static const String userCheckRounded =
      'assets/icons/User_Check_Rounded_icon.svg';

  /// 3-D delivery character PNG used in the earning card right side.
  /// The SVG variant embeds a raster image incompatible with flutter_svg,
  /// so we always use this PNG instead.
  static const String deliveryCharacter =
      'assets/icons/delivery_character_with_scooter_with_face_mask_3d_illustration.svg';

  /// Semi-transparent "G" watermark overlaid inside the earning card.
  static const String welcomeWatermarkG =
      'assets/icons/welcome_watermark_G.png';

  /// Semi-transparent red ellipse used as a background accent inside the
  /// earning card (bottom-right corner).
  static const String ellipse25 = 'assets/icons/Ellipse 25.svg';

  /// Solid red circle decoration (used as a card accent element).
  static const String redCircle = 'assets/icons/red circle.svg';

  // ── Delivery history ────────────────────────────────────────────────────
  /// Circular arrow used as the "see all" button on the history header.
  static const String roundAltArrowDown =
      'assets/icons/Round Alt Arrow Down.svg';

  /// Cash icon shown in the empty-state of the delivery history section.
  static const String cashOut = 'assets/icons/Cash Out.svg';

  /// Thumbnail icon shown on the left of each delivery history row.
  static const String deliveryPreviewHistory =
      'assets/icons/delivery_preview_history.svg';

  /// Green success badge overlaid on a history tile.
  static const String successTickCircular =
      'assets/icons/sucess tick circular.svg';

  /// Red failed badge overlaid on a history tile.
  static const String deliveryHistoryFailed =
      'assets/icons/delivery_history_failed.svg';

  // ── Open map button ─────────────────────────────────────────────────────
  static const String map = 'assets/icons/Map.svg';

  static const String deliveryHistoryEmpty =
      'assets/icons/delivery_empty_state.png';

  // ── Profile ──────────────────────────────────────────────────────────────

  /// Semi-transparent "M" brand watermark for the profile header background.
  static const String mWatermark = 'assets/icons/m_watermark.png';

  /// Semi-transparent "G" brand watermark for the profile header background.
  static const String gWatermark = 'assets/icons/g_watermark.png';

  /// Yellow checkmark badge overlaid on the profile avatar (external rider).
  static const String externalRiderCheckmark =
      'assets/icons/external_rider_checkmark.png';

  /// Default profile placeholder image.
  static const String profilePlaceholder =
      'assets/icons/profile_placeholder.png';

  /// User Check icon — Account settings menu item.
  static const String userCheck = 'assets/icons/User Check.svg';

  /// Bicycling icon — Delivery History menu item.
  static const String bicycling = 'assets/icons/Bicycling.svg';

  /// Chart Square icon — Earnings menu item.
  static const String chartSquare = 'assets/icons/Chart Square.svg';

  /// Wallet icon — Bank Account info menu item.
  static const String wallet = 'assets/icons/Wallet.svg';

  /// Settings icon — App settings menu item.
  static const String settings = 'assets/icons/Settings.svg';

  /// Trash Bin Trash icon — Log out menu item.
  static const String trashBinTrash = 'assets/icons/Trash Bin Trash.svg';

  /// Arrow icon — right-hand chevron for profile menu rows.
  static const String arrow = 'assets/icons/Arrow.svg';

  // ── Account settings ────────────────────────────────────────────────────

  /// Letter / envelope icon — used in Change Email fields and menu row.
  static const String letter = 'assets/icons/Letter.svg';

  /// Phone Rounded icon — used in Change Phone fields and menu row.
  static const String phoneRounded = 'assets/icons/Phone Rounded.svg';

  /// Camera Minimalistic icon — "Take photo" option in Change Picture screen.
  static const String cameraMinimalistic =
      'assets/icons/Camera Minimalistic.svg';

  /// Gallery Minimalistic icon — "From photos" option in Change Picture screen.
  static const String galleryMinimalistic =
      'assets/icons/Gallery Minimalistic.svg';

  /// File Send icon — "From files" option in Change Picture screen.
  static const String fileSend = 'assets/icons/File Send.svg';

  /// Example photo shown in the Change Picture preview circle.
  static const String changePictureExample =
      'assets/icons/change_picture_example.png';
}
