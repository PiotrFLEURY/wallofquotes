import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mockito/annotations.dart';
import 'package:wallofquotes/data_sources/firebase_db.dart';
import 'package:wallofquotes/services/analytics_service.dart';

@GenerateMocks([
  AnalyticsService,
  FirebaseDb,
  FirebaseAnalytics,
])
void main() {
  // dummy main used to generate mocks
}
