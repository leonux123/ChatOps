#!/bin/bash

# Script parameters

# private
create ()
{
  echo "Task initiated: Create new BestBet..."
  cat /home/ubuntu/git/simple_test_repo/BBList_Import.csv
  cd /home/ubuntu/git/simple_test_repo/ && git status && git add . && git commit -m "Added a new BestBet" && git push
}

# private
update ()
{
  echo "Task initiated: Update existing BestBet..."
}

# public
terminate ()
{
        echo "Shutting down..."
}

# public
instruct ()
{
        echo "Please provide an argument: (c) create, (u) update"
}

#-------------------------------------------------------

# "main"
case "$1" in
        create)
                create
                ;;
        update)
                update
                ;;
        help|*)
                instruct
                ;;
esac
