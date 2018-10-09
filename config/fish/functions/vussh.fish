# Defined in /tmp/fish.KznSON/vussh.fish @ line 2
function vussh --description 'alias vussh=vagrant up ;and vagrant ssh'
	vagrant up ;and vagrant ssh $argv;
end
