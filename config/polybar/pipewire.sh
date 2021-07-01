 #!/bin/bash

function main() {
	DEFAULT_SINK_ID=$(pw-play --list-targets | sed -n 's/^*[[:space:]]*\([[:digit:]]\+\):.*$/\1/p')
    VOLUME=$(pactl list sinks | sed -n "/Sink #${DEFAULT_SINK_ID}/,/Volume/ s!^[[:space:]]\+Volume:.* \([[:digit:]]\+\)%.*!\1!p" | head -n1)
    IS_MUTED=$(pactl list sinks | sed -n "/Sink #${DEFAULT_SINK_ID}/,/Mute/ s/Mute: \(yes\)/\1/p")

    if [ "${IS_MUTED}" != "" ]; then
		VOLUME=0
	fi

    echo " ${VOLUME}%"
}

main "$@"
