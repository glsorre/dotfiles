printf "${BLUE}%s${NORMAL}\n" "Updating Dotfiles..."
cd "$DOTFILES"
if ./dotfiles -u
then
  printf "${BLUE}%s\n" "Hooray! Dotfiles has been updated."
else
  printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
