for my_file in "${XDG_CONFIG_HOME}/env/"*; do
  source $my_file
done
