function parseroman(r::String)
    const RD = ["I" => 1, "V" => 5, "X" => 10, "L" => 50,
                "C" => 100, "D" => 500, "M" => 1000]
    maxval = 0
    accum = 0
    for d in reverse(split(uppercase(r), ""))
        if !(d in keys(RD))
            throw(DomainError())
        end
        val = RD[d]
        if val > maxval
            maxval = val
        end
        if val < maxval
            accum -= val
        else
            accum += val
        end
    end
    return accum
end

open("input.txt","r") do f
    for line in eachline(f)
        print(chomp(line), "=> ")
        i = try
            parseroman(chomp(line))
        catch
            "Invalid"
        end
        println(i)
    end
end
