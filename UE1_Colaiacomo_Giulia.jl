
#=
Fuege in dieses Template deine Loesungscodes ein.
Wichtig 1: Die Datei gemaess der Namensrichtlinien benennen.
Wichtig 2: Bitte nur die Funktionen ausprogrammieren und keine Funktionsaufrufe vornehmen.
=#


### Beispiel 1:

function greatest(x::Vector{T}, k::Integer = 1) :: Vector{T} where {T <: Real}
    # ich schaue ob k gueltig ist
k < 1 && error("k muss mindestens 1 sein")
k > length(x) && error("k kann nicht größer als length(x) sein")

# ich finde k groess (ordinati in modo decrescente)
massimi = sort(x, rev=true)[1:k]

# Filtere die ursprünglichen Elemente, die in den
# Maxima vorkommen (unter Beibehaltung der ursprünglichen 
#Reihenfolge des Arrays).
ergebnis = filter(n -> n in massimi, x)
    
    return ergebnis
end


### Beispiel 2

function nearestindex(x::Vector{<:Real}, y::Real) :: Int
   # ich berechne die abs. differenz mit y
differenze = abs.(x .- y)

# ich finde den Index/s mit dem geringsten Unterschied
minimo = minimum(differenze)
index_minimo = findall(diff -> diff == minimo, differenze)

# ich Waehlen einen zufälligen Index, wenn es mehr als einen gibt
return rand(index_minimo)
    
end


### Beispiel 3

function swap!(x::Vector, i::Integer, j::Integer) :: Nothing
    temporaneo = x[i]     # Ich speichere den ersten Wert in einer temporären Variablen
    x[i] = x[j]           # Ich kopiere den zweiten Wert an die Stelle des ersten
    x[j] = temporaneo     # Ich kopiere den gespeicherten Wert an die Stelle des zweiten
    nothing 

    return
end

function bubblesort!(x::Vector{<:Real}; rev::Bool = false) :: Nothing
    n = length(x)
    for _ in 1:n
        
        # Schritt 2: Ich vergleiche jedes Paar benachbarter Elemente
        for j in 1:n-1
            
            # Wenn ich absteigend sortieren möchte (rev=true)
            if rev == true
                if x[j] < x[j+1]            # Wenn der erste kleiner ist als der zweite
                    swap!(x, j, j+1)        # Ich tausche sie.
                end
            
            # Wenn ich aufsteigend sortieren möchte (normal)
            else
                if x[j] > x[j+1]            #Wenn der erste größer ist als der zweite
                    swap!(x, j, j+1)        
                end
            end
        end
    end
    nothing  
end


### Beispiel 4

function canonicaltour(x::Vector{T}) :: Vector{T} where {T <: Integer}
    n = length(x)

# Überprüfen, ob der Tour eine Permutation von 1 bis n ist
if sort(x) != collect(1:n)
    throw(ArgumentError("Der Tour muss alle Zahlen von 1 bis n enthalten, ohne Wiederholungen"))
end

# Position von 1 im ursprünglichen Tour finden
position_von_1 = findfirst(==(1), x)

# Tour im Uhrzeigersinn ab der Position von 1 neu zusammensetzen
tour_uhr = vcat(x[position_von_1:end], x[1:position_von_1-1])

# Tour umdrehen (für Gegenuhrzeigersinn)
tour_umgekehrt = reverse(x)

# Position von 1 im umgekehrten Tour finden
position_von_1_umgekehrt = findfirst(==(1), tour_umgekehrt)

# Umgekehrten Tour im Gegenuhrzeigersinn ab 1 zusammensetzen
tour_gegen = vcat(tour_umgekehrt[position_von_1_umgekehrt:end], tour_umgekehrt[1:position_von_1_umgekehrt-1])

# Den "kleineren" Tour wählen (nach dem zweiten Wert)
if length(tour_uhr) <= 2 || tour_uhr[2] < tour_gegen[2]
    return tour_uhr
else
    return tour_gegen
end
end


### Beispiel 5

function distance(x::Vector{<:Real}, y::Vector{<:Real}; p::Real = 2)
     length(x) == length(y) || throw(ArgumentError("Array mit unterschiedlicher Länge"))
    p > 0 || throw(ArgumentError("p muss positiv sein"))
    return sum(abs(x[i] - y[i])^p for i in eachindex(x))^(1/p)
end

