function gwj
  set -l query $argv[1]
  set -l out (
    git worktree list |
    # Pass the query to fzf, auto-accept if there's only one option
    fzf --preview='git log --oneline -n10 {2}' --query "$query" -1 |
    awk '{print $1}'
  )
  cd $out
end
