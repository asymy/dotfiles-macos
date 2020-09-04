# Path to your oh-my-zsh installation.
export ZSH="/Users/alisonsymon/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW="true"
SPACESHIP_TIME_FORMAT="%T"
SPACESHIP_BATTERY_SHOW="true"
SPACESHIP_BATTERY_THRESHOLD=90
SPACESHIP_PROMPT_ORDER=(
    time          # Time stamps section
    #  user          # Username section
    dir           # Current directory section
    #  host          # Hostname section
    git           # Git section (git_branch + git_status)
    #  hg            # Mercurial section (hg_branch  + hg_status)
    #  package       # Package version
    #  node          # Node.js section
    #  ruby          # Ruby section
    #  elixir        # Elixir section
    #  xcode         # Xcode section
    #  swift         # Swift section
    #  golang        # Go section
    #  php           # PHP section
    #  rust          # Rust section
    #  haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    #  aws           # Amazon Web Services section
    #  gcloud        # Google Cloud Platform section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    #  dotnet        # .NET section
    #  ember         # Ember.js section
    #  kubectl       # Kubectl context section
    #  terraform     # Terraform workspace section
    exec_time     # Execution time
    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    line_sep      # Line break
    char          # Prompt character
)

COMPLETION_WAITING_DOTS="true"

plugins=(
    brew
    colorize
    common-aliases
    copyfile
    sudo
    web-search
    zshnotes
    git
    extract
    rsync
    nmap
    python
    pip
    docker
    tmux
    zsh-safe-rm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Alison Useful variables
alias todo="nvim /Users/alisonsymon/nextCloud/tank/vimwiki/txt/TODOs.wiki"
export TODO="/Users/alisonsymon/nextCloud/tank/vimwiki/txt/TODOs.wiki"

alias nvimconfig='${=EDITOR} ${HOME}/.config/nvim/init.vim'
alias zshconfig='${=EDITOR} ${HOME}/.zshrc'
export NVIM=~/.config/nvim/init.vim
export ZSHCONFIG=~/.zshrc
export BIB=/Users/alisonsymon/nextCloud/tank/readings/global.bib

export PATH="/Users/alisonsymon/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/Users/alisonsymon/Library/Python/3.8/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# conda initialize
__conda_setup="$('/Users/alisonsymon/tools/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alisonsymon/tools/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/alisonsymon/tools/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alisonsymon/tools/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

setopt autocd
