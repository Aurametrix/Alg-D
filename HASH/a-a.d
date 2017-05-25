 char[] key = fields.data[keyFieldIndex];
 long fieldValue = fields.data[valueFieldIndex].to!long;

 if (auto sumValuePtr = key in sumByKey) *sumValuePtr += fieldValue;
 else sumByKey[key.to!string] = fieldValue;
