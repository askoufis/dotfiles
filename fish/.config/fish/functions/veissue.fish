function veissue --description "Checks to see if a Vanilla Extract issue is open or not"
    # Check if an issue number was provided
    if test (count $argv) -eq 0
        echo "Usage: check_ve_issue <issue_number>"
        return 1
    end

    set issue_number $argv[1]

    # Validate that the input is a number
    if not string match --quiet --regex '^\d+$' $issue_number
        echo "Error: '$issue_number' is not a valid issue number."
        return 1
    end

    set api_url "https://api.github.com/repos/vanilla-extract-css/vanilla-extract/issues/$issue_number"

    # Fetch issue data from GitHub API
    set response (curl --silent --header "Accept: application/vnd.github+json" $api_url)

    # Check if the issue was found
    if echo $response | grep --quiet '"message": "Not Found"'
        echo "Issue #$issue_number does not exist in the vanilla-extract repo."
        return 1
    end

    # Extract the state from the response
    set state (echo $response | jq -r '.state')

    set issue_url "https://github.com/vanilla-extract-css/vanilla-extract/issues/$issue_number"

    if test "$state" = "open"
        echo "🟢 Issue #$issue_number is OPEN → $issue_url"
    else
        echo "🔴 Issue #$issue_number is CLOSED → $issue_url"
    end
end
