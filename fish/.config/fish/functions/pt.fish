function pt
  set package_name $argv[1]
  set package_version $argv[2]

  npm view $package_name time"[$package_version]"
end
