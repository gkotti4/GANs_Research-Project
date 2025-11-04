#!/bin/bash

NUM_RUNS=${1:-10}

MEM_LIMIT=4097152
SCRIPT="mnist_gan.py"


echo "OPTIONAL PARAMETERS - NUM_RUNS \n"

echo "Running GAN with:"
echo " - Memory limit: $MEM_LIMIT KB"

for ((i = 1; i <= NUM_RUNS; i++))
do
    echo "Run #$i of $NUM_RUNS"
    
    (ulimit -v $MEM_LIMIT && python3 $SCRIPT)
    
    echo "Run #$i complete"
    
    # Small delay to prevent memory build up
    sleep 1
done
