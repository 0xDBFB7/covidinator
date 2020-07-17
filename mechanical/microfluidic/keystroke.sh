
# #thanks https://www.linuxjournal.com/content/using-named-pipes-fifos-bash!
# pipe=/tmp/kbrun
#
# trap "rm -f $pipe" EXIT
#
# if [[ ! -p $pipe ]]; then
#     mkfifo $pipe
# fi
#
# bind -x "\"\C-d\": echo \"\n\" > $pipe"
#
# while true
# do
#     if read line <$pipe; then
#         if [[ "$line" == 'quit' ]]; then
#              break
#         fi
#         echo "Running"
#         python generate_slide.py
#     fi
# done

pipe=/tmp/kbrun
if [[ ! -p $pipe ]]; then
    mkfifo $pipe
fi
xinput test-xi2 --root > /tmp/kbrun &

cat /tmp/kbrun | while read line;
do
    if [[ "$line" == *'detail: 108'* ]]; then
        # echo "$line";
        echo "Running"
        python generate_slide.py
    fi
done
# while true
# do
#     if read </tmp/kbrun; then
#         # if [[ "$line" == 'quit' ]]; then
#         #      break
#         # fi
#         echo "Running"
#         # python generate_slide.py
#     fi
# done
