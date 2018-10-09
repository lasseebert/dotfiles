# Defined in /tmp/fish.j9OuUl/global_alias.fish @ line 1
function global_alias --description 'Creates and alias and saves it as a function in the fish config dir'
	alias $argv
  and funcsave $argv[1]
end
