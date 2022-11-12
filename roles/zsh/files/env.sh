for my_file in "${XDG_CONFIG_HOME}/env/"*}; do
  source "${XDG_CONFIG_HOME}/env/${my_file}"
done
