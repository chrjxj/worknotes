# tmux usage #


### tmux 


- Ubuntu: `sudo apt-get install tmux` 
- Mac `brew install tmux`

### 常用命令

`https://youtu.be/Lqehvpe_djs`

`tmux new -s ABC`

`ctrl + d`: [detached (from session ABC)]


tmux attach -t ABC

Below are the most basic steps for getting started with Tmux:

On the command prompt, type tmux new -s my_session,
Run the desired program.
Use the key sequence Ctrl-b + d to detach from the session.
Reattach to the Tmux session by typing tmux attach-session -t my_session.


`ctrl + b + c`: 

Ctrl+b c Create a new window (with shell)
Ctrl+b w Choose window from a list
Ctrl+b 0 Switch to window 0 (by number )
Ctrl+b , Rename the current window
Ctrl+b % Split current pane horizontally into two panes
Ctrl+b " Split current pane vertically into two panes
Ctrl+b o Go to the next pane
Ctrl+b ; Toggle between the current and previous pane
Ctrl+b x Close the current pane


tmux config

```
# 0 is too far from ` ;)
set -g base-index 1

# Automatically set window title
set-window-option -g automatic-rename on
set-option -g set-titles on

#set -g default-terminal screen-256color
set -g status-keys vi
set -g history-limit 10000

setw -g mode-keys vi
setw -g mode-mouse on
setw -g monitor-activity on

bind-key v split-window -h
bind-key s split-window -v

bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
bind-key H resize-pane -L 5
bind-key L resize-pane -R 5

bind-key M-j resize-pane -D
bind-key M-k resize-pane -U
bind-key M-h resize-pane -L
bind-key M-l resize-pane -R

# Vim style pane selection
bind h select-pane -L
bind j select-pane -D 
bind k select-pane -U
bind l select-pane -R

# Use Alt-vim keys without prefix key to switch panes
bind -n M-h select-pane -L
bind -n M-j select-pane -D 
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# Use Alt-arrow keys without prefix key to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window

# No delay for escape key press
set -sg escape-time 0

# Reload tmux config
bind r source-file ~/.tmux.conf

# THEME
set -g status-bg black
set -g status-fg white
set -g window-status-current-bg white
set -g window-status-current-fg black
set -g window-status-current-attr bold
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=green](#S) #(whoami)'
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=white]%H:%M#[default]'
```

http://www.deanbodenham.com/downloads/basictmuxconf.txt

http://www.deanbodenham.com/downloads/tmuxconf2019.txt

### screen


