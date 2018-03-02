#Programmatically determine if 42 lies between 10 and 100.

(10..100).include?(42)
# returns true

(10..100).cover?(42)
#Returns true if obj is between the begin and end of the range.
