import 'package:flutter/material.dart';
import 'package:hotel_database/app.dart';
import 'package:hotel_database/screens/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://timmytcshtlnlxqvgdwm.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpbW15dGNzaHRsbmx4cXZnZHdtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4NjIzNDEsImV4cCI6MjAwODQzODM0MX0.Wh7bEowJ8SzQgr6YPudfZdNAnguZ-mWsODiWdasoo0w",
  );

  runApp(App());
}
