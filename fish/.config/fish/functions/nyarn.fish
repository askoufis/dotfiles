function nyarn
    if test -e ./.nvmrc
        nvm install
    end
    yarn
end
