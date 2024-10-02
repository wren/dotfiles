for my_file in "${XDG_CONFIG_HOME}/env/"*".env.sh"; do
  source $my_file
done
