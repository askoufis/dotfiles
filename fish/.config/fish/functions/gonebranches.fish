function gonebranches
    git fetch -p
    echo "Dead branches:"
    for branch in (git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); echo $branch; end
end
