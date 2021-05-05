# Same as mkdir -p + touch
touch_p() {
  mkdir -p `dirname $1`
  touch $1
}
