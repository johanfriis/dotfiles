if status is-interactive
    # Commands to run in interactive sessions can go here

    if test -z (pgrep -n ssh-agent)
        eval (ssh-agent -c) >/dev/null
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    end

    starship init fish | source
    zoxide init --cmd j fish | source

end
