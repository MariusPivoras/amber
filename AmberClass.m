classdef AmberClass
   properties
      class
      sum=0
   end
   methods (Static)
      function sum = classCount(count)
         sum = count + 1;
      end
   end
end
