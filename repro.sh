NODE_FIFO=$(mktemp -u)
mkfifo "$NODE_FIFO"

BUN_FIFO=$(mktemp -u)
mkfifo "$BUN_FIFO"


node index.js 42337 > "$NODE_FIFO" &
NODE_PID=$!

bun index.js 42338 > "$BUN_FIFO" &
BUN_PID=$!


read line < "$NODE_FIFO"
echo "node daemon: $line"
rm "$NODE_FIFO"

read line < "$BUN_FIFO"
echo "bun daemon: $line"
rm "$BUN_FIFO"

echo "================== node output (good) =================="
python3 trigger_bug.py 42337
echo "================== bun output (bad) =================="
python3 trigger_bug.py 42338

kill $NODE_PID
kill $BUN_PID
