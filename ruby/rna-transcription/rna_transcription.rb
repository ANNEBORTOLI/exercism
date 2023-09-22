class Complement
  def self.of_dna(dna)
    rna = ''
    dna.each_char do |char|
      case char
      when 'G'
        rna += 'C'
      when 'C'
        rna += 'G'
      when 'T'
        rna += 'A'
      when 'A'
        rna += 'U'
      end
    end
    rna
  end
end
