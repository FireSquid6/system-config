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


  alias ea='NVIM_APPNAME=astro-nvim nvim'
  alias e='NVIM_APPNAME=ink-nvim nvim'
end
