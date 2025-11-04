#!/bin/bash

NUM_RUNS=${1:-10}

NUM_EPOCHS=${2:-10}
TRAIN_SIZE=${3:-1000}
BATCH_SIZE=${4:-64}
LEARNING_RATE=${5:-0.002}

MEM_LIMIT=4097152
SCRIPT="mnist_gan.py"


echo "Running GAN with:"
echo "OPTIONAL PARAMETERS - NUM_RUNS, NUM_EPOCHS, TRAIN_SIZE, BATCH_SIZE, LEARNING_RATE"
echo " - Train size: $TRAIN_SIZE"
echo " - Epochs: $NUM_EPOCHS"
echo " - Batch size: $BATCH_SIZE"
echo " - Memory limit: $MEM_LIMIT KB"

for ((i = 1; i <= NUM_RUNS; i++))
do
    echo "▶️ Run #$i of $NUM_RUNS"
    
    (ulimit -v $MEM_LIMIT && python3 $SCRIPT \
	  --train_size $TRAIN_SIZE \
	  --num_epochs $NUM_EPOCHS \
	  --batch_size $BATCH_SIZE \
	  --learning_rate_d $LEARNING_RATE \
	  --learning_rate_g $LEARNING_RATE)
    
    echo "✅ Run #$i complete"
    
    # Small delay to prevent memory build up
    sleep 1
done
