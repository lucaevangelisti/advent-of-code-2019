''programma: Quiz 1 del Day 2 di Advent of Code 2019
''autore:    Luca Evangelisti
''data:      12 dicembre 2019
''web:       https://ciucoinformatico.home.blog/

dim as integer array() ''array vuoto
dim as integer position
dim as integer value

position = 0
value = 0

''lettura del file e creazione del contenitore indicizzato (array)
open "02_input.txt" for input as #1

  do until eof(1)
  
    input #1, value ''lettura di un singolo valore
    redim preserve array (0 to position) ''ridimensionamento array
    array(position) = value

    position += 1

  loop

close #1

''restore the gravity assist program
array(1) = 12
array(2) = 2

''intcode program
position = 0
do

  value = array(position)
  
  select case value

    case 1 ''somma
      
      array(array(position +3)) = array(array(position + 1)) + array(array(position + 2))
    
    case 2 ''moltiplica
    
      array(array(position +3)) = array(array(position + 1)) * array(array(position + 2))
      
    case 99 ''esce dal programma intcode
      exit do
      
    case else ''caso non previsto
      print "opcode non previsto"
      
  end select

  position += 4
  
loop until position >= ubound(array)

''risposta del quiz 1 del Day 2
print "Il valore in posizione zero e':"; array(0)
