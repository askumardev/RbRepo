# Ruby program to add two matrices

Matrix1 = Array.new(2){Array.new(2)};
Matrix2 = Array.new(2){Array.new(2)};
Matrix3 = Array.new(2){Array.new(2)};

printf "Enter elements of MATRIX1:\n";
i = 0;
while (i < 2) 
  j = 0;
  while (j < 2) 
    printf "ELEMENT [%d][%d]: ", i, j;
    Matrix1[i][j] =  gets.chomp.to_i;
    j = j + 1;
  end
  i = i + 1;
end

printf "Enter elements of MATRIX2:\n";
i = 0;
while (i < 2) 
  j = 0;
  while (j < 2) 
    printf "ELEMENT [%d][%d]: ", i, j;
    Matrix2[i][j] =  gets.chomp.to_i;
    j = j + 1;
  end
  i = i + 1;
end


#Addition of Matrix1 and Matrix2.
i = 0;
while (i < 2)
  j = 0;
  while (j < 2) 
    Matrix3[i][j] = Matrix1[i][j] + Matrix2[i][j];
    j = j + 1;
  end
  i = i + 1;
  print "\n";
end

printf "MATRIX1:\n";
i = 0;
while (i < 2)
  j = 0;
  while (j < 2) 
    print Matrix1[i][j]," ";
    j = j + 1;
  end
  i = i + 1;
  print "\n";
end

printf "MATRIX2:\n";
i = 0;
while (i < 2)
  j = 0;
  while (j < 2) 
    print Matrix2[i][j]," ";
    j = j + 1;
  end
  i = i + 1;
  print "\n";
end

printf "Addition of Matrix1 and Matrix2:\n";
i = 0;
while (i < 2)
  j = 0;
  while (j < 2) 
    print Matrix3[i][j]," ";
    j = j + 1;
  end
  i = i + 1;
  print "\n";
end
