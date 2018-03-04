# `latexinline`
takes a Julia object `x` and returns a ``\LaTeX`` formatted string.
It also surrounds the output in a simple \$\$ environment.
This works for `x` of many types, including expressions, which returns ``\LaTeX`` code for an equation.


```julia-repl
julia> ex = :(x-y/z)
julia> latexinline(ex)
L"$x - \frac{y}{z}$"
```
In Jupyter or Hydrogen this automatically renders as:

$x - \frac{y}{z}$

Among the supported types are:
- Expressions,
- Strings,
- Numbers (including rational and complex),
- Symbols,
- Symbolic expressions from SymEngine.jl.
- ParameterizedFunctions.

It can also take arrays, which it recurses and latexifies the elements, returning an array of latex strings.

```julia
julia> arr = [1//3, "sin(x)"]
julia> latexinline(arr)

2-element Array{LaTeXStrings.LaTeXString,1}:
 L"$\frac{1}{3}$"         
 L"$\sin\left( x \right)$"
```
