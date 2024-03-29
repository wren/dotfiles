# Initialize plugin/package manager(s)

if command -v sheldon &>/dev/null; then
  SHELDON_CACHE_FILE="$SHELDON_CACHE/cached_init.sh"
  SHELDON_LOCK_FILE="$XDG_DATA_HOME/sheldon/plugins.lock"

  # check if lock file is newer than cache
  if [[ $SHELDON_LOCK_FILE -nt $SHELDON_CACHE_FILE || ! -f $SHELDON_CACHE_FILE ]]; then
    # (re)generate cache file
    rm -f $SHELDON_CACHE_FILE
    mkdir -vp "$(dirname $SHELDON_CACHE_FILE)"
    sheldon --quiet source > $SHELDON_CACHE_FILE
  fi

  source "$SHELDON_CACHE_FILE"
fi
