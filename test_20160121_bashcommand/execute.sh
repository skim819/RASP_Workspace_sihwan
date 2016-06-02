if [ -e /home/cadsp/rasp30/remote_server/fpaa_busy ]
then
    rm fpaa_busy
    /opt/python3.4/bin/python3.4 /home/cadsp/rasp30/remote_server/get_email.py
    touch fpaa_busy
fi
