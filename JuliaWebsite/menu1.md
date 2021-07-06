+++
title = "Initiation"
subtitle = "How to code in Julia simple ?&"
+++
@def tags = ["syntax", "code"]

# The extremely simple way to Start

\toc

## The famous hello world

To write the *hello world* progam, is simple, you just need to write that line :

```julia:./basic/helloworld.jl

println("Hello world")

```

and the result is :

\output{./basic/helloworld.jl}

@@colbox-blue
in Julia `print` and `println()` can print things. The first print not return in line when the line is done, the second yes.
@@

## The variables

In Julia, you have two way to write one variable.

### Untyped Variable

The first is to dont reveal type of variable like this example.

```julia:./basic/untypevariable.jl
a = 0
b = "hello"
println(a);
println(typeof(a))
println(typeof(b))

```
and the result is :

\output{./basic/untypevariable.jl}

Here, Julia regognize the type for the variable.

### Typed Variable

If you prefere, yout can control the variable type with one declaration.

```julia:./basic/typedvariable.jl
a::Int64 = 0
b::String = "hello"
println(a);
println(b);
println(typeof(a))
println(typeof(b))
```

and the result is :

\output{./basic/typedvariable.jl}

@@colbox-blue
Note : In this Franklin's version, the declaration is not possible. But probably in next update.
@@

To see all we can do with type, i invite you to refere in [this documentation's part](https://docs.julialang.org/en/v1/manual/types/).

## condition and loop


If you would like to show code as well as what the code outputs, you only need to specify where the script corresponding to the code block will be saved.

Indeed, what happens is that the code block gets saved as a script which then gets executed.
This also allows for that block to not be re-executed every time you change something _else_ on the page.

Here's a simple example (change values in `a` to see the results being live updated):

```julia:./exdot.jl
using LinearAlgebra
a = [1, 2, 3, 3, 4, 5, 2, 2, 4, 5]
@show dot(a, a)
println(dot(a, a))
```

You can now show what this would look like:

\output{./exdot.jl}

**Notes**:
* you don't have to specify the `.jl` (see below),
* you do need to explicitly use print statements or `@show` for things to show, so just leaving a variable at the end like you would in the REPL will show nothing,
* only Julia code blocks are supported at the moment, there may be a support for scripting languages like `R` or `python` in the future,
* the way you specify the path is important; see [the docs](https://tlienart.github.io/franklindocs/code/index.html#more_on_paths) for more info. If you don't care about how things are structured in your `/assets/` folder, just use `./scriptname.jl`. If you want things to be grouped, use `./group/scriptname.jl`. For more involved uses, see the docs.

Lastly, it's important to realise that if you don't change the content of the code, then that code will only be executed _once_ even if you make multiple changes to the text around it.

Here's another example,

```julia:./code/ex2.jl
using Images, Statistics, ImageBinarization, ImageEdgeDetection
begin
    cactus = Gray.(load("..\\imageprocess\\IMG_3514.JPG"))
end

corners = fastcorners(cactus, 10, 0.1)
img_copy = RGB.(cactus)
#img_copy[corners] .= RGB(1.0, 0.0, 0.0)
img_copy

edge = detect_edges(cactus, Canny(spatial_scale = 2.5, low = ImageEdgeDetection.Percentile(5), high = ImageEdgeDetection.Percentile(90)))

mosaic(cactus, img_copy, edge, nrow=1)
```

which gives the (utterly useless):

\output{./code/ex2}

note the absence of `.jl`, it's inferred.

You can also hide lines (that will be executed nonetheless):

```julia:./code/ex3
using Random
Random.seed!(1) # hide
@show randn(2)
```

\output{./code/ex3}


## Including scripts

Another approach is to include the content of a script that has already been executed.
This can be an alternative to the description above if you'd like to only run the code once because it's particularly slow or because it's not Julia code.
For this you can use the `\input` command specifying which language it should be tagged as:


\input{julia}{/_assets/scripts/script1.jl} <!--_-->


these scripts can be run in such a way that their output is also saved to file, see `scripts/generate_results.jl` for instance, and you can then also input the results:

\output{/_assets/scripts/script1.jl} <!--_-->

which is convenient if you're presenting code.

**Note**: paths specification matters, see [the docs](https://tlienart.github.io/franklindocs/code/index.html#more_on_paths) for details.

Using this approach with the `generate_results.jl` file also makes sure that all the code on your website works and that all results match the code which makes maintenance easier.
