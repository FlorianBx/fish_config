export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if status is-interactive
	# Commands to run in interactive sessions can go here
	alias de="cd /Users/florian/Documents/dockerDevEnvironment && docker-compose up -d && docker-compose exec neovim fish"
	alias p="pnpm"
	alias pu="pnpm add -g pnpm" # pnpm update
	alias prd="pnpm run dev"
	alias prt="pnpm run test"
	alias prtc="pnpm run test:coverage"
	alias rtj="~/Documents/Development/scripts/rtj.sh"
	alias vt="~/Documents/Development/scripts/vtj.sh"
	alias nn="nvim ."
	alias n="nvim"
	alias nc="nvim ~/.config/nvim/"
	alias rl="source ~/.config/fish/config.fish; and clear; and echo '⚙️  Terminal reloaded ✅'"
	alias config="nvim ~/.config/fish/"
	alias suo="--set-upstream origin"
	alias act="act --container-architecture linux/arm64"
	alias bt="shortcuts run 'Turn the Desktop Light'"
	alias serv="browser-sync start --server --files \"*.html, css/*.css\""
	alias gcb="git checkout -b"
	alias gco="git checkout"
	alias gcm="git commit -m"
	alias gcl="git clone"
	alias gpl="git pull"
	alias gps="git push"
	alias ls="exa --icons --group-directories-first"
	alias ll="exa --icons --group-directories-first --long"
	alias la="exa --icons --group-directories-first --long --all"
	alias lsa="exa --icons --group-directories-first --long --all --sort=accessed"
	alias lsd="exa --icons --group-directories-first --long --all --sort=directory"
	alias lss="exa --icons --group-directories-first --long --all --sort=size"
	alias lsw="exa --icons --group-directories-first --long --all --sort=time"
	# alias rm="trash"
	# alias rma="trash-put"
	# alias rmd="trash-empty"

	# git
	set -x GIT_AUTHOR_NAME "Florian"
	set -x GIT_COMMITTER_NAME "Florian"
	set -x GIT_EMAIL "florian.bouron@gmail.com"

	# git end

	#`git log` with patches shown with difftastic.
	alias gdl="git -c diff.external=difft log -p --ext-diff"
	#Show the most recent commit with difftastic.
	alias gds="git -c diff.external=difft show --ext-diff"
	#`git diff` with difftastic.
	alias gft="git -c diff.external=difft diffalias cleanup=\"~/usr/local/bin/cleanup.sh\""

end

# fnm is a Node.js version manager like nvm
fnm env | source

set PATH ~/Documents/Development/sandbox/flutter/core/ $PATH
# set -o vi
export PATH="$HOME/.cargo/bin:$PATH"

# Crée un alias pour cloner un projet Git à partir de GitHub
function new
	if test -z $argv
		echo "Usage: new YOUR_PROJECT_NAME"
	else
		git clone git@github.com:FlorianBx/react-typescript-starter.git $argv
	end
end

#  bun
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME /Users/florian/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
	set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bin directory
set -gx PATH "$HOME/bin" $PATH

# bin directory end
fish_vi_key_bindings

function fish_user_key_bindings
	fish_vi_key_bindings
	bind -M insert -m default jj backward-char force-repaint
	bind -M insert \t accept-autosuggestion
end

set fish_key_bindings fish_user_key_bindings

thefuck --alias | source
