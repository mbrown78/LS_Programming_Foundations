def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
# if_this_is_a_true_value ? then_the_result_is_this : else_it_is_this
# The value returned from the foo method will always be "yes" , # and "yes" == "no" will be false.

p bar('no') # > yes
p bar('yes') # > no
p bar(foo) # > no
