#!/bin/bash
set -e

NOTIFY_MAIL="YOUR_EMAIL"

if test -f /var/run/reboot-required; then
        /root/send_cloudron_mail.sh $NOTIFY_MAIL "$HOSTNAME server is about to be rebooted" '/var/run/reboot-required located, server is going to be rebooted now.'
        sudo shutdown -r now
fi
