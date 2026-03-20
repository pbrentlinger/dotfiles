pos=$(dms ipc call bar getPosition name "Bar 2")
if [[ $pos == "top" ]]; then
    dms ipc call bar setPosition name "Bar 2" "right"
else
    dms ipc call bar setPosition name "Bar 2" "top"
fi
