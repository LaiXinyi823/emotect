#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ============================================================================
mkdir -p ms_log
CUR_DIR=`pwd`
DATA_PATH=${CUR_DIR}/data
SAVE_PATH=${CUR_DIR}/save_models
export GLOG_log_dir=${CUR_DIR}/ms_log
export GLOG_logtostderr=0
python ${CUR_DIR}/run_ernie_classifier.py  \
    --device_target="Ascend" \
    --do_train="false" \
    --do_eval="true" \
    --device_id=0 \
    --num_class=3 \
    --train_data_shuffle="true" \
    --eval_data_shuffle="false" \
    --eval_batch_size=32 \
    --load_finetune_checkpoint_path="${SAVE_PATH}/classifier-3_301.ckpt" \
    --eval_data_file_path="${DATA_PATH}/test.mindrecord" \
    --schema_file_path="" > ${GLOG_log_dir}/eval_classifier_log.txt 2>&1 &
