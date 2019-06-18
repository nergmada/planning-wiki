if [$CONTEXT == "branch-deploy"] 
then
    echo "deploy branch"
    bundle exec jekyll build --config _config_testing.yml
    exit
fi
if [$CONTEXT == "deploy-preview"] 
then 
    echo "deploy preview"
    bundle exec jekyll build --config _config_testing.yml
    exit
fi

bundle exec jekyll build