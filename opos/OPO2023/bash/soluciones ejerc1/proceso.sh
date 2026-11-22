STOPNAME="stop_`basename $0`.$$"
echo "kill $$; rm $STOPNAME" > $STOPNAME
chmod +x $STOPNAME
sleep 30

