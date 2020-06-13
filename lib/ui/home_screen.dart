import 'package:flutter/material.dart';
import 'package:flutter_providers/models/photo_model.dart';
import 'package:flutter_providers/provider_class/app_state.dart';

import 'package:provider/provider.dart';

class HomeScreenProviders extends StatefulWidget {
  @override
  _HomeScreenProvidersState createState() => _HomeScreenProvidersState();
}

class _HomeScreenProvidersState extends State<HomeScreenProviders> {
  AppStateClass appState;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    // appState=Provider.of<AppStateClass>(context);
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppStateClass>(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text(appState.getTextData())),
              Container(
                margin: EdgeInsets.all(20.0),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    labelText: "EnterText",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (changed) => appState.setTextData(changed),
                  onSubmitted: (submitted) => appState.setTextData(submitted),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: RaisedButton(
                  onPressed: () {
                    appState.fetchData();
                  },
                  child: Text("Click me"),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(16.0),
                  child: appState.isFetching
                      ? CircularProgressIndicator()
                      : appState.getPhotoData() != null
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: appState.getPhotoData().length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(appState
                                            .getPhotoData()[index]
                                            .thumbnailUrl),
                                      ),
                                      title: Text(
                                        appState.getPhotoData()[index].title,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : Container())
            ],
          ),
        ),
      ),
    );
  }
}
