import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/image_editor.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_button.dart';

class ConfigurableCrop extends StatefulWidget {
  final Uint8List imageBytes;

  const ConfigurableCrop(this.imageBytes);

  @override
  _ConfigurableCropState createState() => _ConfigurableCropState();
}

class _ConfigurableCropState extends State<ConfigurableCrop> {
  // final _controller = CropController();
  final ImageEditorController _editorController = ImageEditorController();

  var _isProcessing = false;

  set isProcessing(bool value) {
    setState(() {
      _isProcessing = value;
    });
  }

  Uint8List? _croppedData;

  set croppedData(Uint8List? value) {
    setState(() {
      if (value == null) {
        canPop = true;
      }
      _croppedData = value;
    });
  }

  var _isPreviewing = false;

  set isPreviewing(bool value) {
    setState(() {
      _isPreviewing = value;
    });
  }

  Future<void> crop(ImageEditorController imageEditorController) async {
    debugPrint('native library start cropping');

    final EditActionDetails action = imageEditorController.editActionDetails!;

    final Uint8List img = imageEditorController.state!.rawImageData;

    final ImageEditorOption option = ImageEditorOption();

    if (action.needCrop) {
      Rect cropRect = imageEditorController.getCropRect()!;
      if (imageEditorController.state!.widget.extendedImageState.imageProvider
          is ExtendedResizeImage) {
        final ImmutableBuffer buffer = await ImmutableBuffer.fromUint8List(img);
        final ImageDescriptor descriptor = await ImageDescriptor.encoded(
          buffer,
        );

        final double widthRatio =
            descriptor.width / imageEditorController.state!.image!.width;
        final double heightRatio =
            descriptor.height / imageEditorController.state!.image!.height;
        cropRect = Rect.fromLTRB(
          cropRect.left * widthRatio,
          cropRect.top * heightRatio,
          cropRect.right * widthRatio,
          cropRect.bottom * heightRatio,
        );
      }
      option.addOption(ClipOption.fromRect(cropRect));
    }

    final DateTime start = DateTime.now();
    final Uint8List? result = await ImageEditor.editImage(
      image: img,
      imageEditorOption: option,
    );

    logger.i('${DateTime.now().difference(start)} ：total time');
    if (result != null) {
      canPop = false;
      croppedData = result;
    }
  }

  bool canPop = true;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          croppedData = null;
        }
      },
      canPop: canPop,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              if (_croppedData != null) {
                croppedData = null;
              } else {
                context.maybePop();
              }
            },
          ),
          backgroundColor: Colors.white,
          title: Text('Crop', style: TextStyle(color: Colors.black87)),
          actions: [
            if (_croppedData != null)
              IconButton(
                icon: Icon(Icons.restart_alt),
                onPressed: () {
                  croppedData = null;
                },
              )
            else
              MyButton(
                onPressed: () {
                  isProcessing = true;
                  crop(_editorController);
                },
                child: Text('Crop'),
              ),
          ],
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        body: Visibility(
          visible: _croppedData == null,
          child: Stack(
            children: [
              ExtendedImage.memory(
                widget.imageBytes,
                fit: BoxFit.contain,
                mode: ExtendedImageMode.editor,
                initEditorConfigHandler: (state) {
                  return EditorConfig(
                    maxScale: 8.0,
                    cropRectPadding: EdgeInsets.all(20.0),
                    hitTestSize: 20.0,
                    cropAspectRatio: 1.0,
                    controller: _editorController,
                  );
                },
              ),
            ],
          ),
          replacement: _croppedData != null
              ? Column(
                  children: [
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: MemoryImage(_croppedData!),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: MyButton(
                        onPressed: () {
                          canPop = true;
                          context.maybePop(_croppedData);
                        },
                        text: 'crop_screen.save'.tr(),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
