if [ $# -eq  0 ]
  then
    echo "No argument supplied for experiment name"
    exit 1
fi

# export BERT_VOCAB=$BERT_BASE_FOLDER/scivocab_cased.vocab
# export BERT_WEIGHTS=$BERT_BASE_FOLDER/scibert_scivocab_cased.tar.gz

export BERT_VOCAB=$BERT_BASE_FOLDER/scibert_scivocab_cased/vocab.txt
export BERT_WEIGHTS=$BERT_BASE_FOLDER/scibert_scivocab_cased/weights.tar.gz

export CONFIG_FILE=scirex/training_config/scirex_full.jsonnet

export CUDA_DEVICE=$CUDA_DEVICE

export IS_LOWERCASE=false

export DATA_BASE_PATH=model_data/release_data

export TRAIN_PATH=$DATA_BASE_PATH/train.jsonl
export DEV_PATH=$DATA_BASE_PATH/dev.jsonl
export TEST_PATH=$DATA_BASE_PATH/test.jsonl

export OUTPUT_BASE_PATH=${OUTPUT_DIR:-outputs/pwc_outputs/experiment_scirex_full/$1}

allennlp train -s $OUTPUT_BASE_PATH --include-package scirex $RECOVER $CONFIG_FILE