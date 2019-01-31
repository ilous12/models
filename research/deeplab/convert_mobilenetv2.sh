#!/bin/sh

PB_FILE=frozen_inference_graph.pb
DIMENSION=257

echo "TO_GPU"

tflite_convert \
 --output_file=deeplab_${DIMENSION}_gpu.tflite \
 --graph_def_file=$PB_FILE \
 --output_format=TFLITE \
 --input_arrays=sub_7 \
 --output_arrays=ResizeBilinear_2 \
 --input_shapes=1,${DIMENSION},${DIMENSION},3 \
 --inference_input_type=FLOAT \
 --inference_type=FLOAT \
    #   --mean_values=128 \
    #   --std_dev_values=127 \
    #   --target_ops=TFLITE_BUILTINS,SELECT_TF_OPS \

echo "TO_CPU"

tflite_convert \
 --output_file=deeplab_${DIMENSION}_cpu.tflite \
 --graph_def_file=$PB_FILE \
 --output_format=TFLITE \
 --input_array=sub_7 \
 --output_array=ResizeBilinear_2 \
 --input_shape=1,${DIMENSION},${DIMENSION},3 \
 --inference_input_type=FLOAT \
 --inference_type=QUANTIZED_UINT8 \

echo "TO_CPU QUANTINZED"    		      

tflite_convert \
 --output_file=deeplab_${DIMENSION}_cpu_post.tflite \
 --graph_def_file=$PB_FILE \
 --output_format=TFLITE \
 --input_array=sub_7 \
 --output_array=ResizeBilinear_2\
 --input_shape=1,${DIMENSION},${DIMENSION},3 \
 --inference_input_type=QUANTIZED_UINT8 \
 --inference_type=QUANTIZED_UINT8 \
 --mean_values=128 \
 --std_dev_values=128 \
 --default_ranges_min=0 \
 --default_ranges_max=255 \
 --post_training_quantize

