# prompt.zsh


# %m       - first element of the hostname
# %#       - "#" when super user, otherwise "%"
# %~       - current working directory, shortening home to ~
# %2~      - like %~, but show only last 2 elements
# %F{blue} - switch to color blue (black, red, green, yellow, blue, magenta, cyan and white)
# %F{114}  - 0..255, 256 color pallet
# %f       - switch to default color
# %B...%b  - bold font
# %?       - previous command’s exit code
# %(?.<success>.<failure>)  - expression success when last command returned
#                             with exit code 0, otherwise failure expression
# %{$(iterm2_prompt_mark)%} - integration of iTerm2 for multi-line prompt
#                             see https://www.iterm2.com/documentation-shell-integration.html

NEW_LINE=$'\n'
PROMPT="%(?..%F{red}?%? )%f%B%F{magenta}%~%f%b${NEW_LINE}%# "


