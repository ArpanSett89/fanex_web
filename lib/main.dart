import 'package:fanex_web/features/chakra/bloc/chakra_body_list_bloc/body_list_bloc.dart';
import 'package:fanex_web/utils/indexing_bloc/index_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/chakra/bloc/chakra_end_list_bloc/end_list_bloc.dart';
import 'features/chakra/ui/chakra_ui.dart';
import 'features/contact/ui/contact_ui.dart';
import 'features/faq/ui/faq_ui.dart';
import 'features/home_view/ui/home_view.dart';
import 'features/how_to_play/ui/how_to_play_ui.dart';
import 'features/rules_&_regulation/ui/rules_&_regulation_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Widget> pageList = [
    const HomeView(),
    const HowToPlayView(),
    const RulesRegulationView(),
    const ChakraView(),
    const FAQView(),
    const ContactView(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
            providers: [
              BlocProvider<IndexBloc>(
                  create: (context) => IndexBloc()..add(GetIndex(0))),
              BlocProvider<EndListBloc>(
                  create: (context) => EndListBloc()..add(GetEndDateList())),
              BlocProvider<BodyListBloc>(
                  create: (context) => BodyListBloc()),
            ],
            child:
                BlocBuilder<IndexBloc, IndexState>(builder: (context, state) {
              if (state is IndexLoaded) {
                return pageList[state.index];
              }
              return Container();
            })));
  }
}
