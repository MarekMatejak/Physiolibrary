within Physiolibrary;
package Utilities
  function findIndex "Find index of string in array"
    input String searchName "String to find in Names";
    input String Names[:] "Array where to find a searchName";
    output Integer index "Index of searchName in Names";
  algorithm
      index := -1;
      for i in 1:size(Names,1) loop
        if ( Modelica.Utilities.Strings.isEqual(Names[i], searchName)) then
         index := i;
        end if;
      end for;
      assert(index > 0, "Name '" + searchName + "' is not present between Names\n");
  end findIndex;

 function findIndicesMatrix "Find indices matrix of names in array"
  input String columnNames[:] "Vector of column names [nF] or [nR]";
  input String rowNames[:] "Vector of row names [nC]";
  output Real matrix[size(rowNames,1), size(columnNames,1)] "matrix[i,j]=if rowNames[i]=columnNames[j] then 1 else 0";
 algorithm
    for r in 1:size(rowNames,1) loop
      for c in 1:size(columnNames,1) loop
        matrix[r,c]:=if (Modelica.Utilities.Strings.isEqual(rowNames[r], columnNames[c])) then 1 else 0;
      end for;
    end for;
 end findIndicesMatrix;
end Utilities;
