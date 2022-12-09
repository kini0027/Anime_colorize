set -ex
# models
RESULTS_DIR='./results28/edges2shoes24'
G_PATH='../checkpoints/edges2shoes/latest_net_G.pth'
E_PATH='../checkpoints/edges2shoes/latest_net_E.pth'

# dataset
CLASS='edges2shoes'
NZ=24
DIRECTION='AtoB' # from domain A to domain B
LOAD_SIZE=256 # scale images to this size
CROP_SIZE=256 # then crop to this size
INPUT_NC=1  # number of channels in the input image

# misc
GPU_ID=0   # gpu id
NUM_TEST=1 # number of input images duirng test
NUM_SAMPLES=30 # number of samples per input images

# command
CUDA_VISIBLE_DEVICES=${GPU_ID} python ./test.py \
  --dataroot ./datasets/${CLASS} \
  --results_dir ${RESULTS_DIR} \
  --checkpoints_dir ../checkpoints/edges2shoes24/ \
  --name ${CLASS} \
  --direction ${DIRECTION} \
  --load_size ${LOAD_SIZE} \
  --crop_size ${CROP_SIZE} \
  --nz ${NZ} \
  --input_nc ${INPUT_NC} \
  --num_test ${NUM_TEST} \
  --n_samples ${NUM_SAMPLES} \
  --center_crop \
  --no_flip