#!/usr/bin/env ruby

loop do
	value = `/home/chad/temper1/temper1 -uF | awk -F, '{print $2}'`.gsub(/\s+/, "").to_f

	time = Time.new
	puts value.round(4).to_s + ',' + time.inspect
	sleep(1)
end
