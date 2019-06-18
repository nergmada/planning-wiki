if $CONTEXT == "branch-deploy" then
    bundle exec jekyll build --config _config_testing.yml
elif $CONTEXT == "deploy-preview" then 
    bundle exec jekyll build --config _config_testing.yml
else
    bundle exec jekyll build
fi