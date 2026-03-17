function ghcommit --description "Opens the specified commit in the browser"
  set ref (if set -q argv[1]; echo $argv[1]; else; echo HEAD; end)
  set commit (git rev-parse $ref)
  set repo_url (gh repo view --json url -q ".url")
  set commit_url "$repo_url/commit/$commit"
  open $commit_url
end
