import 'package:flutter/material.dart';

enum ApiStatusEnum { success, failed }
enum MessageEnum { SUCCESS, ERROR, WARNING }
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();