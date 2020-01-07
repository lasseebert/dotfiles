# Defined in /tmp/fish.73Atun/ag.fish @ line 2
function ag --description 'alias ag ag --skip-vcs-ignores'
	command ag --skip-vcs-ignores --case-sensitive --hidden --ignore .git $argv;
end
