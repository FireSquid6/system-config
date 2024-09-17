if status is-interactive
  function starship_transient_prompt_func
    starship module character
  end
  starship init fish | source
  enable_transience

  set fish_greeting

  export PATH="$PATH:/etc/nixos/scripts"
  export PATH="$PATH:/etc/nixos/bins"

  direnv hook fish | source


  alias e='develop.sh'
  alias ge='develop.sh -l'
end
