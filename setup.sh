################# SETUP SCRIPT ##########################
# If you don't have ruby on rails or jekyll installed on#
# your system, this script will automatically set it up #
# for you and set a standard configuration.             #
#########################################################

sudo apt-get install ruby-full build-essential zlib1g-dev
#Apparently you should install ruby gems to a home directory, not to your root
# (this is news to me!)
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

#Now we install the ruby and jekyll gems (think npm packages)
gem install jekyll bundler