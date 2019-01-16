# Defined in - @ line 0
function docker_remove_old --description 'alias docker_remove_old sudo docker rm (sudo docker ps -aq --filter "status=exited")'
	sudo docker rm (sudo docker ps -aq --filter "status=exited") $argv;
end
