function awsauth
    bash -c "/opt/homebrew/opt/awsauth/bin/auth.sh $argv"
    if test -r $HOME/.aws/sessiontoken
        bash -c ". $HOME/.aws/sessiontoken"
    end
end
