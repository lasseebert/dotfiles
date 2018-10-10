# Defined in - @ line 0
function vhussh --description 'alias vhussh vagrant halt ;and vagrant up ;and vagrant ssh'
	vagrant halt ;and vagrant up ;and vagrant ssh $argv;
end
