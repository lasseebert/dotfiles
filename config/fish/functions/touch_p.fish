# Defined in /tmp/fish.hlOBEB/touch_p.fish @ line 2
function touch_p
	set -l file $argv[1]
  set -l dir (dirname $file)

  mkdir -p $dir
  touch $file
end
