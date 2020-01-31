################### BUILD ###########################
# This script should build the site for you, if you #
# are using it to test on your system you should    #
# run it with the serve directive as shown below    #
#                                                   #
# ./build.sh serve                                  #
#                                                   #
# This should host the planning wiki on             #
#    127.0.0.1:4000                                 #
#####################################################

# Your context should not be set, this is for our CI
echo "$CONTEXT"

# This is for CI only
if [ "$CONTEXT" = "branch-deploy" ] 
then
    echo "deploy branch"
    bundle exec jekyll build --config _config_testing.yml
    exit
fi
if [ "$CONTEXT" = "deploy-preview" ] 
then 
    echo "deploy preview"
    bundle exec jekyll build --config _config_testing.yml
    exit
fi


bundle update
bundle install
if [ ! $? -eq 0 ]
then
    #Looks like bundler didn't install something, probably should try it with ruby
    sudo gem install
fi
# Should now build
if [ $1 = "serve" ]
then
    bundle exec jekyll serve
else
    bundle exec jekyll build
fi

