function awsauth
    bash -c "~/code/aws-auth-bash/auth.sh $argv"
    if test -r $HOME/.aws/sessiontoken
        bash -c ". $HOME/.aws/sessiontoken"
    end
end
