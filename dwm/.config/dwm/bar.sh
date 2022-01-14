#!/bin/sh
#colors
cyan=$(tput setaf 6)
green=$(tput setaf 2)
blue=$(tput setaf 4)

mem(){
# get all the infos first to avoid high resources usage
	free_output=$(free -h | grep Mem)
	df_output=$(df -h $df_check_location | tail -n 1)
	# Used and total memory
	MEMUSED=$(echo $free_output | awk '{print $3}')
	MEMTOT=$(echo $free_output | awk '{print $2}')
	# CPU temperature
	CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%
	#CPU=$(sysctl -n hw.sensors.cpu0.temp0 | cut -d. -f1)
	# Used and total storage in /home (rounded to 1024B)
	STOUSED=$(echo $df_output | awk '{print $3}')
	STOTOT=$(echo $df_output | awk '{print $2}')
	STOPER=$(echo $df_output | awk '{print $5}')

	printf "%s" "$SEP1"
	printf "^c#246BCE^ %s/%s ^c#56A0D3^﬙ %s" "$MEMUSED" "$MEMTOT" "$CPU"
	printf "%s\n" "$SEP2"
}
battery(){
   CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    printf "%s" "$SEP1"
        if [ "$STATUS" = "Charging" ]; then
            printf "^c#B1A23D^ %s%%" "$CHARGE"
        elif [ "$STATUS" = "Full" ]; then
            printf "^c#8fce00^ %s%%" "$CHARGE"
        else
            printf "^c#FF0800^ %s%%" "$CHARGE"
        fi
    printf "%s\n" "$SEP2"

}
clock(){
  printf "%s" "$SEP1"
  printf "^c#30baed^ 📆 %s" "$(date "+%a %d-%m-%y %I:%M %p")"
  printf "%s\n" "$SEP2"
}
while true; do
  sleep 2 && xsetroot -name " $(battery) $(mem) $(clock) "
done
