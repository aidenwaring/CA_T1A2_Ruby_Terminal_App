echo "Thanks for choosing to use OpenDesk."
echo "Beginning installation."
git clone "https://github.com/aidenwaring/helpdesk_terminal.git"
cd helpdesk_terminal/src
echo "Bundling install files."
bundle install
echo "Bundle complete. Running program."
ruby main.rb