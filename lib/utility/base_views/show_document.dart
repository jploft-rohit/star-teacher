import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_utility.dart';


class ShowPdfViewDialog extends StatefulWidget {
 final String url;
 final String title;
 ShowPdfViewDialog({Key? key,required this.url,required this.title}) : super(key: key);

  @override
  State<ShowPdfViewDialog> createState() => _ShowPdfViewDialogState();
}

class _ShowPdfViewDialogState extends State<ShowPdfViewDialog> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    loadDocument();
  }

XFile? pFile;

  loadDocument() async {
    print(widget.url);
    pFile = await getImageXFileByUrl(widget.url);
    print(pFile!.path);
    setState(() => _isLoading = false);
  }

  Future<XFile> getImageXFileByUrl(String url) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    XFile result = await XFile(file.path);
    return result;
  }

 @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height*0.80,
          child: Dialog(
            insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
                padding: EdgeInsets.all(20.sp),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, color: Colors.black,),),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: addAlignedText(widget.title, 17, ColorConstants.black, FontWeight.w600)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      child: Center(
                        child: _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : PdfViewer.openFile(pFile!.path)
                        ),
                      ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }}

