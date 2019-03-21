#!/bin/sh

PB_FILE=datasets/pascal_voc_seg/exp/train_on_trainval_set_mobilenetv2/export/frozen_inference_graph.pb
TF_FILE=deeplabv3_257_mv_gpu.tflite
DIMENSION=257

echo "# clear"

rm -rf *.tflite

echo "# convert"

tflite_convert \
    --output_file=$TF_FILE \
    --graph_def_file=$PB_FILE \
    --output_format=TFLITE \
    --input_arrays=sub_7 \
    --output_arrays=ResizeBilinear_2 \
    --input_shapes=1,${DIMENSION},${DIMENSION},3 \
    --inference_input_type=FLOAT \
    --inference_type=FLOAT \
    --mean_values=128 \
    --std_dev_values=127 \
    --default_ranges_min=-1 \
    --default_ranges_max=1 \

echo "# copy"

ls -alh /Users/ilous12/Work/Github/models/research/deeplab/datasets/pascal_voc_seg/exp/train_on_trainval_set_mobilenetv2/export/frozen_inference_graph.pb
cp deeplabv3_257_mv_gpu.tflite ~/Work/Gitlab/trtc/ide/framework/android/sample/app/src/main/res/raw/
cp deeplabv3_257_mv_gpu.tflite /Users/ilous12/Work/Github/tensorflow_ilous12/trtc/app/src/main/assets/
cp deeplabv3_257_mv_gpu.tflite /Users/ilous12/Work/Github/models/research/deeplab/test.tflite
#cp deeplabv3_257_mv_gpu.tflite /Users/ilous12/Work/Gitlab/armnn/build/test.tflite
md5 deeplabv3_257_mv_gpu.tflite ~/Work/Gitlab/trtc/ide/framework/android/sample/app/src/main/res/raw/deeplabv3_257_mv_gpu.tflite deeplabv3_257_mv_gpu.tflite /Users/ilous12/Work/Github/tensorflow_ilous12/trtc/app/src/main/assets/deeplabv3_257_mv_gpu.tflite deeplabv3_257_mv_gpu.tflite /Users/ilous12/Work/Gitlab/armnn/build/test.tflite
ls -alh deeplabv3_257_mv_gpu.tflite ~/Work/Gitlab/trtc/ide/framework/android/sample/app/src/main/res/raw/deeplabv3_257_mv_gpu.tflite deeplabv3_257_mv_gpu.tflite /Users/ilous12/Work/Github/tensorflow_ilous12/trtc/app/src/main/assets/deeplabv3_257_mv_gpu.tflite deeplabv3_257_mv_gpu.tflite /Users/ilous12/Work/Gitlab/armnn/build/test.tflite
