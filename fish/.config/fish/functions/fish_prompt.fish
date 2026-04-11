function fish_prompt
  # Prefix git status with a space to prevent extra space when no branch is present
  prmt --code $status --no-version '{path:blue}{git:white:: } {ok:magenta:❱}{fail:red:❱} '
end
