# Defined in /tmp/fish.1M2K6P/curl_weather.fish @ line 2
function curl_weather --description 'alias curl_weather curl https://v2.wttr.in'
	curl "https://v2.wttr.in/$argv"
end
