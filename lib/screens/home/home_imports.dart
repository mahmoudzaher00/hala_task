import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hala_task/app/app_colors.dart';
import 'package:hala_task/data/home_provider.dart';
import 'package:hala_task/model/home_data_model.dart';
import 'package:hala_task/model/home_model.dart';
import 'package:hala_task/screens/home/widgets/home_widgets_imports.dart';
import 'package:hala_task/shared/networking/local/shard_pref.dart';
import 'package:hala_task/widgets/custom_text.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import '../../data/home_provider.dart';

part 'home_screen.dart';
part 'home_data.dart';