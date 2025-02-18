# Dotfiles

My personal configuration files managed using a bare git repository.

## Setup
To set up these dotfiles on a new system:

\`\`\`bash
# Clone the repo as a bare repository
git clone --bare https://github.com/YOUR_USERNAME/dotfiles.git /home/patrick/.dotfiles

# Create the alias
alias dotfiles='/usr/bin/git --git-dir=/home/patrick/.dotfiles/ --work-tree=/home/patrick'

# Checkout the files
dotfiles checkout

# Hide untracked files
dotfiles config --local status.showUntrackedFiles no
\`\`\`

