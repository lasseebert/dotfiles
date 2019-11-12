# Defined in /tmp/fish.vmx2qT/ag.fish @ line 2
function ag --description 'alias ag ag --skip-vcs-ignores'
	command ag --skip-vcs-ignores --case-sensitive $argv;
end
