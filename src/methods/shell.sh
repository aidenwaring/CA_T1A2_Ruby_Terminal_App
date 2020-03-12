echo "Thanks for using the Aidos IT helpdesk."
echo "Beginning installation."
git clone "https://github.com/aidenwaring/helpdesk_terminal.git"
cd helpdesk_terminal/src
echo "Bundling install files."
bundle install
echo "Bundle complete. Running program."
ruby compAgainstDevs.rb