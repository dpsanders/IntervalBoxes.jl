
const where_bisect = 0.49609375


"""
    bisect(X::IntervalBox, α=0.49609375)

Bisect the `IntervalBox` `X` at position α ∈ [0,1] along its longest side.
"""
function bisect(X::IntervalBox, α=where_bisect)
    i = argmax(diam.(X))  # find longest side

    return bisect(X, i, α)
end

"""
    bisect(X::IntervalBox, i::Integer, α=0.49609375)

Bisect the `IntervalBox` in side number `i`.
"""
function bisect(X::IntervalBox, i::Integer, α=where_bisect)

    x1, x2 = bisect(X[i], α)

    X1 = setindex(X, x1, i)
    X2 = setindex(X, x2, i)

    return (X1, X2)
end
