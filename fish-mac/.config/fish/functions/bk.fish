function bk
    set -l GITHUB_URL (gh browse -n)
    set -l re "^https:\/\/github.com\/(seekasia|SEEK-Jobs)\/([-a-zA-Z0-9]+)"
    set -l branch (git rev-parse --abbrev-ref HEAD)

    set -l match (string match -r $re $GITHUB_URL)

    if set -q match[1]
        if test $match[2] = "seekasia"
            set buildkite_org "seek-asia"
        else if test $match[2] = "SEEK-Jobs"
            set buildkite_org "seek"
        else
            return
        end 

        set -l url "https://buildkite.com/$buildkite_org/$match[3]/builds?branch=$branch"
        echo "Opening $url"
        open $url
    end 
end
