if status is-interactive
  # Commands to run in interactive sessions can go here
  starship init fish | source
  zoxide init --cmd j fish | source
end
