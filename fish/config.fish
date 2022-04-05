set -xa PATH ~/.nimble/bin

if status is-interactive
  starship init fish | source
end
