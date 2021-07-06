abstract type Animal end

struct dog
    name::String
    age::Int64
end

name(d::dog) = d.dog
age(d::dog) = d.dog
