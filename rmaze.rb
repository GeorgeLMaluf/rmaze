require_relative 'labirinto'
 
@exemplo = [[1,1,1,1],
              [0,1,1,0],
              [0,1,0,1],
              [0,1,9,1],
              [1,1,1,1]]

l = Labirinto.new(@exemplo)
puts "Configuracao atual do labirinto"
l.imprime

if l.resolve
  puts "Labirinto resolvido"
  l.imprime_com_resolucao
end