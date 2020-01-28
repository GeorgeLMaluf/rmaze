class Labirinto
  def initialize (caminho)
    @caminho = caminho
    @maxlinha = @caminho.size;
    @maxcoluna = @caminho[@maxlinha - 1].size;
    @resolucao = Array.new(@maxlinha) { Array.new(@maxcoluna, false)}
  end

  def imprime 
    @caminho.each do | linha |
      linha.each do |coluna|
        case coluna
        when 1
          print "."
        when 0
          print "#"
        when 9
          print "G"
        end
      end
      puts ""
    end
  end

  def imprime_com_resolucao
    @caminho.each_index do |i|
      cur_linha = @caminho[i]
      cur_linha.each_index do |j|
        if (@caminho[i][j] == 1 && @resolucao[i][j])
          print (i == 0 && j == 0) ? "S" : "x"
        end
        if (@caminho[i][j] == 1 && !@resolucao[i][j])
          print "."
        end
        if (@caminho[i][j] == 0)
          print "#"
        end
        if (@caminho[i][j] == 9 && @resolucao[i][j])
          print "F"
        end
      end
      puts ""
    end
  end

  def resolve
    procura_caminho(0,0)
  end

  def procura_caminho(linha, coluna)
    return false unless pode_mover?(linha, coluna)

    @resolucao[linha][coluna] = true
    return true if @caminho[linha][coluna] == 9

    
    return true if procura_caminho(linha -1 , coluna)
    return true if procura_caminho(linha, coluna + 1)
    return true if procura_caminho(linha + 1, coluna)
    return true if procura_caminho(linha, coluna - 1)

    @resolucao[linha][coluna] = false
    false
  end

  def pode_mover?(l, c)
    l.between?(0, @maxlinha-1) &&
    c.between?(0, @maxcoluna-1) &&
    @caminho[l][c] != 0 &&
    !@resolucao[l][c]
  end

end