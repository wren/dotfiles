# See built-in p10k themes for more options/examples
# https://github.com/romkatv/powerlevel10k/tree/master/config

# --- Configure --- #
() {
  emulate -L zsh -o extended_glob

  # Unset all config options (so we can reload theme without restarting zsh)
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  autoload -Uz is-at-least && is-at-least 5.1 || return

  # For list/info of all built-in elements:
  # https://github.com/romkatv/powerlevel10k#batteries-included
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # ===============[ Line #0 ]===============
    # This separates the prompt from the output
    # of the previous command.
    newline
    newline

    # ===============[ Line #1 ]===============
    context
    # you_have_mail
    direnv
    dir

    # ===============[ Line #2 ]===============
    newline
    vcs # git
    git_diff_shortstat

    # ===============[ Line #3 ]===============
    background_jobs
    prompt_char
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # ===============[ Line #0 ]===============
    # This separates the prompt from the output
    # of the previous command.
    status
    command_execution_time
    newline
    newline

    # ===============[ Line #1 ]===============
    time

    # ===============[ Line #2 ]===============
    # This section has a lot of possible elements
    # (although few every show at the same time),
    # and they all end up in the same spot.
    newline

    # version management
    asdf

    # env/context info
    virtualenv
    kubecontext
    vim_shell
    terraform
    vim_shell

    # cloud stuff
    aws
    aws_eb_env
    azure
    gcloud
    google_app_cred
  )

  # Basic style options
  typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=     # separate segments with a space
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol

  # Directory icon
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'
  POWERLEVEL9K_DIR_VISUAL_IDENTIFIER_EXPANSION=

  # Font
  # https://github.com/romkatv/powerlevel10k/#recommended-meslo-nerd-font-patched-for-powerlevel10k
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=none

  # Add an empty line before each prompt.
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

  # The horizontal line before each prompt (and the end of previous output)
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='─'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=244
  # Add a space between the line and the right prompt
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '
  # Start and end filler from the edge of the screen if there are no prompt elements on
  # the same line (either left or right)
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
  typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'


  ################################[ prompt_char: prompt symbol ]################################

  # Default color for all modes, and colors that match our nvim theme
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=244
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_FOREGROUND=10
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_FOREGROUND=5
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_FOREGROUND=57
  # Prompt symbol in various modes
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='' # insert
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='🅽' # normal
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='🆅' # visual
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='🆁' # replace

  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true

  ##################################[ dir: current directory ]##################################
  typeset -g POWERLEVEL9K_DIR_PREFIX=' '
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=3
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique # if dir name is too long
  # Color of the shortened directory segments.
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=222
  # Color/style of the dir anchors (i.e. are never shortened)
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=3
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=false

  # Directories that contain these files are always anchors
  local anchor_files=(
    .bzr
    .citc
    .git
    .hg
    .node-version
    .python-version
    .go-version
    .ruby-version
    .lua-version
    .java-version
    .perl-version
    .php-version
    .tool-version
    .tool-versions
    .shorten_folder_marker
    .svn
    .terraform
    CVS
    Cargo.toml
    composer.json
    go.mod
    package.json
    stack.yaml
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"

  # Make directories in prompt relative to their (deepest) anchor
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false

  # Anchor the last n dirs in path
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

  # Always shorten path if longer than n columns or n% of terminal width
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH='75%'

  # If set to true, embed a clickable hyperlink into the directory
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=true

  # Special styling for non-writable directories.
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true
  typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='' # or  ?

  #####################################[ vcs: git status ]######################################
  # Use the default icon with a special color
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '

  # Untracked files icon (it's really a question mark, your font isn't broken).
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=' '

  # Formatter for Git status.
  # Example output: main → origin/main |  34  7  4 | ﱮ 3 |  jonathan@nowandwren.com
  # See: https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
  function my_git_formatter() {
    emulate -L zsh

    if [[ -n $P9K_CONTENT ]]; then
      # If P9K_CONTENT is not empty, use it.
      # This means it's either still loading or from vcs_info (not from gitstatus
      # plugin). Either way, VCS_STATUS_* parameters are not available yet.
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    if (( $1 )); then
      # Styling for up-to-date Git status.
      # @todo standarize colors across all terminal
      local          meta='%f'     # default foreground
      local         clean='%002F'  # green foreground
      local      nobranch='%003F'  # yellow foreground
      local        staged='%002F'  # green foreground
      local      modified='%003F'  # yellow foreground
      local     untracked='%004F'  # blue foreground
      local    conflicted='%001F'  # red foreground
      local  local_branch='%003F'  # yellow
      local remote_branch='%004F'  # cyan
      local        remote='%012F'  # dark cyan
      local       stashes='%005F'  # purple
      local         email='%244F'  # grey
    else
      # Styling for incomplete and stale Git status.
      # Everything is grey
      local          meta='%244F'
      local         clean='%244F'
      local      nobranch='%244F'
      local      modified='%244F'
      local     untracked='%244F'
      local    conflicted='%244F'
      local  local_branch='%244F'
      local remote_branch='%244F'
      local        remote='%244F'
      local       stashes='%244F'
      local         email='%244F'
    fi

    local res
    local where  # branch or tag

    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      res+="${local_branch}${POWERLEVEL9K_VCS_BRANCH_ICON}"
      where=${(V)VCS_STATUS_LOCAL_BRANCH}
    elif [[ -n $VCS_STATUS_TAG ]]; then
      res+="${meta}#"
      where=${(V)VCS_STATUS_TAG}
    fi

    # If local branch name or tag is at most 50 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    (( $#where > 50 )) && where[13,-13]="…"
    res+="${local_branch}${where//\%/%%}"  # escape %

    # Display the current Git commit only if there is no branch or tag.
    if [[ -z $where ]]; then
      res+="${meta}${clean}${VCS_STATUS_COMMIT[1,8]} ${nobranch} "
    else
      # Show tracking branch name
      res+="${meta}  "
      if [[ -n ${VCS_STATUS_REMOTE_BRANCH} ]]; then

        remote_logo=''
        case $VCS_STATUS_REMOTE_URL in
          *github*) remote_logo='';;
          *bitbucket.org*) remote_logo='';;
        esac

        res+="${remote_logo} "
        res+="${remote_branch}${VCS_STATUS_REMOTE_NAME}"
        if [[ $VCS_STATUS_REMOTE_BRANCH != $where ]]; then
          # if the local and remote branch don't have same name, we should show both
          res+="${remote}/${VCS_STATUS_REMOTE_BRANCH}"
        fi
      else
        res+="${conflicted} "
      fi
    fi

    # 42 if behind the remote.
    (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${conflicted}${VCS_STATUS_COMMITS_BEHIND}"
    # 42 if ahead of the remote
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+=" ${clean}${VCS_STATUS_COMMITS_AHEAD}"

    (( VCS_STATUS_NUM_CONFLICTED || \
      VCS_STATUS_NUM_CONFLICTED || \
      VCS_STATUS_NUM_STAGED || \
      VCS_STATUS_NUM_UNSTAGED || \
      VCS_STATUS_NUM_CONFLICTED || \
      VCS_STATUS_NUM_UNTRACKED )) && res+="${meta} |"

    # 'merge' if the repo is in an unusual state.
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
    # ~42 if have merge conflicts.
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted} ${VCS_STATUS_NUM_CONFLICTED}"
    # +42 if have staged changes.
    (( VCS_STATUS_NUM_STAGED     )) && res+=" ${staged} ${VCS_STATUS_NUM_STAGED}"
    # !42 if have unstaged changes.
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified} ${VCS_STATUS_NUM_UNSTAGED}"
    # Untracked files
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"

    # "─" if the number of unstaged files is unknown (can happen due to some settings)
    (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

    #   42 if have stashes.
    (( VCS_STATUS_STASHES        )) && res+="${meta} | ${stashes} ${VCS_STATUS_STASHES}"

    # User email
    # res+="${meta} | ${email} $(git config user.email)"
    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null

  # Enable counters for untracked, staged, unstaged, etc (negative num means infinity)
  # Note: set to real number if there are performance problems
  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

  # Don't show git prompt in these directories
  # Multiple patterns can be combined with '|': '~|~/some/dir'.
  # typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

  # Disable the default git status formatter, and install our own
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'

  # Custom icon, suffix, and color
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=  #''
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=255
  typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=244
  typeset -g POWERLEVEL9K_VCS_SUFFIX=

  # Enable vcs prompt for repos of these types
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  # This is used as fallback when gitstatusd fails
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=178

  ##########################[ status: exit code of the last command ]###########################
  # Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL states for styling
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

  # Status on success. No content, just an icon.
  typeset -g POWERLEVEL9K_STATUS_OK=true
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=71
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION=' '

  # Status when some part of a pipe command fails but the overall exit status is zero.
  # It may look like this: 1|0.
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=179
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION=' '

  # Status when it's just an error code (e.g., '1').
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=167
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION=' '

  # Status when the last command was terminated by a signal.
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=167
  # Use terse signal names: "INT" instead of "SIGINT(2)".
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION=' '

  # Status when some part of a pipe command fails and the overall exit status is also non-zero.
  # It may look like this: 1|0.
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=167
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION=' '

  ###################[ command_execution_time: duration of the last command ]###################
  # Show duration of the last command only if takes longer than this many seconds.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
  # Show this many fractional digits (zero means round to seconds)
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  # Execution time color.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=244
  # Duration format: 1d 2h 3m 4s.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  # Custom icon.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=

  #######################[ background_jobs: presence of background jobs ]#######################
  # Show the number of background jobs (true), or just the icon (false)
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=244
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION=' '

  #######################[ direnv: direnv status (https://direnv.net/) ]########################
  typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=179
  typeset -g POWERLEVEL9K_DIRENV_VISUAL_IDENTIFIER_EXPANSION=''
  typeset -g POWERLEVEL9K_DIRENV_PREFIX=' '

  ###############[ asdf: asdf version manager (https://github.com/asdf-vm/asdf) ]###############
  # Default asdf color. Only used to display tools for which there is no color override (see below).
  typeset -g POWERLEVEL9K_ASDF_FOREGROUND=66

  # Hide tool versions that don't come from one of these sources.
  # Note: If this parameter is set to (shell local global), it won't hide tools.
  # Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_SOURCES.
  typeset -g POWERLEVEL9K_ASDF_SOURCES=(shell local global)

  # If set to false, hide tool versions that are the same as global.
  # If set to true, don't hide any tools
  # Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_PROMPT_ALWAYS_SHOW.
  typeset -g POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false

  # If set to false, hide tool versions that are equal to "system".
  # If set to true, don't hide any tools
  # Tip: Override this parameter for ${TOOL} with POWERLEVEL9K_ASDF_${TOOL}_SHOW_SYSTEM.
  typeset -g POWERLEVEL9K_ASDF_SHOW_SYSTEM=true

  # If set to non-empty value, hide tools unless there is a file matching the given pattern
  # Note: If this parameter is set to empty value, it won't hide tools.
  typeset -g POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=

  ###########################[ vim_shell: vim shell indicator (:sh) ]###########################
  # Vim shell indicator color.
  typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=34

  ##################################[ context: user@hostname ]##################################
  # Context color when running with privileges.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=9
  # Context color in SSH without privileges.
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=180
  # Default context color (no privileges, no SSH).
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=5

  # Context format when running with privileges: bold user@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%B%n@%m'
  # Context format when in SSH without privileges: user@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
  # Default context format (no privileges, no SSH): user@hostname.
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

  ###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
  # Python virtual environment color.
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=37
  # Show Python version next to the virtual environment name.
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true
  # Separate environment name from Python version only with a space.
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

  #[ aws: aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) ]#
  # Show aws only when the the command you are typing invokes one of these tools.
  # Tip: Remove the next line to always show aws.
  typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|terraform|pulumi'

  typeset -g POWERLEVEL9K_AWS_CLASSES=(
      # '*prod*'  PROD    # These values are examples that are unlikely
      # '*test*'  TEST    # to match your needs. Customize them as needed.
      '*'       DEFAULT)
  typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=208

  ####################################[ time: current time ]####################################
  # Current time color.
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=250
  # Format for the current time: 09:51:02. See `man 3 strftime`.
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%I:%M:%S %p}'
  # If set to true, time will update when you hit enter.
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=true
  typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=

  ###############################[ you_have_mail: mail status ]###############################

  # typeset -g POWERLEVEL9K_YOU_HAVE_MAIL_PREFIX=' '
  # typeset -g POWERLEVEL9K_YOU_HAVE_MAIL_SUFFIX=' '
  function prompt_you_have_mail() {
    mail -e && p10k segment -f 'cyan' -i ' '
    [[ -f ~/mbox ]] && p10k segment -f 'grey' -i ' '
  }

  function prompt_login_banner() {
  }


  ###############################[ git_diff_shortstat: status ]###############################

  function prompt_git_diff_shortstat() {
    if ! git rev-parse &>/dev/null; then
      return
    fi
    str="$(git diff --shortstat | perl -ne 'print "$2$1 " while m/(\d+) \w+\(([+-])\)?/g' | perl -pe 's/(\+\d+)/%F{green}$1%f/; s/(-\d+)/%F{red}$1%f/')"
    if [[ -z $str ]]; then
      str=" "
    else
      str=" %F{white}|%f %B${str}%b"
    fi

    p10k segment -i $str
  }

  typeset -g POWERLEVEL9K_GIT_DIFF_SHORTSTAT_SUFFIX=$'\n'

  # Change prompt after typing command (off|always|same-dir)
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

  # Instant prompt mode (off|quiet|verbose)
  # https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # Change options on the fly (adds 1-2ms delay to prompt)
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # If p10k is already loaded, reload configuration (works even if hot reload is off)
  (( ! $+functions[p10k] )) || p10k reload
}

# Tell `p10k configure` which file it should overwrite.
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
