#!/bin/bash

# Definir un diccionario que contiene los valores numéricos correspondientes a cada símbolo romano
declare -A roman_values=( ["I"]=1 ["V"]=5 ["X"]=10 ["L"]=50 ["C"]=100 ["D"]=500 ["M"]=1000 )

# Leer el número romano pasado como argumento
roman_number=$1

# Inicializar las variables
result=0
previous_value=0

# Recorrer cada símbolo del número romano en orden inverso
for ((i=${#roman_number}-1; i>=0; i--)); do
    # Obtener el valor numérico del símbolo actual
    current_value=${roman_values[${roman_number:$i:1}]}

    # Si el valor actual es menor que el valor anterior, restar
    if [ $current_value -lt $previous_value ]; then
        result=$((result-current_value))
    # De lo contrario, sumar
    else
        result=$((result+current_value))
    fi

    # Asignar el valor actual a la variable anterior
    previous_value=$current_value
done

# Mostrar el resultado
echo $result

