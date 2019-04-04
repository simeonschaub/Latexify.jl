const si_prefixes = Dict(
    -24 => "\\yocto",
    -21 => "\\zepto",
    -18 => "\\atto",
    -15 => "\\femto",
    -12 => "\\pico",
     -9 => "\\nano",
     -6 => "\\micro",
     -3 => "\\milli",
     -2 => "\\centi",
     -1 => "\\deci",
      0 => "",
      1 => "\\deca",
      2 => "\\hecto",
      3 => "\\kilo",
      6 => "\\mega",
      9 => "\\giga",
     12 => "\\tera",
     15 => "\\peta",
     18 => "\\exa",
     21 => "\\zetta",
     24 => "\\yotta"
    )

# for dB and Bel
function unit_to_latex(u::Unitful.MixedUnits{<:Gain{Unitful.LogInfo{T,_1,_2}}}) where {T,_1,_2}
    return lowercase(string("\\", T)) * unit_to_latex(u.units)
end

function unit_to_latex(::Unitful.FreeUnits{U}) where U
    return join(unit_to_latex.(U))
end

function _format_unit(s, pow)
    if pow == 1
        return s
    elseif pow == -1
        return "\\per$s"
    elseif denominator(pow) == 1
        return "$s\\tothe{$(numerator(pow))}"
    end

    return "$s\\tothe{$(numerator(pow))/$(denominator(pow))}"
end

function unit_to_latex(u::Unitful.Unit{U}) where U
    return _format_unit(si_prefixes[u.tens] * lowercase(string("\\", U)), u.power)
end

function unit_to_latex(u::Unitful.Unit{:eV}) where U
    return _format_unit(si_prefixes[u.tens] * "\\electronvolt", u.power)
end

function unit_to_latex(u::Unitful.FreeUnits{(Unitful.Unit{:Kelvin,Unitful.𝚯}(0,1),),<:Any,Unitful.Affine{-5463//20}})
    return "\\degreeCelsius"
end


function _format_measurement(val, err)
end
