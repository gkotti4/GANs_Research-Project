#!/bin/bash

NUM_RUNS=${1:-1}

MEM_LIMIT=4097152
SCRIPT="run_generator.py"


for ((i = 1; i <= NUM_RUNS; i++))
do
    echo "▶️ Run #$i of $NUM_RUNS"
    
    (ulimit -v $MEM_LIMIT && python3 $SCRIPT)
    
    echo "✅ Run #$i complete"
    
    # Small delay to prevent memory build up
    sleep 0.5
done
