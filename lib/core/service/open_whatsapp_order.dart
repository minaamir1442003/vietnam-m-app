import 'package:url_launcher/url_launcher.dart';

/// Opens a WhatsApp order chat for [phone] pre-filled with [message].
///
/// Returns `true` when the chat was opened successfully. Returns `false`
/// instead of throwing when WhatsApp (or a browser fallback) is unavailable,
/// so callers can show a message rather than leaving the button unresponsive.
Future<bool> openWhatsAppOrder({
  required String phone,
  required String message,
}) async {
  final uri = Uri.parse(
    'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
  );

  try {
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (launched) return true;

    // Fall back to opening the wa.me link in an in-app browser, which works
    // on devices where WhatsApp itself is not installed.
    return await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  } catch (_) {
    return false;
  }
}
