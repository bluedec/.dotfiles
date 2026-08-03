#!/usr/bin/env bash

PIDFILE="/tmp/wf-recorder.pid"

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  kill "$(cat "$PIDFILE")"
  rm "$PIDFILE"
  notify-send "Grabación" "Grabación detenida"
else
  mkdir -p "$HOME/Videos"

  wf-recorder \
    -g "$(slurp)" \
    -f "$HOME/Videos/recording-$(date +%Y-%m-%d_%H-%M-%S).mp4" &

  echo $! > "$PIDFILE"

  notify-send "Grabación" "Grabación iniciada"
fi
