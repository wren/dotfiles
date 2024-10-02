for my_file in "${XDG_CONFIG_HOME}/aliases/"*".aliases.sh"; do
	source $my_file
done
