if status is-interactive
  if not set -q SSH_CONNECTION
    function starship_transient_prompt_func
      starship module character
    end
    starship init fish | source
    enable_transience

  else
    set fish_greeting
  end

  direnv hook fish | source

  export PATH="$PATH:/etc/nixos/scripts"
  export PATH="$PATH:/etc/nixos/bins"

  alias e='develop.sh'
  alias ge='develop.sh -l'
end
