set fish_greeting

if status is-interactive
  if not set -q SSH_CONNECTION


    function starship_transient_prompt_func
      starship module character
    end
    starship init fish | source
    enable_transience
  end

  direnv hook fish | source

  export PATH="$PATH:$SCRIPTS_DIR"
  export PATH="$PATH:$HOME/.bun/bin"

  alias e='develop.sh'
  alias ge='develop.sh -l'
end
