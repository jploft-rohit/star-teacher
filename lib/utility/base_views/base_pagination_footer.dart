import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class BasePaginationFooter extends StatelessWidget {
  const BasePaginationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context,LoadStatus? mode){
        Widget body ;
        if(mode==LoadStatus.idle){
          body =  Text(translate(context).pull_up_load,style: const TextStyle(color: Colors.grey, fontSize: 12));
        }
        else if(mode==LoadStatus.loading){
          body =  const CupertinoActivityIndicator();
        }
        else if(mode == LoadStatus.failed){
          body = Text(translate(context).load_failed,style: const TextStyle(color: Colors.grey, fontSize: 12));
        }
        else if(mode == LoadStatus.canLoading){
          body = Text(translate(context).release_to_load_more,style: const TextStyle(color: Colors.grey, fontSize: 12));
        }
        else{
          body = Text(translate(context).no_more_data,style: const TextStyle(color: Colors.grey, fontSize: 12));
        }
        return SizedBox(
          height: 55.0,
          child: Center(child:body),
        );
      },
    );
  }
}

