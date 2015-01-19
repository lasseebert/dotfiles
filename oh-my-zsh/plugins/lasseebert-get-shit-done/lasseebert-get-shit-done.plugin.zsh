# Install into /etc/sudoers:
# user host = (root) nopasswd: /path/to/get-shit-done.sh play
# user host = (root) nopasswd: /path/to/get-shit-done.sh work
#
# get-shit-done can be cloned from https://github.com/leftnode/get-shit-done

GET_SHIT_DONE_BIN=/home/pulver/bin/get-shit-done/get-shit-done.sh
GET_SHIT_DONE_PID=/home/pulver/bin/get-shit-done/get-shit-done.pid

work() {
  get_shit_done_kill
  sudo $GET_SHIT_DONE_BIN work
  (sleep 3600 && sudo $GET_SHIT_DONE_BIN play) &
  echo $! > $GET_SHIT_DONE_PID
  echo "Now work!"
}

play() {
  get_shit_done_kill
  sudo $GET_SHIT_DONE_BIN play
  (sleep 300 && sudo $GET_SHIT_DONE_BIN work) &
  echo $! > $GET_SHIT_DONE_PID
  echo "Now play for 5 minutes!"
}

get_shit_done_kill() {
  if [ -f $GET_SHIT_DONE_PID ]; then
    ppid=`cat $GET_SHIT_DONE_PID`
    kill -9 $ppid $(ps --ppid $ppid -o pid --no-heading)
    rm $GET_SHIT_DONE_PID
  fi
}
