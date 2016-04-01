class MyObject < ActiveRecord::Base
	validates :color,
    :inclusion  => { :in => [ 'red', 'green', 'blue' ],
    :message    => "%{value} is not a valid color class" }
end
