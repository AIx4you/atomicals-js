#!/bin/bash

while true; do
  fee=$(python3 gas.py)

  if [ $fee -lt 80 ]; then
    if [ $fee -lt 37 ]; then
      echo "Original fee is $fee. Adding 3..."
      fee=$((fee + 3))
      echo "New fee is $fee. Let's go!"
    else
      echo "Fee is $fee. Let's go!"
    fi

    echo "Start! Current Time: $(date)"
    yarn cli mint-dft Sophon --satsbyte=$fee --rbf --disablechalk &>>nohup.txt
    echo "Done!  Current Time: $(date)"
  else
    echo "Fee is $fee, too high. Let's wait."
    sleep 60
  fi
done
