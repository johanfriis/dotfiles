function cat --wraps=bat --description 'alias cat bat'
  bat --style="grid,changes" --tabs 2 --theme zenburn $argv
  # To take advantage of dark mode, use the following
  # alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
end

