#!/bin/bash

send_signal() {
    awesome-signal-root "$1" "$2"
}

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                send_signal "acpi::power"
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;

    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                send_signal "acpi::sleep"
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;

    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unplugged'
                        send_signal "acpi::ac" "off"
                        ;;
                    00000001)
                        logger 'AC plugged'
                        send_signal "acpi::ac" "on"
                        ;;
                esac
                ;;
        esac
        ;;

    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        send_signal "acpi::battery" "online"
                        ;;
                    00000001)
                        logger 'Battery offline'
                        send_signal "acpi::battery" "offline"
                        ;;
                esac
                ;;
        esac
        ;;

    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                send_signal "acpi::lid" "close"
                ;;
            open)
                logger 'LID opened'
                send_signal "acpi::lid" "open"
                ;;
        esac
        ;;

    # -------- Volume Keys --------
    button/volumeup|button/volup)
        logger "Volume up pressed"
        send_signal "acpi::volume_up"
        ;;

    button/volumedown|button/voldown)
        logger "Volume down pressed"
        send_signal "acpi::volume_down"
        ;;

    button/mute)
        logger "Volume mute pressed"
        send_signal "acpi::volume_mute"
        ;;

    # -------- Brightness Keys --------
    video/brightnessup)
        logger "Brightness up pressed"
        send_signal "acpi::brightness_up"
        ;;

    video/brightnessdown)
        logger "Brightness down pressed"
        send_signal "acpi::brightness_down"
        ;;

    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac
