''programma: Quiz 2 del Day 2 di Advent of Code 2019
''autore:    Luca Evangelisti
''data:      12 dicembre 2019
''web:       https://ciucoinformatico.home.blog/

dim shared array() as integer ''array vuoto
dim shared address as integer
dim shared value as integer
dim as integer opcode

''dichiarazione procedura intcode
declare sub reset_intcode

address = 0
opcode = 0
value = 0

''ciclo per il parametro "verbo" (verb)
for i as integer = 0 to 99

  ''ciclo per il parametro "sostantivo" (noon)
  for j as integer = 0 to 99

    ''chiamata della procedura intcode reset input)
    reset_intcode

    array(2) = i ''verb
    array(1) = j ''noon

    address = 0
    do
      opcode = array(address)
      select case opcode
        case 1 ''somma
          array(array(address +3)) = array(array(address + 1)) + array(array(address + 2))
        case 2 ''moltiplica
          array(array(address +3)) = array(array(address + 1)) * array(array(address + 2))
        case 99 ''esce dal programma intcode
          exit do
        case else ''caso non previsto
          print "opcode non previsto"
      end select
      address += 4
    loop until address > ubound(array)
    
    if array(0) = 19690720 then
      ''domanda del quiz 2 del Day 2
      print "What is 100 * noun + verb?"; 100 * array(1) + array(2)
    else
      ''non fare nulla
    end if
    
  next j

next i

''definizione procedura intcode
sub reset_intcode
  address = 0
  ''lettura del file e creazione del contenitore indicizzato (array)
  open "02_input.txt" for input as #1
    do until eof(1)    
      input #1, value ''lettura di un singolo valore
      redim preserve array (0 to address) ''ridimensionamento array
      array(address) = value
      address += 1
    loop
  close #1
end sub
