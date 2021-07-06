#Import Flux
using Flux

#Create some train data
x = rand(5)
y = rand(2)

#Define your model
modelx(x) = W*x .+ b

#Set initial random weights for your model
W = rand(2, 5)
b = rand(2)

#Define a loss function
function loss(x, y)
    ŷ = modelx(x)
    sum((y .- ŷ).^2)
  end

#Set an optimiser
opt = Descent(0.1)

#Zip the train data
data = zip(x, y)

# Track the derivatives of W and b
ps = Flux.params([W, b])

# Training process
for d in data
  gs = Flux.gradient(ps) do
    loss(d...)
  end
  Flux.Optimise.update!(opt, ps, gs)
end

# Execute one training step using the train! function
Flux.train!(loss, Flux.params(model), data, opt)
