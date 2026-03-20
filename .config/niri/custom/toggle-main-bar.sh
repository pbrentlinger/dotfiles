pos=$(dms ipc call bar getPosition name "Main Bar")
if [[ $pos == "top" ]]; then
    dms ipc call bar setPosition name "Main Bar" "left"
else
    dms ipc call bar setPosition name "Main Bar" "top"
fi
