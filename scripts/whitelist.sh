#!/bin/bash
# Whitelist Updater for Pi-hole (http://pi-hole.net/)
# Based on the original script created by Anudeep (Slight change by cminion) - https://github.com/anudeepND/whitelist
# GSolone 2019 - https://gioxx.org
#================================================================================

TICK="[\e[32m ✔ \e[0m]"

if [ "$(id -u)" != "0" ] ; then
	echo "This script requires root permissions. Please run this as root!"
	exit 2
fi

case "$1" in
	safe)
		echo "Download and add safe sites to whitelist (official: anudeepND) ..."
		curl -sS https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt | sudo tee -a /etc/pihole/whitelist.txt >/dev/null
		echo -e " ${TICK} \e[32m Adding to whitelist... \e[0m"
		sleep 0.1
		echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
		mv /etc/pihole/whitelist.txt /etc/pihole/whitelist.txt.old && cat /etc/pihole/whitelist.txt.old | sort | uniq >> /etc/pihole/whitelist.txt

		echo "Download and add safe sites to whitelist (integration: gioxx) ..."
		curl -sS https://raw.githubusercontent.com/gioxx/ph-whitelist/master/domains/whitelist_integrations.txt | sudo tee -a /etc/pihole/whitelist.txt >/dev/null
		echo -e " ${TICK} \e[32m Adding to whitelist... \e[0m"
		sleep 0.1
		echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
		mv /etc/pihole/whitelist.txt /etc/pihole/whitelist.txt.old && cat /etc/pihole/whitelist.txt.old | sort | uniq >> /etc/pihole/whitelist.txt

		echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
		pihole -g > /dev/null
		echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
		echo -e " ${TICK} \e[32m Done! \e[0m"
		;;
	referral)
		echo "Download and add referral sites to whitelist ..."
		curl -sS https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/referral-sites.txt | sudo tee -a /etc/pihole/whitelist.txt >/dev/null
		echo -e " ${TICK} \e[32m Adding to whitelist... \e[0m"
		sleep 0.5
		echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
		mv /etc/pihole/whitelist.txt /etc/pihole/whitelist.txt.old && cat /etc/pihole/whitelist.txt.old | sort | uniq >> /etc/pihole/whitelist.txt
		wait
		echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
		pihole -g > /dev/null
		wait
		echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
		echo -e " ${TICK} \e[32m Done! \e[0m"
		;;
	stats)
		echo "Download and add statistics sites to whitelist ..."
		curl -sS https://raw.githubusercontent.com/gioxx/ph-whitelist/master/domains/stats.txt | sudo tee -a /etc/pihole/whitelist.txt >/dev/null
		echo -e " ${TICK} \e[32m Adding to whitelist... \e[0m"
		sleep 0.5
		echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
		mv /etc/pihole/whitelist.txt /etc/pihole/whitelist.txt.old && cat /etc/pihole/whitelist.txt.old | sort | uniq >> /etc/pihole/whitelist.txt
		wait
		echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
		pihole -g > /dev/null
		wait
		echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
		echo -e " ${TICK} \e[32m Done! \e[0m"
		;;
	facebook)
			echo "Download and add Facebook sites to whitelist ..."
			curl -sS https://raw.githubusercontent.com/gioxx/ph-whitelist/master/domains/whitelist_facebook.txt | sudo tee -a /etc/pihole/whitelist.txt >/dev/null
			echo -e " ${TICK} \e[32m Adding to whitelist... \e[0m"
			sleep 0.5
			echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
			mv /etc/pihole/whitelist.txt /etc/pihole/whitelist.txt.old && cat /etc/pihole/whitelist.txt.old | sort | uniq >> /etc/pihole/whitelist.txt
			wait
			echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
			pihole -g > /dev/null
			wait
			echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
			echo -e " ${TICK} \e[32m Done! \e[0m"
			;;
	clear)
			echo "Clean whitelist ..."
			: > /etc/pihole/whitelist.txt
			echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
			pihole -g > /dev/null
			wait
			echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
			echo -e " ${TICK} \e[32m Done! \e[0m"
			;;
	*)
		echo "Usage: whitelist safe|referral|stats|facebook|clear"
		exit 1
		;;
esac
